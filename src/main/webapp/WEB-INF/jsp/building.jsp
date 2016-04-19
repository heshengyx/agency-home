<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>楼盘-爱房网</title>
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/datepicker.css" rel="stylesheet">
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
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">小区</a></li>
	      <li class="active">楼盘</li>
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
            <h5>楼盘搜索</h5>
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
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('0', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
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
		                  </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">时间：</label>
                        <div class="col-md-5">
                          <span class="input-icon input-icon-right">
                            <input class="date-picker" style="width:110px" id="dateBegin" type="text" data-date-format="yyyy-mm-dd" placeholder="开始时间">
                            <i class="icon-calendar"></i>
                          </span>
                          <small>~</small>
                          <span class="input-icon input-icon-right">
                            <input class="date-picker" style="width:110px" id="dateEnd" type="text" data-date-format="yyyy-mm-dd" placeholder="结束时间">
                            <i class="icon-calendar"></i>
                          </span>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-info btn-sm input-text" id="btnSearch">搜索<i class="icon-search icon-on-right"></i></button>
                              &nbsp;&nbsp;
                              <button type="reset" class="btn btn-sm input-text">重置<i class="icon-undo icon-on-right"></i></button>
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
		          <h5><i class="icon-table"></i>楼盘列表</h5>
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
			          <table id="tableData" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>楼盘名称</th>
			                <th>楼盘地址</th>
			                <th class="text-center" width="70">类型</th>
			                <th width="130"><i class="icon-time hidden-480"></i>创建时间</th>
			                <th class="text-center hidden-480" width="50">状态</th>
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
						            <h6>楼盘新增</h6>
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
					                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('0', '', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">不限</button></li>
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
                            <label class="col-md-2 control-label no-padding-right">楼盘：</label>
                            <div class="col-md-8">
                              <div class="input-group">
                                <input class="input-field" type="text" id="buildingNameAdd" placeholder="楼盘名称">
                                <span class="input-group-addon"><i class="icon-home"></i></span>
                              </div>
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">地址：</label>
                            <div class="col-md-8">
                              <input class="input-field" type="text" id="buildingAddressAdd" placeholder="楼盘地址">
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">建筑年代：</label>
                            <div class="col-md-2">
                              <input class="input-text" type="text" id="buildingYearAdd" placeholder="建筑年代">
                            </div>
                            <label class="col-md-2 control-label no-padding-right">类型：</label>
                            <div class="col-md-2">
                              <select class="input-select" id="typeAdd">
	                              <option value="0">选择类型</option>
	                              <option value="1">住宅</option>
	                            </select>
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">描述：</label>
                            <div class="col-md-10">
                              <div class="wysiwyg-editor" id="editor1"></div>
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
                  <button class="btn btn-sm btn-primary" id="btnSave"><i class="icon-ok"></i>保存</button>
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
	var table = null;
	$(document).ready(function() {
		$("#townsPane").hide();
		$("#townsPaneAdd").hide();
		table = $('#tableData').DataTable({
			 "language": {
	       "processing":  "处理中...",
	       "lengthMenu":  "每页 _MENU_ 条记录",
	       "zeroRecords": "没有找到记录",
	       "infoEmpty":   "无记录",
	       "paginate": {
	         "first":     "首页",
	         "previous":  "上页 ",
	         "next":      "下页 ",
	         "last":      "末页 "
	       }
	    },
			//"dom": "<'row'<'col-xs-12'>>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
			"dom": "t<'row'<'col-xs-6'i><'col-xs-6'p>>",
			"processing": true,
      "serverSide": true, //开启服务器模式
      //"deferRender": true, //开启延迟渲染
      "ajax": {
        "url": "${ctx}/home/building/query",
        "type": "POST",
        "data": function ( d ) { //添加额外的参数发送到服务器
          //d.tag = "release";
          //d.sort = $("#sort").val();
        }
      },
			"columnDefs": [
        { "visible": false, "targets": 0},
        { "orderable": false, "targets": 1, "render": function(data, type, row) {
          var content = "<div class=\"text-center\"><label>";
          content += "<input type=\"checkbox\" class=\"ace\" />";
          content += "<span class=\"lbl\"></span>";
          content += "</label></div>";
          return content;
        }},
        { "orderable": false, "targets": 2, "render": function(data, type, row) {
          var content = "";
          content += data.buildingName + "<small>（福田-）</small>";
          return content;
        }},
        { "orderable": false, "targets": 3, "render": function(data, type, row) {
          return data.buildingAddress;
        }},
        { "orderable": false, "targets": 4, "render": function(data, type, row) {
        	var content = "<div class=\"text-center\">";
          content += "<small>住宅</small>";
          content += "</div>";
          return content;
        }},
        { "targets": 5, "render": function(data, type, row) {
          var content = to_date_hm(data.createTime);
          return content;
        }},
        { "orderable": false, "targets": 6, "render": function(data, type, row) {
        	var content = "<div class=\"text-center\">";
          content += "<span class=\"label label-sm label-warning\">有效</span>";
          content += "</div>";
          return content;
        }},
        { "orderable": false, "targets": 7, "render": function(data, type, row) {
          var content = "<div class=\"text-center\">";
          content += "<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">";
          content += "  <a class=\"blue\" href=\"#\" title=\"详情\"><i class=\"icon-zoom-in bigger-130\"></i></a>";
          content += "  <a class=\"green\" href=\"#\" title=\"编辑\"><i class=\"icon-pencil bigger-130\"></i></a>";
          content += "  <a class=\"red\" href=\"#\" title=\"删除\"><i class=\"icon-trash bigger-130\"></i></a>";
          content += "</div>";
          content += "<div class=\"visible-xs visible-sm hidden-md hidden-lg\">";
          content += "  <div class=\"inline position-relative\">";
          content += "    <button class=\"btn btn-minier btn-yellow dropdown-toggle\" data-toggle=\"dropdown\">";
          content += "      <i class=\"icon-caret-down icon-only bigger-120\"></i>";
          content += "    </button>";
          content += "    <ul class=\"dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close\">";
          content += "      <li>";
          content += "        <a href=\"#\" class=\"tooltip-info\" data-rel=\"tooltip\" title=\"View\">";
          content += "          <span class=\"blue\"><i class=\"icon-zoom-in bigger-120\"></i></span>";
          content += "        </a>";
          content += "      </li>";
          content += "      <li>";
          content += "        <a href=\"#\" class=\"tooltip-success\" data-rel=\"tooltip\" title=\"Edit\">";
          content += "          <span class=\"green\"><i class=\"icon-edit bigger-120\"></i></span>";
          content += "        </a>";
          content += "      </li>";
          content += "      <li>";
          content += "        <a href=\"#\" class=\"tooltip-error\" data-rel=\"tooltip\" title=\"Delete\">";
          content += "          <span class=\"red\"><i class=\"icon-trash bigger-120\"></i></span>";
          content += "        </a>";
          content += "      </li>";
          content += "    </ul>";
          content += "  </div>";
          content += "</div>";
          content += "</div>";
          return content;
        }}
			],
			"columns": [
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null }
      ]
		});
		queryBuildingName("buildingName", "buildingUnit", "districtsValue", "townsValue");
		
		$(".date-picker").datepicker({autoclose:true}).next().on(ace.click_event, function(){
      $(this).prev().focus();
    });
		
		$("#btnSearch").click(function() {
			d = dialog({
	      title: '楼盘载入中...'
	    });
	    d.showModal();
	    var search = "?random=" + Math.random();
	    var townsValue = $("#townsValue").val();
      if (townsValue && townsValue != "0") {
        search += "&townId=" + townsValue;
      } else {
        var districtsValue = $("#districtsValue").val();
        if (districtsValue && districtsValue != "0") {
          search += "&districtId=" + districtsValue;
        }
      }
      var dateBeginValue = $("#dateBegin").val();
      if (dateBeginValue) {
        search += "&releaseDateBegin=" + dateBeginValue;
      }
      var dateEndValue = $("#dateEnd").val();
      if (dateEndValue) {
        search += "&releaseDateEnd=" + dateEndValue;
      }
	    table.ajax.url("${ctx}/home/building/query" + search).load();
	    d.close();
		});
		
		$("#btnSave").click(function() {
			var townId = $("#townsAddValue").val();
			var buildingName = $("#buildingNameAdd").val();
			var buildingAddress = $("#buildingAddressAdd").val();
			var buildingYear = $("#buildingYearAdd").val();
			var type = $("#typeAdd").val();
			var remarks = $("#editor1").html();
			console.log(remarks);
	    var url = "${ctx}/home/building/save?random="+ Math.random();
      var params = {
    		  townId: townId,
    		  buildingName: buildingName,
    		  buildingAddress: buildingAddress,
    		  buildingYear: buildingYear,
    		  type: type
      };
      $.post(url, params, function(result) {
    	  dialog({
	       title: '消息',
	       content: result.message,
	       okValue: '确定',
	       ok: true
	     }).showModal();
      }, "json");
		});
		
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
	function queryRegions(regionId, name, _this, fieldIds) {
		addActivedName(fieldIds[0], regionId, name, _this);
    var $towns = $("#" + fieldIds[1]);
    var $townsPane = $("#" + fieldIds[2]);
    $towns.children().remove();
    if (regionId != "0") {
      var url = "${ctx}/home/region/list?random="+ Math.random();
      var params = {
        parentId: regionId
      };
      var $htmlLi = $("<li><button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"addActivedName('" + fieldIds[1] + "', '0', '', this);\">不限</button></li>");
      $towns.append($htmlLi).append("\n");
      
      $.post(url, params, function(result) {
        if ("500" != result.code) {
          for (var i=0; i<result.data.length; i++) {
            $htmlLi = $("<li><button type=\"button\" class=\"btn btn-link btn-xs\" onclick=\"addActivedName('" + fieldIds[1] + "', '" + result.data[i].id + "', '" + result.data[i].name + "', this);\">" + result.data[i].name + "</button></li>");
            $towns.append($htmlLi).append("\n");
          }
          $townsPane.show();
        }
      }, "json");
    } else {
    	$townsPane.hide();
    }
  }
	function addActivedName(fieldId, val, name, _this) {
    $("#" + fieldId + " li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
    if (_this) {
      $(_this).removeClass("btn-link").addClass("btn-danger");
    }
    if (name) {
       $("#" + fieldId + "Value").val(val);
    }
	}
	function queryBuildingName(buildingName, buildingUnit, districts, towns) {
		$("#" + buildingName).autocompleter({
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
        var districtId = $("#" + districts).val();
        var townId = $("#" + towns).val();
        if (townId) {
          districtId = "";
        } else {
          townId = "";
        }
        return {
          buildingName: $("#" + buildingName).val(),
          districtId: districtId,
          townId: townId
        };
      }
    });
	}
	function changeBuildingUnit(buildingUnit, house) {
		$("#" + buildingUnit).change(function() {
	    var buildingUnitId = $(this).val();
	    if (buildingUnitId != "0") {
	      var url = "${ctx}/home/house/select?random="+ Math.random();
	      var params = {
	          buildingUnitId: buildingUnitId
	      };
	      $.post(url, params, function(result) {
	        if ("500" != result.code) {
	        	var $house = $("#" + house);
	          $house.children().not(':first').remove();
	          var items = [];
	          for(var i=0; i<result.data.length; i++) {
	        	  items.push(result.data[i].area);
	        	  items.push(result.data[i].room);
	        	  items.push(result.data[i].saloon);
	        	  items.push(result.data[i].toilet);
	            $house.append("<option value=\"" + items.join() + "\">" + result.data[i].card + "</option>");
	            items.length = 0;
	          }
	        }
	      }, "json");
	    }
	  });
	}
	function changeHouse(house) {
		$("#" + house).change(function() {
			var houseId = $(this).val();
			if (houseId != "0") {
				
			}
		});
	}
	</script>
	</jscript>
</body>
</html>