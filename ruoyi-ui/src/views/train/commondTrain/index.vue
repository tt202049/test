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
      <el-divider class="divider"></el-divider>
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="autoAdd"
          v-hasPermi="['train:commondTrain:add']"
        >自动识别调令</el-button>
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
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-view"
          size="mini"
          @click="handleToday"
        >当日调令</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="commondTrainList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="调令id" align="center" prop="commondId" />
      <el-table-column label="调令名称" align="center" prop="commondName" />
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
      <el-table-column label="调令影响方式" align="center" prop="commondType" />
      <el-table-column label="调令影响车辆类型" align="center" prop="trainType" />
      <el-table-column label="调令偏移天数" align="center" prop="shiftDay" />
      <!--      <el-table-column label="调令影响车次id" align="center" prop="commondAffectTrainId" />-->
      <el-table-column label="调令影响车次/交路名称" align="center" prop="commondAffectTrainName" />
      <el-table-column label="调令录入人" align="center" prop="commondUser"/>
      <el-table-column label="调令是否按周开行" align="center" prop="isWeekStop"/>
      <el-table-column label="停开星期数" align="center" prop="stopWeek"/>
      <el-table-column label="调令影响车次/交路生效时间" align="center" prop="trainStartDay" />
      <el-table-column label="调令影响车次/交路失效时间" align="center" prop="trainStopDay" />
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
    <!-- 自动识别添加调令-->
    <el-dialog :title="title" :visible.sync="autoopen" width="800px" append-to-body>
      <el-upload
        class="upload-word"
        accept=".doc, .docx"
        :action= "11"
        :http-request="uploadfile"
        :on-preview="handlePreview"
        :on-remove="handleRemove"
        :before-remove="beforeRemove"
        :on-exceed="handleExceed">
        <el-button size="small" type="primary">点击上传</el-button>
        <div slot="tip" class="el-upload__tip">已上传文件</div>
      </el-upload>
    </el-dialog>

    <!-- 添加或修改调令管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="调令名称" prop="commondName">
          <el-input v-model="form.commondName" placeholder="请输入调令名称" />
        </el-form-item>
        <el-form-item label="调令类型" prop="commondType">
          <el-col :span="12">
<!--            <el-cascader v-model="form.commondType"-->
<!--                         :options="commondOptions"-->
<!--                         :show-all-levels="false">-->
<!--            </el-cascader>-->
            <el-select v-model="form.commondType"  filterable placeholder="调令类型">
              <el-option v-for="item in commondOptions"
                       :key = item.label
                       :label = item.label
                       :value = item.value>

              </el-option>
            </el-select>
          </el-col>
          <el-col :span="12" v-if="this.form.commondType == 3">
            <el-input v-model="form.trainSetNum" placeholder="请输入编组长度"></el-input>
          </el-col>
        </el-form-item>

        <el-form-item label="选择车辆种类" prop="selectTrain">
          <el-col :span = "12">
            <el-cascader v-model="form.trainOptions"
                         :options="trainOptions"
                         :show-all-levels="false"
                         @change="selectDifferentTrain">
            </el-cascader>
          </el-col>
          <el-col :span = "12">
            <el-select v-model="form.commondAffectTrainId" multiple filterable placeholder="选择车次/交路">
              <el-option v-for="item in selectQuerry"
                         :key = "item.trainId"
                         :label = "item.trainName"
                         :value = "item.trainId">

              </el-option>
            </el-select>
          </el-col>
        </el-form-item>

        <el-form-item label="调令时间" prop="isWeek">
          <el-col :span="12">
            <el-select v-model="form.isWeekStop" placeholder="选择输入时间类型" @change="cleanDate">
              <el-option v-for="item in dateOptions"
                       :key = "item.value"
                       :label = "item.label"
                       :value= "item.value">

              </el-option>
            </el-select>
          </el-col>
          <el-col :span="12" >
            <el-select v-if="this.form.isWeekStop == 1" v-model="form.stopWeek" multiple placeholder="选择一个或多个星期数">
              <el-option v-for="item in weekOptions"
                         :key = " item.value"
                         :label = "item.label"
                         :value = "item.value"/>
            </el-select>
            <el-date-picker v-if="this.form.isWeekStop == 2" v-model="form.stopDays" type="dates" placeholder="选择一个或多个日期"></el-date-picker>
            <el-date-picker v-if="this.form.isWeekStop == 3" v-model="tempDate" type="daterange" range-separator="至" start-placeholder="开始日期" end-placeholder="截止日期" @change="dateSplit"></el-date-picker>
          </el-col>
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

<style>
.divider{
  margin: 5px 5px;
  border-top: 1px;
}
</style>

<script>
import {
  listCommondTrain,
  getCommondTrain,
  delCommondTrain,
  addCommondTrain,
  updateCommondTrain,
  selectCommondByDay,
  uploadWord,
} from "@/api/train/commondTrain";
import {listCityTrain} from "@/api/train/cityTrain";
import {allListNormalTrain} from "@/api/train/normalTrain";
import {listHightrain} from "@/api/train/hightrain";

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
      // 车次选择队列 里面根据commondOption动态更换
      selectQuerry: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示自动添加弹出层
      autoopen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        commondName: null,
        trainId: null,
        startTime: null,
        endTime: null,
        citytrainName: null,
        normaltrainName: null,
        commondContent: null
      },
      // 上传调令列表
      // fileList: [],
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
      },
      tempDate : [],
      dateOptions:[
        {
          value: '1',
          label: '按星期选择'
        },{
          value: '2',
          label: '按日期选择'
        },{
          value: '3',
          label: '按起止日期选择'
        }
      ],
      commondOptions:[
        {
          value: '1',
          label: '加开'
        },{
          value: '2',
          label: '停运'
        },{
          value: '3',
          label: '编组变化'
        }
      ],
      trainOptions :[
        {
          value: 'normal',
          label: '普速车次'
        },{
          value: 'high',
          label: '高铁车次'
        },{
          value: 'city',
          label: '城际',
          children: [{
            value: 'group',
            label: '交路号'
          },{
            value: 'city',
            label: '城际车次'
          }]
        }
      ],
      weekOptions: [
        {
          value:'1',
          label:'星期一'
        },{
          value:'2',
          label:'星期二'
        },{
          value:'3',
          label:'星期三'
        },{
          value:'4',
          label:'星期四'
        },{
          value:'5',
          label:'星期五'
        },{
          value:'6',
          label:'星期六'
        },{
          value:'7',
          label:'星期日'
        }
      ]
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
        stratTime: null,
        endTime: null,
        commondType: null,
        trainType: null,
        commondAffectTrainId: null,
        commondAffectTrainName: null,
        commondContent: null,
        commondUser: null,
        isWeekStop: null,
        stopWeek: null,
        stopDays: null,
        shiftDay: null,
        trainStartDay: null,
        trainStopDays: null,
        trainSetNum:null
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
    /** 自动解析新增按钮操作 */
    autoAdd() {
      this.reset();
      this.autoopen = true;
      this.title = "自动识别添加调令";
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
      this.form.commondAffectTrainId = this.form.commondAffectTrainId.toString();
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
    /** 查询今日调令操作 */
    handleToday(){
      selectCommondByDay(now.getDate()).then(response => {
        this.commondTrainList = response.rows;
        this.total = response.total;
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('train/commondTrain/export', {
        ...this.queryParams
      }, `commondTrain_${new Date().getTime()}.xlsx`)
    },
    /** 选择不同的车次
     * 选择逻辑为
     * |-普速
     * |-动车
     * |-城际-交路
     * |-城际-车号*/
    selectDifferentTrain() {
      this.selectQuerry = []
        if ( this.form.trainOptions[0]== "normal"){
          allListNormalTrain().then(response => {
            this.selectQuerry = response.rows;
          });
        }

        if( this.form.trainOptions[0]== "high"){
          listHightrain().then(response =>{
            this.selectQuerry = response.rows;
          })
        }

        if( this.form.trainOptions[0]== "city"){
          if (this.form.trainOptions[1]=="city"){
            listCityTrain().then(response =>{
              this.selectQuerry = response.rows;
            });
          }else if(this.form.trainOptions[1]=="group"){
            console.log("group")
          }
        }

    },
    cleanDate(){
      this.form.stopWeek = null
      this.form.stopDays = null
      this.form.trainStopDays = null
      this.form.trainStartDay = null
    },
    dateSplit(){
      if (this.tempDate != null){
        this.form.trainStartDay = this.tempDate[1]
        this.form.trainStopDays = this.tempDate[0]
      }
   },
    uploadfile(file){
      var formData = new FormData()
      formData.append("file",file.file)
      uploadWord(formData).then(res => {
        if(resp && resp.status == 200){
          // this.fileList.append(file)
        }
      })
    },
    handleRemove(file, fileList) {
        console.log(file, fileList);
    },
    handlePreview(file) {
        console.log(file);
    },
    handleExceed(files, fileList) {
        this.$message.warning(`当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
    },
    beforeRemove(file, fileList) {
        return this.$confirm(`确定移除 ${ file.name }？`);
    },
  }
};
</script>
