<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>首页-爱房网</title>
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/datepicker.css" rel="stylesheet">
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
  </style>
  </css>
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">新房</a></li>
	      <li class="active">出售</li>
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
            <h5>房源搜索</h5>
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
		                    <div class="col-md-4">
		                      <div class="input-group">
		                        <input class="input-field" type="text" id="buildingName" placeholder="楼盘名称">
		                        <span class="input-group-addon"><i class="icon-home"></i></span>
                          </div>
		                    </div>
		                    <label class="col-md-1 control-label no-padding-right">栋座：</label>
		                    <div class="col-md-4">
	                        <select class="input-select" id="buildingUnit">
                            <option value="">选择栋座</option>
                          </select>
		                    </div>
		                  </div>
		                  <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-info btn-xs" id="btnHouseSearch">搜索<i class="icon-search icon-on-right"></i></button>
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
	        <!-- <div class="table-header">
	          <button class="btn btn-xs btn-success">
	          <i class="icon-edit"></i>
	          <span class="bigger-110 no-text-shadow">新增</span>
	          </button>
	        </div> -->
	        
	        <div class="widget-box">
		        <div class="widget-header header-color-blue">
		          <h5><i class="icon-table"></i>房源列表</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-form">新增<i class="icon-edit align-top icon-on-right"></i>
                </button>
	              <button class="btn btn-minier">导出<i class="icon-print align-top icon-on-right"></i>
								</button>
	             <!-- <a href="#" id="btn-add" data-action="settings"><i class="icon-edit"></i></a>
	             <a href="#" data-action="reload"><i class="icon-refresh"></i></a>
	             <a class="action-close" href="#" title="删除"><i class="icon-remove"></i></a> --> 
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table id="tableHouse" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th width="50"></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>楼盘栋座</th>
			                <th>房号</th>
			                <th>编号</th>
			                <th class="text-right" width="90">户型</th>
			                <th width="130"><i class="icon-time hidden-480"></i>创建时间</th>
			                <th class="text-center hidden-480">状态</th>
			                <th class="text-center" width="110">操作</th>
			              </tr>
			            </thead>
			          </table>
			        </div>
		        </div>
	        </div>
	        
	        <div id="modal-form" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-body overflow-visible modal-body-content">
                  <div class="widget-container-span">
                    <div class="widget-box transparent">
						          <div class="widget-header">
						            <h6>房源新增</h6>
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
					                        <div class="col-md-8">
					                          <div class="input-group">
					                            <input class="input-field" type="text" id="buildingNameAdd" placeholder="楼盘名称">
					                            <span class="input-group-addon"><i class="icon-home"></i></span>
					                          </div>
					                        </div>
					                      </div>
                                <div class="form-group form-row">
					                        <label class="col-md-2 control-label no-padding-right">栋座：</label>
					                        <div class="col-md-8">
					                          <select class="input-select" id="buildingUnitAdd">
					                            <option value="">选择栋座</option>
					                          </select>          
					                        </div>
					                      </div>
					                    </form>
				                    </td>
			                    </tr>
		                    </tbody>
		                    </table>
						          </div>
						        </div>
                  </div>
                  <table class="table table-search">
                  <tbody>
                    <tr>
                      <td>
                        <form class="form-horizontal">
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">房号：</label>
				                    <div class="col-md-8">
				                      <input class="input-text" type="text" id="cardAdd" placeholder="房号">
				                    </div>
				                  </div>
				                  <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">户型：</label>
                            <div class="col-md-8">
		                          <select class="input-select" id="roomAdd">
		                            <option value="0">选择室</option>
		                            <option value="1">1室</option>
		                            <option value="2">2室</option>
		                            <option value="3">3室</option>
		                            <option value="4">4室</option>
		                            <option value="5">5室</option>
		                          </select>
		                          <small>~</small>
		                          <select class="input-select" id="saloonAdd">
		                            <option value="0">选择厅</option>
		                            <option value="1">1厅</option>
		                            <option value="2">2厅</option>
		                            <option value="3">3厅</option>
		                            <option value="4">4厅</option>
		                            <option value="5">5厅</option>
		                          </select>
		                          <small>~</small>
		                          <select class="input-select" id="toiletAdd">
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
                            <label class="col-md-2 control-label no-padding-right">面积：</label>
                            <div class="col-md-8">
                              <input class="input-text" type="text" id="areaAdd" placeholder="面积">
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">朝向：</label>
                            <div class="col-md-8">
                              <select class="input-select" id="faceAdd">
                                <option value="0">选择朝向</option>
                                <option value="1">东</option>
                                <option value="2">南</option>
                                <option value="3">西</option>
                                <option value="4">北</option>
                              </select>
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">楼层：</label>
                            <div class="col-md-8">
                              <input class="input-text" type="text" id="floorAdd" placeholder="楼层">
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">编号：</label>
                            <div class="col-md-8">
                              <input type="text" id="codeAdd" placeholder="编号">
                            </div>
                          </div>
				                </form>
                      </td>
                    </tr>
                  </tbody>
                  </table>
                </div>

                <div class="modal-footer">
                  <button class="btn btn-sm" data-dismiss="modal"><i class="icon-remove"></i>关闭</button>
                  <button class="btn btn-sm btn-primary" id="btnSaveHouse"><i class="icon-ok"></i>保存</button>
                </div>
              </div>
            </div>
          </div>
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
  <script src="${ctx}/js/jquery.hotkeys.min.js"></script>
  <script src="${ctx}/js/bootstrap-wysiwyg.min.js"></script>
	<script>
	var d = null;
	var tableHouse = null;
	$(document).ready(function() {
		$('#townsPane').hide();
		$('#townsPaneAdd').hide();
		tableHouse = $('#tableHouse').DataTable({
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
        'url': '${ctx}/home/house/queryManageData',
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
         content += data.buildingName + '<small>（' + data.districtName + '-' + data.townName + '）</small>，A栋';
         return content;
       }},
       { 'orderable': false, 'targets': 3, 'render': function(data, type, row) {
         var content = '';
         content += '105房';
         return content;
       }},
       { 'orderable': false, 'targets': 5, 'render': function(data, type, row) {
         var content = '<div class="text-right">';
         content += data.room + '室' + data.saloon + '厅' + data.toilet + '卫';
         content += '</div>';
         return content;
       }},
       { 'targets': 6, 'render': function(data, type, row) {
         var content = to_date_hm(data.createTime);
         return content;
       }},
       { "orderable": false, "targets": 7, "render": function(data, type, row) {
    	   var content = '<div class="text-center">';
         content += '<span class="label label-sm label-warning">有效</span>';
         content += '</div>';
         return content;
       }},
       { "orderable": false, "targets": 8, "render": function(data, type, row) {
    	   var content = '<div class="text-center">';
         content += '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
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
       { 'data': 'code', 'orderable': false },
       { 'data': null },
       { 'data': null },
       { 'data': null },
       { 'data': null }
     ],
     initComplete: function () {
         
     }
   });
		tableHouse.on('order.dt search.dt',
      function () {
			tableHouse.column(0, {
          search: 'applied',
          order: 'applied'
        }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
    }).draw();
		queryBuildingName('buildingName', 'buildingUnit', 'districtsValue', 'townsValue');
		queryBuildingName("buildingNameAdd", "buildingUnitAdd", "districtsAddValue", "townsAddValue");

    $('#btnHouseSearch').click(function() {
    	queryHouses();
    });
    $('#btnSaveHouse').click(function() {
    	var buildingUnitId = $('#buildingUnitAdd').val();
      var card = $('#cardAdd').val();
      var room = $('#roomAdd').val();
      var saloon = $('#saloonAdd').val();
      var toilet = $('#toiletAdd').val();
      var area = $('#areaAdd').val();
      var face = $('#faceAdd').val();
      var floor = $('#floorAdd').val();
      var code = $('#codeAdd').val();
      var url = '${ctx}/home/house/save?random='+ Math.random();
      var params = {
    		  buildingUnitId: buildingUnitId,
    		  card: card,
    		  room: room,
    		  saloon: saloon,
    		  toilet: toilet,
    		  area: area * 100,
    		  face: face,
    		  floor: floor,
    		  code: code
      };
      $.post(url, params, function(result) {
        $('#modal-form').modal('hide');
        dialog({
         title: '消息',
         content: result.message,
         okValue: '确定',
         ok: function () {
        	 queryHouses();
           return true;
         }
       }).width(100).showModal();
      }, 'json');
    });
  });
	function queryHouses() {
		d = dialog({
      title: '房源载入中...'
    });
    d.showModal();
    var search = '?random=' + Math.random();
    var townsValue = $('#townsValue').val();
    if (townsValue) {
      search += '&townId=' + townsValue;
    } else {
      var districtsValue = $('#districtsValue').val();
      if (districtsValue) {
        search += '&districtId=' + districtsValue;
      }
    }
    search += '&buildingName=' + $('#buildingName').val();
    var buildingUnitId = $('#buildingUnit').val();
    if (buildingUnitId) {
      search += '&buildingUnitId=' + buildingUnitId;
    }
    
    tableHouse.ajax.url('${ctx}/home/house/queryManageData' + search).load();
    d.close();
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
      },
      callback: function (value, index, selected) {
        if (selected) {
          var buildingId = selected.buildingId;
          if (buildingId) {
            var url = '${ctx}/home/buildingUnit/select?random=' + Math.random();
            var params = {
                buildingId: buildingId
            };
            $.post(url, params, function(result) {
              if (result.status) {
                var $buildingUnit = $('#' + buildingUnit);
                $buildingUnit.children().not(':first').remove();
                for(var i=0; i<result.data.length; i++) {
                  $buildingUnit.append('<option value="' + result.data[i].id + '">' + result.data[i].name + '</option>');
                }
              }
            }, 'json');
          }
        }
      }
    });
	}
	</script>
	</jscript>
</body>
</html>
