<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="交路ID" prop="groupId">
        <el-input
          v-model="queryParams.groupId"
          placeholder="请输入交路ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['train:trainGroup:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['train:trainGroup:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['train:trainGroup:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['train:trainGroup:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="trainGroupList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="交路ID" align="center" prop="groupId" />
      <el-table-column label="交路是否使用" align="center" prop="groupAvaliable" :formatter="groupAvaliableFormat"/>
      <el-table-column label="交路运行车辆" align="center" prop="usedTrain" />
      <el-table-column label="交路空闲车辆" align="center" prop="freeTrain" />
      <el-table-column label="交路描述" align="center" prop="groupNote" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['train:trainGroup:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['train:trainGroup:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改交路管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="交路是否开行" prop="isAvaliable">
          <el-radio-group v-model="form.isAvaliable">
            <el-radio :label="true" size="large">开行</el-radio>
            <el-radio :label="false" size="large">非开行</el-radio>
          </el-radio-group>
        </el-form-item>
<!--        <el-form-item label="运行车辆" prop="usedTrain">-->
<!--          <el-input v-model="form.usedTrain" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="空闲车辆" prop="freeTrain">-->
<!--          <el-input v-model="form.freeTrain" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="运行车辆" prop="usedTrain">
          <template>
            <el-select v-model="selectTrains"
                       multiple
                       style = "width:100%"
                       placeholder="请选择运行车辆">
              <el-option v-for="item in trainCityList"
                         :key="item.citytrainId"
                         :label="item.citytrainName"
                         :value="item.citytrainId"
                         >
              </el-option>
            </el-select>
          </template>
        </el-form-item>
        <el-form-item label="空闲车辆" prop="freeTrain">
          <template>
            <el-select v-model="freeTrains"
                       multiple
                       style = "width:100%"
                       placeholder="请选择空闲车辆">
              <el-option v-for="item in trainCityList"
                         :key="item.citytrainId"
                         :label="item.citytrainName"
                         :value="item.citytrainId">
              </el-option>
            </el-select>
          </template>
        </el-form-item>
        <el-form-item label="交路描述" prop="groupNote">
          <el-input v-model="form.groupNote" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTrainGroup, getTrainGroup, delTrainGroup, addTrainGroup, updateTrainGroup,} from "@/api/train/trainGroup";
import {listCityTrain, updateCityTrainGroupById} from "@/api/train/cityTrain";

export default {
  name: "TrainGroup",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedTrainCity: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 交路管理表格数据
      trainGroupList: [],
      // 城际列车表格数据
      trainCityList: [],
      selectTrains:[],
      freeTrains:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        groupId: null,
        groupAvaliable: null,
        reciveusedTrain: null,
        freeTrain: null,
        groupNote: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        groupAvaliable: [
          { required: true, message: "交路是否使用不能为空", trigger: "blur" }
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询交路管理列表 */
    getList() {
      this.loading = true;
      listTrainGroup(this.queryParams).then(response => {
        this.trainGroupList = response.rows;
        this.total = response.total;
        this.loading = false;
      });

      listCityTrain().then(response => {
        this.trainCityList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        groupId: null,
        groupAvaliable: 0,
        reciveusedTrain: null,
        freeTrain: null,
        groupNote: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.groupId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加交路管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const groupId = row.groupId || this.ids
      getTrainGroup(groupId).then(response => {
        this.form = response.data;
        this.selectTrains = response.data.selectTrains;
        this.open = true;
        this.title = "修改交路管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // this.form.reciveusedTrain = this.selectTrains;
          this.form.reciveusedTrain = []
          // 选中车次比对后交给后端
          if (this.form.groupId != null) {
            for (let i=0; i<this.trainCityList.length; i++) {
              for (let j=0; j<this.selectTrains.length; j++){
                if (this.trainCityList[i].citytrainId == this.selectTrains[j]){
                  this.form.reciveusedTrain.push(this.trainCityList[i].citytrainName)
                }
              }
            }
            updateCityTrainGroupById({id:this.form.groupId, trains:this.selectTrains}).then(reposen =>{
              this.$modal.msgSuccess("修改成功");
            });
            updateTrainGroup(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTrainGroup(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const groupIds = row.groupId || this.ids;
      this.$modal.confirm('是否确认删除交路管理编号为"' + groupIds + '"的数据项？').then(function() {
        return delTrainGroup(groupIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('train/trainGroup/export', {
        ...this.queryParams
      }, `trainGroup_${new Date().getTime()}.xlsx`)
    },
    groupAvaliableFormat(row){
      if (row.groupAvaliable == 0){
        return "停止使用"
      } else {
        return "开行"
      }
    },
    // changeDisable(selectTrains){
    //   selectTrains.forEach((select)=>{
    //     this.trainCityList.forEach((train)=>{
    //       if (train.trainId === select.key){
    //         train.disable = true;
    //       }
    //     })
    //   })
    // }
  }
};
</script>
