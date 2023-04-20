<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="高铁车号" prop="trainName">
        <el-input
          v-model="queryParams.trainName"
          placeholder="请输入高铁车号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="始发站" prop="depatureStation">
        <el-input
          v-model="queryParams.depatureStation"
          placeholder="请输入始发站"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="终到站" prop="terminalStation">
        <el-input
          v-model="queryParams.terminalStation"
          placeholder="请输入终到站"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="站台号" prop="platformNo">
        <el-input
          v-model="queryParams.platformNo"
          placeholder="请输入站台号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检票口号" prop="deportNo">
        <el-input
          v-model="queryParams.deportNo"
          placeholder="请输入检票口号"
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
          v-hasPermi="['train:hightrain:add']"
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
          v-hasPermi="['train:hightrain:edit']"
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
          v-hasPermi="['train:hightrain:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['train:hightrain:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="hightrainList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="高铁ID" align="center" prop="trainId" />
      <el-table-column label="高铁车号" align="center" prop="trainName" />
      <el-table-column label="始发站" align="center" prop="depatureStation" />
      <el-table-column label="终到站" align="center" prop="terminalStation" />
      <el-table-column label="是否始发" align="center" prop="isDepature" :formatter="isDepatureFormat"/>
      <el-table-column label="是否开行" align="center" prop="isAvaliable" :formatter="isAvaliableFormat"/>
      <el-table-column label="到站时间" align="center" prop="arriveTime" width="180">
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.arriveTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
      </el-table-column>
      <el-table-column label="开车时间" align="center" prop="leaveTime" width="180">
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.leaveTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
      </el-table-column>
      <el-table-column label="图定编组数量" align="center" prop="trainsetNum" />
      <el-table-column label="站台号" align="center" prop="platformNo" />
      <el-table-column label="检票口号" align="center" prop="deportNo" />
      <el-table-column label="折返车次ID" align="center" prop="coupleId" />
      <el-table-column label="折返车号" align="center" prop="coupleName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['train:hightrain:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['train:hightrain:remove']"
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

    <!-- 添加或修改高铁车辆管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="高铁车号" prop="trainName">
          <el-input v-model="form.trainName" placeholder="请输入高铁车号" />
        </el-form-item>
        <el-form-item label="始发站" prop="depatureStation">
          <el-input v-model="form.depatureStation" placeholder="请输入始发站" />
        </el-form-item>
        <el-form-item label="终到站" prop="terminalStation">
          <el-input v-model="form.terminalStation" placeholder="请输入终到站" />
        </el-form-item>
        <el-form-item label="是否始发站" prop="depatureStation">
          <el-radio-group v-model="form.isDepature">
            <el-radio :label="true" size="large">始发</el-radio>
            <el-radio :label="false" size="large">非始发</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="到站时间" prop="arriveTime">
          <el-date-picker clearable
                          v-model="form.arriveTime"
                          type="datetime"
                          format="HH:mm"
                          value-format="HH:mm"
                          placeholder="请选择到站时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="开车时间" prop="leaveTime">
          <el-date-picker clearable
                          v-model="form.leaveTime"
                          type="datetime"
                          format="HH:mm"
                          value-format="HH:mm"
                          placeholder="请选择开车时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="图定编组数量" prop="trainsetNum">
          <el-input v-model="form.trainsetNum" placeholder="请输入图定编组数量" />
        </el-form-item>
        <el-form-item label="站台号" prop="platformNo">
          <el-input v-model="form.platformNo" placeholder="请输入站台号" />
        </el-form-item>
        <el-form-item label="检票口号" prop="deportNo">
          <el-input v-model="form.deportNo" placeholder="请输入检票口号" />
        </el-form-item>
        <el-form-item label="折返车次ID" prop="coupleId">
          <el-input v-model="form.coupleId" placeholder="请输入折返车次ID" />
        </el-form-item>
        <el-form-item label="折返车号" prop="coupleName">
          <el-input v-model="form.coupleName" placeholder="请输入折返车号" />
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
import { listHightrain, getHightrain, delHightrain, addHightrain, updateHightrain } from "@/api/train/hightrain";

export default {
  name: "Hightrain",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 高铁车辆管理表格数据
      hightrainList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        trainName: null,
        depatureStation: null,
        terminalStation: null,
        isDepature:null,
        isAvaliable: null,
        platformNo: null,
        deportNo: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        trainName: [
          { required: true, message: "高铁车号不能为空", trigger: "blur" }
        ],
        depatureStation: [
          { required: true, message: "始发站不能为空", trigger: "blur" }
        ],
        terminalStation: [
          { required: true, message: "终到站不能为空", trigger: "blur" }
        ],
        isDepature: [
          { required: true, message: "是否始发不能为空", trigger: "blur" }
        ],
        isAvaliable: [
          { required: true, message: "是否开行不能为空", trigger: "blur" }
        ],
        arriveTime: [
          { required: true, message: "到站时间不能为空", trigger: "blur" }
        ],
        leaveTime: [
          { required: true, message: "开车时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询高铁车辆管理列表 */
    getList() {
      this.loading = true;
      listHightrain(this.queryParams).then(response => {
        this.hightrainList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        trainId: null,
        trainName: null,
        depatureStation: null,
        terminalStation: null,
        isDepature:0,
        isAvaliable: 0,
        arriveTime: null,
        leaveTime: null,
        trainsetNum: null,
        platformNo: null,
        deportNo: null,
        coupleId: null,
        coupleName: null
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
      this.ids = selection.map(item => item.trainId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加高铁车辆管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const trainId = row.trainId || this.ids
      getHightrain(trainId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改高铁车辆管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.trainId != null) {
            updateHightrain(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addHightrain(this.form).then(response => {
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
      const trainIds = row.trainId || this.ids;
      this.$modal.confirm('是否确认删除高铁车辆管理编号为"' + trainIds + '"的数据项？').then(function() {
        return delHightrain(trainIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('train/hightrain/export', {
        ...this.queryParams
      }, `hightrain_${new Date().getTime()}.xlsx`)
    },
    isDepatureFormat(row){
      if (row.isDepature == 0){
        return "否"
      }else {
        return "是"
      }
    },
    isAvaliableFormat(row){
      if (row.isAvaliable == 0){
        return "停运"
      }else {
        return "开行"
      }
    }
  }
};
</script>
