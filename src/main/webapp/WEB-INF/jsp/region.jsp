<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>地区-爱房网</title>
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/datepicker.css" rel="stylesheet">
  <link href="${ctx}/css/dropzone.css" rel="stylesheet">
  <link href="${ctx}/css/colorbox.css" rel="stylesheet">
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
  
  .modal-body-content {padding-top: 5px;}
  
  .ace-thumbnails>li {margin-left: 20px;} 
  
  .date-picker {width: 110px;}
  
  .dropzone .dz-preview, 
  .dropzone-previews .dz-preview {margin-left: 27px;}
  .dropzone .dz-preview .error-message-tip, 
  .dropzone-previews .dz-preview .error-message-tip {
    top: 0;
    left: 0;
    min-width: 0;
  }
  </style>
  </css>
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">地区</a></li>
	      <li class="active">${name}</li>
	    </ul><!-- .breadcrumb -->
	
	    <!-- <div class="nav-search" id="nav-search">
	      <form class="form-search">
	        <span class="input-icon">
	          <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
	          <i class="icon-search nav-search-icon"></i>
	        </span>
	      </form>
	    </div> --><!-- #nav-search -->
	  </div>
	
	  <div class="page-content">
      <div class="widget-container-span">
        <div class="widget-box transparent">
          <div class="widget-header">
            <h5>${name}搜索</h5>
            <div class="widget-toolbar no-border">
              <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
            </div>
          </div>
          
          <div class="widget-body">
            <table class="table table-striped table-search">
              <tbody>
                <tr>
                  <td>
                    <form class="form-horizontal">
                      <c:if test="${type != '1'}">
                      <c:if test="${type == '2' || type == '3' || type == '4' || type == '5'}">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">国家：</label>
                        <div class="col-md-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districts', 'towns', 'townsPane']);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                        </div>
                      </div>
                      </c:if>
                      <c:if test="${type == '3' || type == '4' || type == '5'}">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">省份：</label>
                        <div class="col-md-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districts', 'towns', 'townsPane']);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                        </div>
                      </div>
                      </c:if>
                      <c:if test="${type == '4' || type == '5'}">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">市县：</label>
                        <div class="col-md-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districts', 'towns', 'townsPane']);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                        </div>
                      </div>
                      </c:if>
                      <c:if test="${type == '5'}">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">城区：</label>
                        <div class="col-md-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districts', 'towns', 'townsPane']);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                        </div>
                      </div>
                      </c:if>
                      </c:if>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">名称：</label>
                        <div class="col-md-2">
                          <input class="input-text" type="text" id="name" placeholder="${name}名称">
                        </div>
                        <label class="col-md-1 control-label no-padding-right">编码：</label>
                        <div class="col-md-2">
                          <input class="input-text" type="text" id="code" placeholder="${name}编码">
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-info btn-xs" id="btnBuildingSearch">搜索<i class="icon-search icon-on-right"></i></button>
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
      
	    <div class="row">
	      <div class="col-xs-12 widget-container-span">
	        <!-- PAGE CONTENT BEGINS -->
	        <div class="widget-box">
		        <div class="widget-header header-color-blue">
		          <h5><i class="icon-table"></i>${name}列表</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-add">新增<i class="icon-edit align-top icon-on-right"></i>
                </button>
	              <button class="btn btn-minier">导出<i class="icon-print align-top icon-on-right"></i>
								</button>
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table id="tableBuilding" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>${name}名称</th>
			                <th>${name}编码</th>
			                <th width="130"><i class="icon-time hidden-480"></i>创建时间</th>
			                <th class="text-center hidden-480">状态</th>
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
                  <h5 class="blue bigger">${name}新增</h5>
                </div>
                <div class="modal-body overflow-visible modal-body-content">                  
                  <form class="form-horizontal">
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">${name}名称：</label>
                      <div class="col-md-8">
                        <input class="input-text" type="text" id="nameAdd" placeholder="${name}名称">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">${name}编码：</label>
                      <div class="col-md-8">
                        <input class="input-text" type="text" id="codeAdd" placeholder="${name}编码">
                      </div>
                    </div>
                  </form>
                </div>

                <div class="modal-footer">
                  <button class="btn btn-xs" data-dismiss="modal"><i class="icon-remove"></i>关闭</button>
                  <button class="btn btn-xs btn-primary" id="btnRegionSave"><i class="icon-ok"></i>保存</button>
                </div>
              </div>
            </div>
          </div>
          <!-- modal-add -->
          <!--  -->
	        <!-- PAGE CONTENT ENDS -->
	      </div><!-- /.col -->
	    </div><!-- /.row -->
	  </div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jscript>
	<script src="${ctx}/js/format-util.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script src="${ctx}/js/dataTables.bootstrap.js"></script>
  <script src="${ctx}/js/jquery.autocompleter.js"></script>
  <script src="${ctx}/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${ctx}/js/bootbox.min.js"></script>
  <script src="${ctx}/js/jquery.hotkeys.min.js"></script>
  <script src="${ctx}/js/bootstrap-wysiwyg.min.js"></script>
  <script src="${ctx}/js/dropzone.min.js"></script>
  <script src="${ctx}/js/jquery.colorbox-min.js"></script>
	<script>
	var d = null;
	var tableBuilding = null;
	var tableBuildingUnit = null;
	$(document).ready(function() {
		$('#townsPane').hide();
		$('#townsPaneAdd').hide();
		tableBuilding = $('#tableBuilding1').DataTable({
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
        'url': '${ctx}/home/building/queryManageData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          //d.tag = 'release';
          //d.sort = $('#sort').val();
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
          var content = '';
          content += data.buildingName + '<small>（' + data.districtName + '-' + data.townName + '）</small>';
          return content;
        }},
        { 'orderable': false, 'targets': 3, 'render': function(data, type, row) {
          return data.buildingAddress;
        }},
        { 'orderable': false, 'targets': 4, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          content += '<small>住宅</small>';
          content += '</div>';
          return content;
        }},
        { 'targets': 5, 'render': function(data, type, row) {
          var content = to_date_hm(data.createTime);
          return content;
        }},
        { 'orderable': false, 'targets': 6, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          content += '<span class="label label-sm label-warning">有效</span>';
          content += '</div>';
          return content;
        }},
        { 'orderable': false, 'targets': 7, 'render': function(data, type, row) {
        	var content = '<div class="text-center">';
          content += '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
          content += '  <a class="blue" href="#modal-table" role="button" data-toggle="modal" data-building="' + data.buildingId + '" title="栋座"><i class="icon-building bigger-130"></i></a>';
          content += '  <a class="blue" href="#modal-image" role="button" data-toggle="modal" data-building="' + data.buildingId + '" title="图片"><i class="icon-picture bigger-130"></i></a><br>';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" title="删除"><i class="icon-trash bigger-130"></i></a>';
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
        { 'data': null },
        { 'data': null }
      ],
      initComplete: function () {
    	  
      }
		});
		tableBuilding.on('order.dt search.dt',
      function () {
			  tableBuilding.column(0, {
          search: 'applied',
          order: 'applied'
        }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
    }).draw();
		
		queryBuildingName('buildingName', 'buildingUnit', 'districtsValue', 'townsValue');
		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
      $(this).prev().focus();
    });
		
		$('#btnBuildingSearch').click(function() {
			queryBuildings();
		});
		
		$('#btnBuildingSave').click(function() {
			var townId = $('#townsAddValue').val();
      var buildingName = $('#buildingNameAdd').val();
      var buildingAddress = $('#buildingAddressAdd').val();
      var buildingYear = $('#buildingYearAdd').val();
      var type = $('#typeAdd').val();
      var remarks = $('#editor1').html();
      var url = '${ctx}/home/building/save?random='+ Math.random();
      var params = {
    		  townId: townId,
    		  buildingName: buildingName,
    		  buildingAddress: buildingAddress,
    		  buildingYear: buildingYear,
    		  type: type
      };
      $.post(url, params, function(result) {
    	  $('#modal-add').modal('hide');
    	  dialog({
	       title: '消息',
	       content: result.message,
	       okValue: '确定',
	       ok: function () {
	    	   queryBuildings();
	    	   return true;
	       }
	     }).width(100).showModal();
      }, 'json');
		});
		
		$('#btnBuildingUnitSave').click(function() {
			var buildingId = $('#buildingId').val();
      var buildingUnitName = $('#buildingUnitNameAdd').val();
      var buildingFloor = $('#buildingFloorAdd').val();
      var url = '${ctx}/home/buildingUnit/save?random='+ Math.random();
      var params = {
    		  buildingId: buildingId,
    		  name: buildingUnitName,
    		  floor: buildingFloor
      };
      $.post(url, params, function(result) {
        //$('#modal-table').modal('hide');
        dialog({
         title: '消息',
         content: result.message,
         okValue: '确定',
         ok: function () {
        	 tableBuildingUnit.ajax.reload();
           return true;
         }
       }).width(100).showModal();
      }, 'json');
    });
		
		$('#modal-table').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget);
			var buildingId = button.data('building');
			$('#buildingId').val(buildingId);
			var url = "${ctx}/home/building/getData?random="+ Math.random();
      var params = {
          id: buildingId
      };
      $.post(url, params, function(result) {
        if (result.status) {
        	var data = result.data;
        	$('#buildingNameText').text(data.buildingName);
        	$('#buildingAddressText').text(data.buildingAddress);
        	
        	//tableBuildingUnit.search(buildingId).draw();
        	tableBuildingUnit.ajax.reload();
        	//var args = tableBuildingUnit.ajax.params();
          //console.log("额外传到后台的参数值extra_search为："+args.buildingId);
        }
      }, 'json');
		});
		
		$('#modal-image').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var buildingId = button.data('building');
      $('#buildingId').val(buildingId);
      var url = "${ctx}/home/building/getData?random="+ Math.random();
      var params = {
          id: buildingId
      };
      $.post(url, params, function(result) {
        if (result.status) {
          var data = result.data;
          $('#buildingNameImageText').text(data.buildingName);
          $('#buildingAddressImageText').text(data.buildingAddress);
          
          dropzoneImage(buildingId, '2');
        }
      }, 'json');
    });
		$('#modal-image').on('hidden.bs.modal', function (event) {
		  //alert(1);
		})
		
		$('#editor1').ace_wysiwyg({
	    toolbar:
	    [
	      'font',
	      null,
	      'fontSize',
	      null,
	      {name:'bold', className:'btn-info'},
	      {name:'italic', className:'btn-info'},
	      {name:'strikethrough', className:'btn-info'},
	      {name:'underline', className:'btn-info'},
	      null,
	      {name:'insertunorderedlist', className:'btn-success'},
	      {name:'insertorderedlist', className:'btn-success'},
	      {name:'outdent', className:'btn-purple'},
	      {name:'indent', className:'btn-purple'},
	      null,
	      {name:'justifyleft', className:'btn-primary'},
	      {name:'justifycenter', className:'btn-primary'},
	      {name:'justifyright', className:'btn-primary'},
	      {name:'justifyfull', className:'btn-inverse'},
	      null,
	      {name:'createLink', className:'btn-pink'},
	      {name:'unlink', className:'btn-pink'},
	      null,
	      {name:'insertImage', className:'btn-success'},
	      null,
	      'foreColor',
	      null,
	      {name:'undo', className:'btn-grey'},
	      {name:'redo', className:'btn-grey'}
	    ],
	    'wysiwyg': {
	      fileUploadError: showErrorAlert
	    }
	  }).prev().addClass('wysiwyg-style2');
	});
	function showErrorAlert(reason, detail) {
    var msg='';
    if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
    else {
      console.log("error uploading file", reason, detail);
    }
    $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
     '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
  }
	function queryBuildings() {
		d = dialog({
      title: '楼盘载入中...'
    });
    d.showModal();
    var search = '?random=' + Math.random();
    var townsValue = $('#townsValue').val();
    if (townsValue && townsValue != '0') {
      search += '&townId=' + townsValue;
    } else {
      var districtsValue = $('#districtsValue').val();
      if (districtsValue && districtsValue != '0') {
        search += '&districtId=' + districtsValue;
      }
    }
    var buildingNameValue = $('#buildingName').val();
    if (buildingNameValue) {
    	search += '&buildingName=' + buildingNameValue;
    }
    var dateBeginValue = $('#dateBegin').val();
    if (dateBeginValue) {
      search += '&createDateBegin=' + dateBeginValue;
    }
    var dateEndValue = $('#dateEnd').val();
    if (dateEndValue) {
      search += '&createDateEnd=' + dateEndValue;
    }
    tableBuilding.ajax.url('${ctx}/home/building/queryManageData' + search).load();
    d.close();
	}
	function queryBuildingUnits() {
		d = dialog({
      title: '栋座载入中...'
    });
    d.showModal();
	}
	function queryRegions(regionId, name, _this, fieldIds) {
		addActivedName(fieldIds[0], regionId, name, _this);
		var $towns = $('#' + fieldIds[1]);
	    var $townsPane = $('#' + fieldIds[2]);
	    $towns.children().remove();
	    if (regionId) {
	      var url = '${ctx}/home/region/list?random='+ Math.random();
	      var params = {
	        parentId: regionId
	      };
	      var $htmlLi = $('<li><button type="button" class="btn btn-danger btn-xs" onclick="addActivedName(\'' + fieldIds[1] + '\', \'\', \'\', this);">不限</button></li>');
	      $towns.append($htmlLi).append('\n');
	      
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
	    }
  }
	function addActivedName(fieldId, val, name, _this) {
		$('#' + fieldId + ' li>button.btn-danger').removeClass('btn-danger').addClass('btn-link');
    if (_this) {
      $(_this).removeClass('btn-link').addClass('btn-danger');
    }
    $('#' + fieldId + 'Value').val(val);
	}
	function queryBuildingName(buildingName, buildingUnit, districts, towns) {
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
      }
    });
	}
	function buildingUnitTrash(buildingUnitId) {
		dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
        this.title('删除中…');
        var url = '${ctx}/home/buildingUnit/trash?random='+ Math.random();
        var params = {
            id: buildingUnitId
        };
        $.post(url, params, function(result) {
          dialog({
            title: '消息',
            content: result.message,
            okValue: '确定',
            ok: function () {
              tableBuildingUnit.ajax.reload();
              return true;
            }
          }).width(100).showModal();
        }, 'json');
      },
      cancelValue: '取消',
      cancel: function () {}
    }).width(100).showModal();
	}
	
	function dropzoneImage(buildingId, type) {
		var params = '?random=' + Math.random();
		//params += '&foreignId=' + buildingId;
		//params += '&type=' + type;
		try {
		  $(".dropzone").dropzone({
		    url: '${ctx}/home/file/upload' + params,
		    paramName: 'file', // The name that will be used to transfer the file
		    acceptedFiles: 'image/*',
		    maxFilesize: 0.5, // MB
		    addRemoveLinks : true,
		    dictDefaultMessage: '<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 选择图片</span> 上传 \<span class="smaller-80 grey">(或者点击下面图标)</span> <br /> \<i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
		    dictResponseError: '上传失败',
		    //dictInvalidFileType: '你不能上传该类型文件,文件类型只能是*.xls',
		    dictRemoveFile: '删除文件',
		    dictCancelUpload: '取消上传',
        dictCancelUploadConfirmation: '你确定要取消上传吗?',
		    previewTemplate: '<div class="dz-preview dz-file-preview">\n  <div class="dz-details">\n    <div class="dz-filename"><span data-dz-name></span></div>\n    <div class="dz-size" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class="progress progress-small progress-striped active"><div class="progress-bar progress-bar-success" data-dz-uploadprogress></div></div>\n  <div class="dz-success-mark"><span></span></div>\n  <div class="dz-error-mark"><span></span></div>\n  <div class="dz-error-message error-message-tip"><span data-dz-errormessage></span></div>\n</div>',
		    params: {
          foreignId: buildingId,
          type: type
        },
        init: function() {
        	this.on("success", function(file, result) {
        		console.log("success");
            console.log(file);
            console.log(result);
            if (file.status == 'success') {
              if (!result.status) {
            	  $('.dz-preview').removeClass('dz-success').addClass('dz-error');
            	  $('.dz-error-message span').html('上传失败');
              }
            }
          });
        	this.on("complete", function(file) {
            console.log("complete");
            console.log(file);
            if (file.status == 'error') {
            	$('.dz-error-message span').html('上传失败');
            }
          });
          /* this.on("removedfile", function(file) {
        	  console.log(file);
        	  if (file.status == 'success') {
              //$('.dz-error-message span').html('上传失败');
        		  var result = JSON.parse(file.xhr.response);
              console.log(result);
              dialog({
                title: '消息',
                content: '确定要删除吗?',
                okValue: '确定',
                ok: function () {
                  var that = this;
                  this.title('删除中…');
                  var url = '${ctx}/home/buildingUnit/trash?random='+ Math.random();
                  var params = {
                      id: buildingUnitId
                  };
                  $.post(url, params, function(result) {
                    dialog({
                      title: '消息',
                      content: result.message,
                      okValue: '确定',
                      ok: function () {
                        tableBuildingUnit.ajax.reload();
                        return true;
                      }
                    }).width(100).showModal();
                  }, 'json');
                  var _ref;
                  return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                },
                cancelValue: '取消',
                cancel: function () {}
              }).width(100).showModal();
            }
          }); */
        },
        removedfile: function(file) {
          if (file.status == 'success') {
            var result = JSON.parse(file.xhr.response);
            if (result.status) {
            	dialog({
                title: '消息',
                content: '确定要删除吗?',
                okValue: '确定',
                ok: function () {
                  var that = this;
                  this.title('删除中…');
                  var url = '${ctx}/home/file/trash?random='+ Math.random();
                  var params = {
                      id: result.data.id
                  };
                  $.post(url, params, function(results) {
                    dialog({
                      title: '消息',
                      content: results.message,
                      okValue: '确定',
                      ok: function () {
                    	  if (results.status) {
                    		  var _ref;
                          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                    	  }
                        return true;
                      }
                    }).width(100).showModal();
                  }, 'json');
                },
                cancelValue: '取消',
                cancel: function () {}
              }).width(100).showModal();
            } else {
            	var _ref;
              return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
            }
          }
        }
		  });
		} catch(e) {
		  //alert('Dropzone.js does not support older browsers!');
		}
	}
	</script>
	</jscript>
</body>
</html>
