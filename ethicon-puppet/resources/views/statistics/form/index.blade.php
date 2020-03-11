@extends('home.parent')
<?php 
$title = \App\Components\Tools::sLang('Information management', '信息管理');
?>
@section('title',$title)
@section('head_js')
@endsection
@section('head_css')
<link rel="stylesheet" href="{{ asset('/css/dataTables.bootstrap.css') }}">
@endsection
@section('content')
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
              <?php echo \App\Components\Tools::sLang('Information management', '信息管理');?>
              <small></small>
            </h1>
            <ol class="breadcrumb">
              <li><a href="{{URL('admin')}}"><i class="fa fa-dashboard"></i> <?php echo \App\Components\Tools::sLang('Home page', '首页');?></a></li>
              <li class="active"><?php echo \App\Components\Tools::sLang('Information management', '信息管理');?></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                          <a href="{{ URL('admin/form/export/excel') }}" class="btn btn-info pull-right"><?php echo \App\Components\Tools::sLang('Export Excel', '导出Excel');?></a>
                          <h3 class="box-title"></h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                          <table id="data_list" class="table table-bordered table-striped">
                            <thead>
                              <tr>
                                <th><?php echo \App\Components\Tools::sLang('ID', '序号');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Time', '时间');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Name', '姓名');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Hospital', '医院');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Professional', '职称');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Specialty', '专科');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Mobile', '手机');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Number of operative cases(one year)', '手术例数（1年）');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Endoscopic rate', '腔镜率');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Questionnaire', '问卷');?></th>
                              </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                              <tr>
                                <th><?php echo \App\Components\Tools::sLang('ID', '序号');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Time', '时间');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Name', '姓名');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Hospital', '医院');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Professional', '职称');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Specialty', '专科');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Mobile', '手机');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Number of operative cases(one year)', '手术例数（1年）');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Endoscopic rate', '腔镜率');?></th>
                                <th><?php echo \App\Components\Tools::sLang('Questionnaire', '问卷');?></th>
                              </tr>
                            </tfoot>
                          </table>
                        </div>
                        <!-- /.box-body -->
                      </div>
                      <!-- /.box -->
                </div>
            </div>
        </section>
    </div>
@endsection
@section('foot_js')
<script src="{{ asset('/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('/js/dataTables.bootstrap.min.js') }}"></script>
<script src="{{ asset('/js/jquery.slimscroll.min.js') }}"></script>
<script src="{{ asset('/js/fastclick.js') }}"></script>
<script src="{{ asset('/js/tools.js').'?v='.env('VERSION') }}"></script>
<script>
var list_ajax;
$(function () {
//提示信息
    var lang = puppet.langShow(puppet_lang);
    //初始化表格
    list_ajax = $("#data_list").dataTable({
        language: lang, //提示信息
        autoWidth: false, //禁用自动调整列宽
        stripeClasses: ["odd", "even"], //为奇偶行加上样式，兼容不支持CSS伪类的场合
        processing: true, //隐藏加载提示,自行处理;
        serverSide: true, //启用服务器端分页
        searching: false, //禁用原生搜索
        orderMulti: false, //启用多列排序
        order: [[0, 'desc']], //取消默认排序查询,否则复选框一列会出现小箭头
        renderer: "bootstrap", //渲染样式：Bootstrap和jquery-ui
        pagingType: "simple_numbers", //分页样式：simple,simple_numbers,full,full_numbers
        columnDefs: [
            {
                "targets": [1,2,3,4,5,6,7,8,9], //列的样式名
                "orderable": false    //包含上样式名‘nosort’的禁止排序
            },
            {
                targets: 1,
                data: "create_time",
                title: puppet_lang == 2 ? "时间" : "Time",
                render: function (data, type, row, meta) {
                    return puppet.formatDateTime(data * 1000);
                }
            },
            {
                targets: 8,
                data: "endoscopic_rate",
                title: puppet_lang == 2 ? "腔镜率" : "Endoscopic rate",
                render: function (data, type, row, meta) {
                  return data+'%';
                }
            },
            {
                targets: 9,
                title: puppet_lang == 2 ? "问卷" : "Questionnaire",
                render: function (data, type, row, meta) {
                    return  "&nbsp;&nbsp;&nbsp;&nbsp;<a href='{{ URL('admin/form/show') }}/"+row.form_id+"' title='查看问卷' aria-label='查看问卷' data-pjax='0'>查看问卷</a>";
                }
            },
        ],
        ajax: function (data, callback, settings) {
            //封装请求参数
            var param = {};
            param.limit = data.length; //页面显示记录条数，在页面显示每页显示多少项的时候
            param.start = data.start; //开始的记录序号
            param.page = (data.start / data.length) + 1; //当前页码
            param.order = data.order;
            param.search = data.search;
            $.ajax({
                type: "POST",
                url: "{{ URL('admin/form/list/ajax') }}",
                cache: false, //禁用缓存
                data: param, //传入组装的参数
                dataType: "json",
                success: function (result) {
                    var returnData = {};
                    returnData.draw = data.draw; //这里直接自行返回了draw计数器,应该由后台返回
                    returnData.recordsTotal = result.total; //返回数据全部记录
                    returnData.recordsFiltered = result.total; //后台不实现过滤功能，每次查询均视作全部结果
                    returnData.data = result.data; //返回的数据列表
                    callback(returnData);
                }
            });
        },
        //列表表头字段
        columns: [
            {"data": "form_id"},
            {"data": "create_time"},
            {"data": "name"},
            {"data": "hospital"},
            {"data": "title"},
            {"data": "specialty"},
            {"data": "mobile"},
            {"data": "operations_num_one_year"},
            {"data": "endoscopic_rate"},
            {"data":null},
        ]
    }).api();
});
</script>
@endsection