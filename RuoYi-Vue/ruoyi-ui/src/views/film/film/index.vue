<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <!-- <el-form-item label="照片" prop="img">
        <el-input
          v-model="queryParams.img"
          placeholder="请输入照片"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="中文名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入影片中文名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="英文名" prop="ename">
        <el-input v-model="queryParams.ename" placeholder="请输入影皮英文名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="标签" prop="tag">
        <el-input
          v-model="queryParams.tag"
          placeholder="请输入标签"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="类型" prop="cat">
        <el-input v-model="queryParams.cat" placeholder="请输入类型" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="上映时间" prop="date">
        <el-date-picker clearable v-model="queryParams.date" type="date" value-format="yyyy-MM-dd" placeholder="请选择上映时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="上映地区" prop="addr">
        <el-input v-model="queryParams.addr" placeholder="请输入上映地区" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="时长" prop="dur">
        <el-input
          v-model="queryParams.dur"
          placeholder="请输入时长"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <!-- <el-form-item label="想看人数" prop="wish">
        <el-input
          v-model="queryParams.wish"
          placeholder="请输入想看人数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <!-- <el-form-item label="看过人数" prop="watched">
        <el-input
          v-model="queryParams.watched"
          placeholder="请输入看过人数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="评分" prop="sc">
        <el-input v-model="queryParams.sc" placeholder="请输入评分" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="评分人数" prop="snum">
        <el-input
          v-model="queryParams.snum"
          placeholder="请输入评分人数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <!-- <el-form-item label="演员们的ids" prop="actors">
        <el-input
          v-model="queryParams.actors"
          placeholder="请输入演员们的ids"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <!-- <el-form-item label="删除标识" prop="deleted">
        <el-input
          v-model="queryParams.deleted"
          placeholder="请输入删除标识"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['film:film:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['film:film:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['film:film:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['film:film:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="filmList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键id" align="center" prop="id" />
      <el-table-column label="照片" align="center" prop="img">
        <template slot-scope="scope">
          <el-image style="width: 100px; height: 100px" :src="scope.row.img" fit="contain" />
        </template>
      </el-table-column>
      <el-table-column label="中文名" align="center" prop="name" />
      <el-table-column label="英文名" align="center" prop="ename" />
      <el-table-column label="标签" align="center" prop="tag" />
      <el-table-column label="类型" align="center" prop="cat" />
      <el-table-column label="上映时间" align="center" prop="date" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="上映地区" align="center" prop="addr" />
      <el-table-column label="时长" align="center" prop="dur" />
      <el-table-column label="想看人数" align="center" prop="wish" />
      <el-table-column label="看过人数" align="center" prop="watched" />
      <el-table-column label="评分" align="center" prop="sc" />
      <el-table-column label="评分人数" align="center" prop="snum" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1">上映</el-tag>
          <el-tag class="ml-2" type="success" v-else-if="scope.row.status === 2">预售</el-tag>
          <el-tag class="ml-2" type="warning" v-else>想看</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="演员们的ids" align="center" prop="actors" />
      <el-table-column label="删除标识" align="center" prop="deleted" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['film:film:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['film:film:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改film对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="照片" prop="img">
          <el-input v-model="form.img" placeholder="请输入照片" />
        </el-form-item>
        <el-form-item label="影片中文名" prop="name">
          <el-input v-model="form.name" placeholder="请输入影片中文名" />
        </el-form-item>
        <el-form-item label="影皮英文名" prop="ename">
          <el-input v-model="form.ename" placeholder="请输入影皮英文名" />
        </el-form-item>
        <el-form-item label="标签" prop="tag">
          <el-input v-model="form.tag" placeholder="请输入标签" />
        </el-form-item>
        <el-form-item label="类型" prop="cat">
          <el-input v-model="form.cat" placeholder="请输入类型" />
        </el-form-item>
        <el-form-item label="上映时间" prop="date">
          <el-date-picker clearable v-model="form.date" type="date" value-format="yyyy-MM-dd" placeholder="请选择上映时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="上映地区" prop="addr">
          <el-input v-model="form.addr" placeholder="请输入上映地区" />
        </el-form-item>
        <el-form-item label="时长" prop="dur">
          <el-input v-model="form.dur" placeholder="请输入时长" />
        </el-form-item>
        <el-form-item label="想看人数" prop="wish">
          <el-input v-model="form.wish" placeholder="请输入想看人数" />
        </el-form-item>
        <el-form-item label="看过人数" prop="watched">
          <el-input v-model="form.watched" placeholder="请输入看过人数" />
        </el-form-item>
        <el-form-item label="评分" prop="sc">
          <el-input v-model="form.sc" placeholder="请输入评分" />
        </el-form-item>
        <el-form-item label="评分人数" prop="snum">
          <el-input v-model="form.snum" placeholder="请输入评分人数" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-input v-model="form.status" placeholder="请输入状态" />
        </el-form-item>
        <el-form-item label="演员们的ids" prop="actors">
          <el-input v-model="form.actors" placeholder="请输入演员们的ids" />
        </el-form-item>
        <el-form-item label="删除标识" prop="deleted">
          <el-input v-model="form.deleted" placeholder="请输入删除标识" />
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
import { listFilm, getFilm, delFilm, addFilm, updateFilm } from "@/api/film/film";

export default {
  name: "Film",
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
      // film表格数据
      filmList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        img: null,
        name: null,
        ename: null,
        tag: null,
        cat: null,
        date: null,
        addr: null,
        dur: null,
        wish: null,
        watched: null,
        sc: null,
        snum: null,
        status: null,
        actors: null,
        deleted: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询film列表 */
    getList() {
      this.loading = true;
      listFilm(this.queryParams).then(response => {
        this.filmList = response.rows;
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
        id: null,
        img: null,
        name: null,
        ename: null,
        tag: null,
        cat: null,
        date: null,
        addr: null,
        dur: null,
        wish: null,
        watched: null,
        sc: null,
        snum: null,
        status: null,
        actors: null,
        deleted: null,
        createTime: null,
        updateTime: null
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加film";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFilm(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改film";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFilm(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFilm(this.form).then(response => {
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
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除film编号为"' + ids + '"的数据项？').then(function () {
        return delFilm(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('film/film/export', {
        ...this.queryParams
      }, `film_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
