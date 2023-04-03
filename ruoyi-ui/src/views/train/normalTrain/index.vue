<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="普速车号" prop="trainName">
        <el-input
          v-model="queryParams.trainName"
          placeholder="请输入普速车车号"
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
<!--      <el-form-item label="图定编组数量" prop="trainsetNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.trainsetNum"-->
<!--          placeholder="请输入图定编组数量"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="现编组数量" prop="presetNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.presetNum"-->
<!--          placeholder="请输入现编组数量"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="到站时间" prop="arriveTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.arriveTime"-->
<!--          type="datetime"-->
<!--          format="HH:mm"-->
<!--          value-format="HH:mm"-->
<!--          placeholder="请选择到站时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="开车时间" prop="leaveTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.leaveTime"-->
<!--          type="datetime"-->
<!--          format="HH:mm"-->
<!--          value-format="HH:mm"-->
<!--          placeholder="请选择开车时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="停车时间" prop="stayTime">-->
<!--        <el-input-->
<!--          v-model="queryParams.stayTime"-->
<!--          placeholder="请输入停车时间（分钟）"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="折返ID" prop="coupeId">-->
<!--        <el-input-->
<!--          v-model="queryParams.coupeId"-->
<!--          placeholder="请输入折返ID"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="折返车号" prop="coupeName">
        <el-input
          v-model="queryParams.coupeName"
          placeholder="请输入折返车号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="折返时间" prop="coupeDay">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.coupeDay"-->
<!--          type="datetime"-->
<!--          format="HH:mm"-->
<!--          value-format="HH:mm"-->
<!--          placeholder="请选择折返时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
      <el-form-item label="补充说明" prop="note">
        <el-input
          v-model="queryParams.note"
          placeholder="请输入补充说明"
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
          v-hasPermi="['train:normalTrain:add']"
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
          v-hasPermi="['train:normalTrain:edit']"
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
          v-hasPermi="['train:normalTrain:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['train:normalTrain:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="normalTrainList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="普速车ID" align="center" prop="trainId" />
      <el-table-column label="普速车号" align="center" prop="trainName" />
      <el-table-column label="始发站" align="center" prop="depatureStation" />
      <el-table-column label="是否始发" align="center" prop="isDepature" :formatter="isDepatureFormat"/>
      <el-table-column label="终到站" align="center" prop="terminalStation" />
      <el-table-column label="是否开行" align="center" prop="isAvaliable" :formatter="isAvaliableFormat"/>
      <el-table-column label="图定编组数量" align="center" prop="trainsetNum" />
      <el-table-column label="现编组数量" align="center" prop="presetNum" />
      <el-table-column label="站台号" align="center" prop="platformNo" />
      <el-table-column label="检票口号" align="center" prop="deportNo" />
      <el-table-column label="最大车号方向" align="center" prop="maxDirction" />
      <el-table-column label="到站时间" align="center" prop="arriveTime" width="180">
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.arriveTime, '{h}-{m}') }}</span>-->
<!--        </template>-->
      </el-table-column>
      <el-table-column label="开车时间" align="center" prop="leaveTime" width="180">
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.leaveTime, '{h}-{i}-{s}') }}</span>-->
<!--        </template>-->
      </el-table-column>
      <el-table-column label="停车时间" align="center" prop="stayTime" />
      <el-table-column label="是否上水" align="center" prop="isWaterup" :formatter="isWaterupFormat"/>
      <el-table-column label="折返ID" align="center" prop="coupeId" />
      <el-table-column label="折返车号" align="center" prop="coupeName" />
      <el-table-column label="折返时间" align="center" prop="coupeDay" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.coupeDay, '{h}-{i}-{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="补充说明" align="center" prop="note" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['train:normalTrain:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['train:normalTrain:remove']"
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

    <!-- 添加或修改普速调令管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="普速车车号" prop="trainName">
          <el-input v-model="form.trainName" placeholder="请输入普速车车号" />
        </el-form-item>
        <el-form-item label="始发站" prop="depatureStation">
          <el-input v-model="form.depatureStation" placeholder="请输入始发站" />
        </el-form-item>
        <el-form-item label="是否始发站" prop="depatureStation">
          <el-radio-group v-model="form.isDepature">
            <el-radio :label="true" size="large">始发</el-radio>
            <el-radio :label="false" size="large">非始发</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="终到站" prop="terminalStation">
          <el-input v-model="form.terminalStation" placeholder="请输入终到站" />
        </el-form-item>
        <el-form-item label="是否开行" prop="isAvaliable">
          <el-radio-group v-model="form.isAvaliable">
            <el-radio :label="true" size="large">开行</el-radio>
            <el-radio :label="false" size="large">停运</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="图定编组数量" prop="trainsetNum">
          <el-input v-model="form.trainsetNum" placeholder="请输入图定编组数量" />
        </el-form-item>
        <el-form-item label="现编组数量" prop="presetNum">
          <el-input v-model="form.presetNum" placeholder="请输入现编组数量" />
        </el-form-item>
        <el-form-item label="站台号" prop="presetNum">
          <el-input v-model="form.platformNo" placeholder="请输入站台号" />
        </el-form-item>
        <el-form-item label="检票口号" prop="presetNum">
          <el-input v-model="form.deportNo" placeholder="请输入检票口号" />
        </el-form-item>
        <el-form-item label="最大车号方向" prop="maxDirction">
          <el-radio-group v-model="form.maxDirction">
            <el-radio label="东" size="large">东侧</el-radio>
            <el-radio label="西" size="large">西侧</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否上水" prop="isWaterup">
          <el-radio-group v-model="form.isWaterup">
            <el-radio :label="true" size="large">是</el-radio>
            <el-radio :label="false" size="large">否</el-radio>
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
<!--        <el-form-item label="停车时间" prop="stayTime">-->
<!--          <el-date-picker clearable-->
<!--            v-model="form.stayTime"-->
<!--            type="datetime"-->
<!--            format="HH:mm"-->
<!--            value-format="HH:mm"-->
<!--            placeholder="请选择停车时间">-->
<!--          </el-date-picker>-->
<!--        </el-form-item>-->
        <el-form-item label="停车时间" prop="coupeId">
          <el-input v-model="form.stayTime" placeholder="请输入停车时间（分钟）" />
        </el-form-item>
        <el-form-item label="折返ID" prop="coupeId">
          <el-input v-model="form.coupeId" placeholder="请输入折返ID" />
        </el-form-item>
        <el-form-item label="折返车号" prop="coupeName">
          <el-input v-model="form.coupeName" placeholder="请输入折返车号" />
        </el-form-item>
        <el-form-item label="折返时间" prop="coupeDay">
          <el-date-picker clearable
            v-model="form.coupeDay"
            type="datetime"
            format="HH:mm"
            value-format="HH:mm"
            placeholder="请选择折返时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="补充说明" prop="note">
          <el-input v-model="form.note" placeholder="请输入补充说明" />
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
import { listNormalTrain, getNormalTrain, delNormalTrain, addNormalTrain, updateNormalTrain } from "@/api/train/normalTrain";

export default {
  name: "NormalTrain",
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
      // 普速调令管理表格数据
      normalTrainList: [],
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
        isDepature: null,
        terminalStation: null,
        isAvaliable: null,
        trainsetNum: null,
        presetNum: null,
        platformNo: null,
        deportNo: null,
        maxDirction: null,
        arriveTime: null,
        leaveTime: null,
        stayTime: null,
        isWaterup: null,
        coupeId: null,
        coupeName: null,
        coupeDay: null,
        note: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        trainName: [
          { required: true, message: "普速车车号不能为空", trigger: "blur" }
        ],
        depatureStation: [
          { required: true, message: "始发站不能为空", trigger: "blur" }
        ],
        isDepature: [
          { required: true, message: "是否始发不能为空", trigger: "blur" }
        ],
        terminalStation: [
          { required: true, message: "终到站不能为空", trigger: "blur" }
        ],
        isAvaliable: [
          { required: true, message: "是否开行不能为空", trigger: "blur" }
        ],
        trainsetNum: [
          { required: true, message: "图定编组数量不能为空", trigger: "blur" }
        ],
        presetNum: [
          { required: true, message: "现编组数量不能为空", trigger: "blur" }
        ],
        // maxDirction: [
        //   { required: true, message: "最大车号方向不能为空", trigger: "change" }
        // ],
        arriveTime: [
          { required: true, message: "到站时间不能为空", trigger: "blur" }
        ],
        leaveTime: [
          { required: true, message: "开车时间不能为空", trigger: "blur" }
        ],
        stayTime: [
          { required: true, message: "停车时间不能为空", trigger: "blur" }
        ],
        isWaterup: [
          { required: true, message: "是否上水不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询普速调令管理列表 */
    getList() {
      this.loading = true;
      listNormalTrain(this.queryParams).then(response => {
        this.normalTrainList = response.rows;
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
        isDepature: false,
        terminalStation: null,
        isAvaliable: false,
        trainsetNum: null,
        presetNum: null,
        platformNo: null,
        deportNo: null,
        maxDirction: null,
        arriveTime: null,
        leaveTime: null,
        stayTime: null,
        isWaterup: false,
        coupeId: null,
        coupeName: null,
        coupeDay: null,
        note: null
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
      this.title = "添加普速调令管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const trainId = row.trainId || this.ids
      getNormalTrain(trainId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改普速调令管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.trainId != null) {
            updateNormalTrain(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNormalTrain(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除普速调令管理编号为"' + trainIds + '"的数据项？').then(function() {
        return delNormalTrain(trainIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('train/normalTrain/export', {
        ...this.queryParams
      }, `normalTrain_${new Date().getTime()}.xlsx`)
    },
    /** 数据库 01转化为是否 */
    isDepatureFormat(row){
      if (row.isDepature == 0){
        return "否"
      }else {
        return "是"
      }
    },
    isWaterupFormat(row){
      if (row.isWaterup == 0){
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

