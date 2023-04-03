<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="调令名称" prop="commondName">
        <el-input
          v-model="queryParams.commondName"
          placeholder="请输入调令名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="调令影响交路" prop="groupId">
        <el-input
          v-model="queryParams.groupId"
          placeholder="请输入调令影响交路"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="调令开始时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择调令开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="调令结束时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择调令结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="调令影响高铁车次" prop="citytrainName">
        <el-input
          v-model="queryParams.citytrainName"
          placeholder="请输入调令影响高铁车次"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="调令影响普速车次" prop="normaltrainName">
        <el-input
          v-model="queryParams.normaltrainName"
          placeholder="请输入调令影响普速车次"
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
          v-hasPermi="['train:commondTrain:add']"
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
          v-hasPermi="['train:commondTrain:edit']"
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
          v-hasPermi="['train:commondTrain:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['train:commondTrain:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="commondTrainList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="调令id" align="center" prop="commondId" />
      <el-table-column label="调令名称" align="center" prop="commondName" />
      <el-table-column label="调令影响交路" align="center" prop="groupId" />
      <el-table-column label="调令开始时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="调令结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="调令影响高铁id" align="center" prop="citytrainId" />
      <el-table-column label="调令影响普速" align="center" prop="normaltrainId" />
      <el-table-column label="调令影响高铁车次" align="center" prop="citytrainName" />
      <el-table-column label="调令影响普速车次" align="center" prop="normaltrainName" />
      <el-table-column label="调令具体内容" align="center" prop="commondContent" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['train:commondTrain:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['train:commondTrain:remove']"
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

    <!-- 添加或修改调令管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="调令名称" prop="commondName">
          <el-input v-model="form.commondName" placeholder="请输入调令名称" />
        </el-form-item>
        <el-form-item label="调令影响交路" prop="groupId">
          <el-input v-model="form.groupId" placeholder="请输入调令影响交路" />
        </el-form-item>
        <el-form-item label="调令开始时间" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择调令开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="调令结束时间" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择调令结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="调令影响高铁车次" prop="citytrainName">
          <el-input v-model="form.citytrainName" placeholder="请输入调令影响高铁车次" />
        </el-form-item>
        <el-form-item label="调令影响普速车次" prop="normaltrainName">
          <el-input v-model="form.normaltrainName" placeholder="请输入调令影响普速车次" />
        </el-form-item>
        <el-form-item label="调令具体内容">
          <editor v-model="form.commondContent" :min-height="192"/>
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
import { listCommondTrain, getCommondTrain, delCommondTrain, addCommondTrain, updateCommondTrain } from "@/api/train/commondTrain";

export default {
  name: "CommondTrain",
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
      // 调令管理表格数据
      commondTrainList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        commondName: null,
        groupId: null,
        startTime: null,
        endTime: null,
        citytrainName: null,
        normaltrainName: null,
        commondContent: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        commondName: [
          { required: true, message: "调令名称不能为空", trigger: "blur" }
        ],
        startTime: [
          { required: true, message: "调令开始时间不能为空", trigger: "blur" }
        ],
        commondContent: [
          { required: true, message: "调令具体内容不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询调令管理列表 */
    getList() {
      this.loading = true;
      listCommondTrain(this.queryParams).then(response => {
        this.commondTrainList = response.rows;
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
        commondId: null,
        commondName: null,
        groupId: null,
        startTime: null,
        endTime: null,
        citytrainId: null,
        normaltrainId: null,
        citytrainName: null,
        normaltrainName: null,
        commondContent: null
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
      this.ids = selection.map(item => item.commondId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加调令管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const commondId = row.commondId || this.ids
      getCommondTrain(commondId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改调令管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.commondId != null) {
            updateCommondTrain(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCommondTrain(this.form).then(response => {
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
      const commondIds = row.commondId || this.ids;
      this.$modal.confirm('是否确认删除调令管理编号为"' + commondIds + '"的数据项？').then(function() {
        return delCommondTrain(commondIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('train/commondTrain/export', {
        ...this.queryParams
      }, `commondTrain_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
