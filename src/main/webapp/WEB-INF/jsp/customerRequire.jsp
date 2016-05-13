<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>客户需求-爱房网</title>
  <link href="${ctx}/css/chosen.css" rel="stylesheet">
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/datepicker.css" rel="stylesheet">
  <link href="${ctx}/css/colorbox.css" rel="stylesheet">
  <link href="${ctx}/css/bootstrapValidator.min.css" rel="stylesheet">
  <css>
  <style>
  .hr-line {
    margin-top: 0;
    margin-bottom: 8px;
  }
  .form-row {margin-bottom: 0;}
  .form-row>label.control-label {padding-top: 10px;}
  .form-row>div {padding-top: 5px;}
  
  .input-field {width: 100%;}
  .input-select {width: 84px; height: 32px;}
  @media (min-width: 1200px) {
    .input-select {height: 28px;}
  }
  .input-text {width: 84px;}
  
  .btn-list {padding: 0;}
  .list-inline li {padding-left: 0;}
  
  .widget-none {border: 0;}
  .table-search {
    margin-top: 0;
    margin-bottom: 0;
  }
  .table-search>tbody>tr>td {
    padding-top: 0;
    padding-bottom: 0;
  } 
  .action-close {color: #e09e96;}
  .action-close:hover {color: #ffd9d5;}
  
  .modal-body-content {padding: 5px 0 0 0;}
  
  .ace-thumbnails>li {margin-left: 20px;} 
  
  .switch-box {padding-top: 5px;}
  
  .chosen-container>.chosen-single, [class*="chosen-container"]>.chosen-single {
    height: 28px;
  }
  </style>
  </css>
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">客源</a></li>
	      <li class="active">客户</li>
	    </ul>
	  </div>
	
	  <div class="page-content">
      <div class="widget-container-span">
        <div class="widget-box transparent">
          <div class="widget-header">
            <h5>客户搜索</h5>
            <div class="widget-toolbar no-border">
              <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
            </div>
          </div>
          
          <div class="widget-body">
            <table class="table table-striped table-search">
              <tbody>
                <tr>
                  <td>
                    <form class="form-horizontal" id="searchForm">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">区域：</label>
                        <div class="col-md-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districts', 'towns', 'townsPane']);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                          <div id="townsPane">
                            <hr class="hr-line">
                            <ul class="list-inline" id="towns">
                              <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">楼盘：</label>
                        <div class="col-md-3">
                          <div class="input-group">
                            <input class="input-field" type="text" id="buildingName" placeholder="楼盘名称">
                            <span class="input-group-addon"><i class="icon-home"></i></span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">姓名：</label>
                        <div class="col-md-11">
                          <select class="input-select chosen-select" id="name">
                            <option value="">不限</option>
                            <c:forEach var="data" items="${customers}">
                            <option value="${data.id}">${data.name}</option>
                            </c:forEach>
                          </select>
                          &nbsp;
                          <label>
                            <input name="type" type="radio" class="ace" checked>
                            <span class="lbl"> 不限</span>
                          </label>
                          &nbsp;
                          <label>
                            <input name="type" type="radio" class="ace">
                            <span class="lbl"> 求购</span>
                          </label>
                          &nbsp;
                          <label>
                            <input name="type" type="radio" class="ace">
                            <span class="lbl"> 求租</span>
                          </label>
                          <!-- <small>~</small>
                          <select class="input-select" id="type">
                            <option value="">不限</option>
                            <option value="1">求购</option>
                          </select> -->
                          <!-- <select class="input-select chosen-select" id="form-field-select-3">
                            <option value="">不限</option>
                            <option value="AL">Alabama</option>
                            <option value="AK">Alaska</option>
                            <option value="AZ">Arizona</option>
                          </select> -->
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">价格：</label>
                        <div class="col-md-3">
                          <input class="input-text" type="text" id="priceBegin">
                          <small>~</small>
                          <input class="input-text" type="text" id="priceEnd">
                        </div>
                        <label class="col-md-1 control-label no-padding-right">面积：</label>
                        <div class="col-md-3">
                          <input class="input-text" type="text" id="priceBegin">
                          <small>~</small>
                          <input class="input-text" type="text" id="priceEnd">
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">户型：</label>
                        <div class="col-md-8">
                          <select class="input-select" id="room">
                            <option value="0">选择室</option>
                            <option value="1">1室</option>
                            <option value="2">2室</option>
                            <option value="3">3室</option>
                            <option value="4">4室</option>
                            <option value="5">5室</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="saloon">
                            <option value="0">选择厅</option>
                            <option value="1">1厅</option>
                            <option value="2">2厅</option>
                            <option value="3">3厅</option>
                            <option value="4">4厅</option>
                            <option value="5">5厅</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="toilet">
                            <option value="0">选择卫</option>
                            <option value="1">1卫</option>
                            <option value="2">2卫</option>
                            <option value="3">3卫</option>
                            <option value="4">4卫</option>
                            <option value="5">5卫</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="submit" class="btn btn-info btn-xs">搜索<i class="icon-search icon-on-right"></i></button>
                              &nbsp;
                              <button type="reset" class="btn btn-xs">重置<i class="icon-undo icon-on-right"></i></button>
                            </span>
                          </div>
                        </div>  
                      </div>
                    </form>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div><!-- /.page-header -->
      
      <input id="districtsValue" type="hidden">
      <input id="townsValue" type="hidden">
      <input id="districtsAddValue" type="hidden">
      <input id="townsAddValue" type="hidden">
      <input id="buildingId" type="hidden">
      <input id="buildingIdAdd" type="hidden">
      
	    <div class="row">
	      <div class="col-xs-12 widget-container-span">
	        <!-- PAGE CONTENT BEGINS -->
	        <div class="widget-box">
		        <div class="widget-header header-color-blue">
		          <h5><i class="icon-table"></i>客户需求列表</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-add" data-whatever="add">新增<i class="icon-edit align-top icon-on-right"></i>
                </button>
	              <button class="btn btn-minier">导出<i class="icon-print align-top icon-on-right"></i>
								</button>
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table id="tableCustomerRequire" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th width="50"></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>客户名称</th>
			                <th>类型</th>
			                <th width="130"><i class="icon-time hidden-480"></i>创建时间</th>
			                <th class="text-center hidden-480" width="80">状态</th>
			                <th class="text-center" width="140">操作</th>
			              </tr>
			            </thead>
			          </table>
			        </div>
		        </div>
	        </div>
	        
	        <!-- modal-add -->
	        <div id="modal-add" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h5 class="blue bigger">客户新增</h5>
                </div>
                <!-- form -->
                <form class="form-horizontal" id="dataAddForm">
                  <input type="hidden" id="dataId">
                  <div class="modal-body overflow-visible modal-body-content">                
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">区域：</label>
                      <div class="col-md-10">
                        <ul class="list-inline" id="districtsAdd">
                          <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">不限</button></li>
                          <c:forEach var="data" items="${regions}">
                          <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">${data.name}</button></li>
                          </c:forEach> 
                        </ul>
                        <div id="townsPaneAdd">
                          <hr class="hr-line">
                          <ul class="list-inline" id="townsAdd">
                            <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">楼盘：</label>
                      <div class="col-md-5">
                        <div class="input-group">
                          <input class="input-field" type="text" id="buildingNameAdd" placeholder="楼盘名称">
                          <span class="input-group-addon"><i class="icon-home"></i></span>
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">姓名：</label>
                      <div class="col-md-10">
                        <select class="input-select input-chosen" id="nameAdd">
                          <option value="">不限</option>
                          <c:forEach var="data" items="${customers}">
                          <option value="${data.id}">${data.name}</option>
                          </c:forEach>
                        </select>
                        &nbsp;
                        <label>
                          <input name="typeAdd" type="radio" class="ace" checked>
                          <span class="lbl"> 不限</span>
                        </label>
                        &nbsp;
                        <label>
                          <input name="typeAdd" type="radio" class="ace">
                          <span class="lbl"> 求购</span>
                        </label>
                        &nbsp;
                        <label>
                          <input name="typeAdd" type="radio" class="ace">
                          <span class="lbl"> 求租</span>
                        </label>
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">价格：</label>
                      <div class="col-md-5">
                        <input class="input-text" type="text" id="priceBeginAdd">
                        <small>~</small>
                        <input class="input-text" type="text" id="priceEndAdd">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">面积：</label>
                      <div class="col-md-5">
                        <input class="input-text" type="text" id="areaBeginAdd">
                        <small>~</small>
                        <input class="input-text" type="text" id="areaEndAdd">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">户型：</label>
                      <div class="col-md-8">
                        <select class="input-select input-chosen" multiple="" id="roomAdd" data-placeholder="不限">
                          <option value="0">不限</option>
                          <option value="1">1室</option>
                          <option value="2">2室</option>
                          <option value="3">3室</option>
                          <option value="4">4室</option>
                          <option value="5">5室</option>
                        </select>
                        <small>~</small>
                        <select class="input-select input-chosen" multiple="" id="saloonAdd" data-placeholder="不限">
                          <option value="0">不限</option>
                          <option value="1">1厅</option>
                          <option value="2">2厅</option>
                          <option value="3">3厅</option>
                          <option value="4">4厅</option>
                          <option value="5">5厅</option>
                        </select>
                        <small>~</small>
                        <select class="input-select input-chosen" multiple="" id="toiletAdd" data-placeholder="不限">
                          <option value="0">不限</option>
                          <option value="1">1卫</option>
                          <option value="2">2卫</option>
                          <option value="3">3卫</option>
                          <option value="4">4卫</option>
                          <option value="5">5卫</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">状态：</label>
                      <div class="col-md-8">
                        <label class="switch-box">
                         <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusAdd" checked/>
                         <span class="lbl"></span>
                        </label>
                      </div>
                    </div>
	                </div>
	                <div class="modal-footer">
	                  <button class="btn btn-xs" data-dismiss="modal"><i class="icon-remove"></i>关闭</button>
	                  <button class="btn btn-xs btn-primary" type="submit"><i class="icon-ok"></i>保存</button>
	                </div>
                </form>
                <!-- form -->
              </div>
            </div>
          </div>
          <!-- modal-add -->
	        <!-- PAGE CONTENT ENDS -->
	      </div><!-- /.col -->
	    </div><!-- /.row -->
	  </div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jscript>
	<script src="${ctx}/js/format-util.js"></script>
	<script src="${ctx}/js/chosen.jquery.min.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script src="${ctx}/js/dataTables.bootstrap.js"></script>
  <script src="${ctx}/js/jquery.autocompleter.js"></script>
  <script src="${ctx}/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${ctx}/js/bootbox.min.js"></script>
  <script src="${ctx}/js/jquery.hotkeys.min.js"></script>
  <script src="${ctx}/js/bootstrap-wysiwyg.min.js"></script>
  <script src="${ctx}/js/jquery.colorbox-min.js"></script>
  <script src="${ctx}/js/bootstrapValidator.min.js"></script>
	<script>
	var d = null;
	var tableCustomerRequire = null;
	var tableCustomerRequireUnit = null;
	$(document).ready(function() {
		$('#townsPane').hide();
		$('#townsPaneAdd').hide();
		$('.chosen-select').chosen(); 
		$('#searchForm').bootstrapValidator({
      submitHandler: function(validator, form, submitButton) {
    	  queryCustomerRequires();
    	  validator.disableSubmitButtons(false);
      }
    });
		$('#dataAddForm').bootstrapValidator({
			/* message: 'This value is not valid',
      feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
      }, */
      submitHandler: function(validator, form, submitButton) {
        submitForm();
      }
			/* fields: {
				name: {
          validators: {
            notEmpty: {
              message: '不能为空'
            }
          }
        }
      } */
		});
		tableCustomerRequire = $('#tableCustomerRequire').DataTable({
			'language': {
         'processing':  '处理中...',
         'lengthMenu':  '每页 _MENU_ 条记录',
         'zeroRecords': '没有找到记录',
         'infoEmpty':   '无记录',
         'info':        '当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录',
         'paginate': {
           'first':     '首页',
           'previous':  '上页 ',
           'next':      '下页 ',
           'last':      '末页 '
         }
      },
      'dom': 't<"row"<"col-xs-6"i><"col-xs-6"p>>',
      'processing': true,
      'serverSide': true, //开启服务器模式
      //'deferRender': true, //开启延迟渲染
      'ajax': {
        'url': '${ctx}/home/customerRequire/queryData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          //d.tag = 'release';
          //d.sort = $('#sort').val();
          //d.level = '${level}';
        }
      },
			'columnDefs': [
        { 'orderable': false, 'targets': 0},
        { 'orderable': false, 'targets': 1, 'render': function(data, type, row) {
          var content = '<div class="text-center"><label>';
          content += '<input type="checkbox" class="ace" />';
          content += '<span class="lbl"></span>';
          content += '</label></div>';
          return content;
        }},
        { 'orderable': false, 'targets': 2, 'render': function(data, type, row) {
          return '1';
        }},
        { 'orderable': false, 'targets': 3, 'render': function(data, type, row) {
          return '2';
        }},
        { 'targets': 4, 'render': function(data, type, row) {
          var content = to_date_hm(data.createTime);
          return content;
        }},
        { 'orderable': false, 'targets': 5, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          if (+data.status) {
        	  content += '<span class="label label-sm label-success">有效</span>';
          } else {
        	  content += '<span class="label label-sm arrowed"><s>失效</s></span>';
          }
          content += '</div>';
          return content;
        }},
        { 'orderable': false, 'targets': 6, 'render': function(data, type, row) {
        	var content = '<div class="text-center">';
          content += '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
          //content += '  <a class="blue" href="#modal-table" role="button" data-toggle="modal" data-customer="' + data.id + '" title="查看需求"><i class="icon-info bigger-130"></i></a>';
          //content += '  <a class="blue" href="#" title="新增需求"><i class="icon-edit bigger-130"></i></a><br>';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" onclick="editCustomerRequire(\'' + data.id + '\');" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          //content += '  <a class="green" href="#modal-add" role="button" data-toggle="modal" data-region="' + data.id + '" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" onclick="trashCustomerRequire(\'' + data.id + '\');" title="删除" ><i class="icon-trash bigger-130"></i></a>';
          content += '</div>';
          content += '<div class="visible-xs visible-sm hidden-md hidden-lg">';
          content += '  <div class="inline position-relative">';
          content += '    <button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">';
          content += '      <i class="icon-caret-down icon-only bigger-120"></i>';
          content += '    </button>';
          content += '    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">';
          content += '      <li>';
          content += '        <a href="#" class="tooltip-info" data-rel="tooltip" title="View">';
          content += '          <span class="blue"><i class="icon-zoom-in bigger-120"></i></span>';
          content += '        </a>';
          content += '      </li>';
          content += '      <li>';
          content += '        <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">';
          content += '          <span class="green"><i class="icon-edit bigger-120"></i></span>';
          content += '        </a>';
          content += '      </li>';
          content += '      <li>';
          content += '        <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">';
          content += '          <span class="red"><i class="icon-trash bigger-120"></i></span>';
          content += '        </a>';
          content += '      </li>';
          content += '    </ul>';
          content += '  </div>';
          content += '</div>';
          content += '</div>';
          return content;
        }}
			],
			'order': [
        [0, null]
      ],
      'columns': [
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null }
      ],
      initComplete: function () {
    	  
      }
		});
		tableCustomerRequire.on('order.dt search.dt',
      function () {
			  tableCustomerRequire.column(0, {
          search: 'applied',
          order: 'applied'
        }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
    }).draw();
		
		queryBuildingName('buildingName', 'buildingId', 'districtsValue', 'townsValue');
		queryBuildingName('buildingNameAdd', 'buildingIdAdd', 'districtsAddValue', 'townsAddValue');
		
		/* $('#modal-add').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget);
		  var whatever = button.data('whatever');
			$('#dataAddForm').data('bootstrapValidator').resetForm();
			if (whatever) {
				$('#statusAdd').attr('checked', 'checked');
			}
		}); */
		$('#modal-add').on('shown.bs.modal', function (event) {
			$('.input-chosen').chosen();
			var button = $(event.relatedTarget);
      var whatever = button.data('whatever');
      $('#dataAddForm').data('bootstrapValidator').resetForm();
      if (whatever) {
        $('#statusAdd').attr('checked', 'checked');
      }
    });
	});
	
	function submitForm() {
		var dataId = $('#dataId').val();
    var customerId = $('#nameAdd').val();
    var buildingId = $('#buildingIdAdd').val();
    var priceBegin = $('#priceBeginAdd').val();
    var priceEnd = $('#priceEndAdd').val();
    var areaBegin = $('#areaBeginAdd').val();
    var areaEnd = $('#areaEndAdd').val();
    var rooms = $('#roomAdd').val();
    if (rooms) {
    	rooms = rooms.join();
    }
    var saloons = $('#saloonAdd').val();
    if (saloons) {
    	saloons = saloons.join();
    }
    var toilets = $('#toiletAdd').val();
    if (toilets) {
    	toilets = toilets.join();
    }
    var status = '0';
    if ($('#statusAdd').is(':checked')) {
      status = '1';
    }
    var url = '${ctx}/home/customerRequire/saveOrUpdate?random='+ Math.random();
    var params = {
    		id: dataId,
    		customerId: customerId,
    		buildingIds: buildingId,
    		priceBegin: priceBegin * 100,
    		priceEnd: priceEnd * 100,
    		areaBegin: areaBegin * 100,
    		areaEnd: areaEnd * 100,
    		rooms: rooms,
    		saloons: saloons,
    		toilets: toilets,
        status: status
    };
    $.post(url, params, function(result) {
      $('#modal-add').modal('hide');
      dialog({
       title: '消息',
       content: result.message,
       okValue: '确定',
       ok: function () {
         queryCustomerRequires();
         return true;
       }
     }).width(100).showModal();
    }, 'json');
	}
	function queryCustomerRequires() {
		d = dialog({
      title: '查询载入中...'
    });
    d.showModal();
    var search = '?random=' + Math.random();
    var nameValue = $('#name').val();
    if (nameValue) {
    	search += '&name=' + nameValue;
    }
    tableCustomerRequire.ajax.url('${ctx}/home/customerRequire/queryData' + search).load();
    d.close();
	}
	function editCustomerRequire(dataId) {
		var url = '${ctx}/home/customerRequire/getData?random='+ Math.random();
    var params = {
        id: dataId
    };
    $.post(url, params, function(result) {
      if (result.status) {
    	  $('#dataId').val(dataId);
    	  $('#nameAdd').val(result.data.name);
    	  $('#phoneAdd').val(result.data.phone);
    	  var status = result.data.status;
    	  if (+status) {
          $('#statusAdd').attr('checked', 'checked');
        } else {
          $('#statusAdd').removeAttr('checked');
        }
    	  $('#modal-add').modal('show');
      } else {
    	  dialog({
          title: '消息',
          content: result.message,
          okValue: '确定',
          ok: true
        }).width(100).showModal();
      }
    }, 'json');
	}
	function trashCustomerRequire(dataId) {
		dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
        this.title('删除中…');
        var url = '${ctx}/home/customerRequire/trash?random='+ Math.random();
        var params = {
            id: dataId
        };
        $.post(url, params, function(result) {
          dialog({
            title: '消息',
            content: result.message,
            okValue: '确定',
            ok: function () {
              tableCustomerRequire.ajax.reload();
              return true;
            }
          }).width(100).showModal();
        }, 'json');
      },
      cancelValue: '取消',
      cancel: function () {}
    }).width(100).showModal();
	}
	function queryRegions(regionId, name, _this, fieldIds) {
    addActivedName(fieldIds[0], regionId, name, _this);
    var $towns = $('#' + fieldIds[1]);
    var $townsPane = $('#' + fieldIds[2]);
    $towns.children().not(':first').remove();
    if (regionId) {
      var url = '${ctx}/home/region/list?random='+ Math.random();
      var params = {
        parentId: regionId
      };
      $.post(url, params, function(result) {
        if (result.status) {
          for (var i=0; i<result.data.length; i++) {
            $htmlLi = $('<li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName(\'' + fieldIds[1] + '\', \'' + result.data[i].id + '\', \'' + result.data[i].name + '\', this);">' + result.data[i].name + '</button></li>');
            $towns.append($htmlLi).append('\n');
          }
          $townsPane.show();
        }
      }, 'json');
    } else {
      $townsPane.hide();
      $towns.children(':first').children().removeClass('btn-link').addClass('btn-danger');
    }
  }
	function addActivedName(fieldId, val, name, _this) {
    $('#' + fieldId + ' li>button.btn-danger').removeClass('btn-danger').addClass('btn-link');
    if (_this) {
      $(_this).removeClass('btn-link').addClass('btn-danger');
    }
    $('#' + fieldId + 'Value').val(val);
  }
	function queryBuildingName(buildingName, buildingId, districts, towns) {
    $('#' + buildingName).autocompleter({
      // marker for autocomplete matches
      highlightMatches: true,
      // object to local or url to remote search
      source: '${ctx}/home/building/search',
      // custom template
      template: '{{ label }} <span>({{ districtName }}-{{ townName }})</span>',
      // show hint
      hint: true,
      // abort source if empty field
      empty: false,
      // max results
      //limit: 1,
      combine: function() {
        var districtId = $('#' + districts).val();
        var townId = $('#' + towns).val();
        if (townId) {
          districtId = '';
        } else {
          townId = '';
        }
        return {
          buildingName: $('#' + buildingName).val(),
          districtId: districtId,
          townId: townId
        };
      },
      callback: function (value, index, selected) {
        if (selected) {
          $('#' + buildingId).val(selected.buildingId);
        }
      }
    });
  }
	</script>
	</jscript>
</body>
</html>
