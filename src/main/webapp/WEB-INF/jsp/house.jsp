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
  
  .date-picker {width: 110px;}
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
		                    <label class="col-md-1 control-label no-padding-right">栋座：</label>
		                    <div class="col-md-4">
	                        <select class="input-select" id="buildingUnit">
                            <option value="">选择栋座</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="house">
                            <option value="">选择房号</option>
                          </select>
		                    </div>
		                  </div>
		                  <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">价格：</label>
                        <div class="col-md-4">
                          <input class="input-text" type="text" id="priceBegin">
                          <small>~</small>
                          <input class="input-text" type="text" id="priceEnd"><small>（万）</small>
                        </div>
                        <label class="col-md-1 control-label no-padding-right">面积：</label>
                        <div class="col-md-4">
                          <input class="input-text" type="text" id="areaBegin">
                          <small>~</small>
                          <input class="input-text" type="text" id="areaEnd"><small>（平米）</small>
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
                            <option value="5:gt">5室以上</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="saloon">
                            <option value="0">选择厅</option>
                            <option value="1">1厅</option>
                            <option value="2">2厅</option>
                            <option value="3">3厅</option>
                            <option value="4">4厅</option>
                            <option value="5">5厅</option>
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
                        <label class="col-md-1 control-label no-padding-right">时间：</label>
                        <div class="col-md-5">
                          <span class="input-icon input-icon-right">
                            <input class="date-picker" id="dateBegin" type="text" data-date-format="yyyy-mm-dd" placeholder="开始时间">
                            <i class="icon-calendar"></i>
                          </span>
                          <small>~</small>
                          <span class="input-icon input-icon-right">
                            <input class="date-picker" id="dateEnd" type="text" data-date-format="yyyy-mm-dd" placeholder="结束时间">
                            <i class="icon-calendar"></i>
                          </span>
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
      <input id="houseId" type="hidden">
      
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
		          <h5><i class="icon-table"></i>新房出售</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-add">新增<i class="icon-edit align-top icon-on-right"></i>
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
			                <th></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>楼盘信息</th>
			                <th class="text-right" width="90">户型</th>
			                <th width="110">价格（万）</th>
			                <th width="110">面积（㎡）</th>
			                <th width="130"><i class="icon-time hidden-480"></i>发布时间</th>
			                <th class="text-center hidden-480" width="50">状态</th>
			                <th class="text-center" width="110">操作</th>
			              </tr>
			            </thead>
			          </table>
			        </div>
		        </div>
	        </div>
	        
	        <!-- model-add -->
	        <div id="modal-add" class="modal" tabindex="-1">
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
					                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">请选择</button></li>
					                            <c:forEach var="data" items="${regions}">
					                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">${data.name}</button></li>
					                            </c:forEach> 
					                          </ul>
					                          <div id="townsPaneAdd">
					                            <hr class="hr-line">
					                            <ul class="list-inline" id="townsAdd"></ul>
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
					                          <small>~</small>
					                          <select class="input-select" id="houseAdd">
					                            <option value="">选择房号</option>
					                          </select>
					                        </div>
					                      </div>
					                      <div class="form-group form-row">
                                  <label class="col-md-2 control-label no-padding-right">面积：</label>
                                  <div class="col-md-8">
                                    <input class="input-text" type="text" id="areaAdd" disabled="disabled">
                                    <small>~</small>
                                    <input class="input-text" type="text" id="patternAdd" disabled="disabled">      
                                    <small>~</small>
                                    <input class="input-text" type="text" id="faceAdd" disabled="disabled">
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
                            <label class="col-md-2 control-label no-padding-right">标题：</label>
				                    <div class="col-md-8">
				                      <input class="input-field" type="text" id="titleAdd" placeholder="标题">
				                    </div>
				                  </div>
				                  <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">价格：</label>
                            <div class="col-md-3">
                              <div class="input-group">
                                <input class="input-field" type="text" id="priceAdd" placeholder="价格">
                                <div class="input-group-addon"><small>万</small></div>
                              </div>
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
                  <button class="btn btn-sm btn-primary" id="btnHouseSave"><i class="icon-ok"></i>保存</button>
                </div>
              </div>
            </div>
          </div>
          <!-- model-add -->
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
		//http://fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTegdm0LZdjqr5-oayXSOefg.woff2
		$("#townsPane").hide();
		$("#townsPaneAdd").hide();
		tableHouse = $('#tableHouse').DataTable({
			 "language": {
	       "processing":  "处理中...",
	       "lengthMenu":  "每页 _MENU_ 条记录",
	       "zeroRecords": "没有找到记录",
	       "infoEmpty":   "无记录",
	       'info':        '当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录',
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
        "url": "${ctx}/home/house/queryHomeData",
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
          content += "<h4>" + data.title + "</h4>";
          content += data.buildingName + "<small>（" + data.districtName + "-" + data.townName + "）</small>，";
          content += data.floorName + "，" + data.card + "<br>";
          content += "<span class=\"text-muted hidden-480\"><small>" + data.buildingAddress + "</small></span>";
          return content;
        }},
        { "orderable": false, "targets": 3, "render": function(data, type, row) {
          var content = "<div class=\"text-right\">";
          content += data.room + "室" + data.saloon + "厅" + data.toilet + "卫";
          content += "</div>";
          return content;
        }},
        { "targets": 4, "render": function(data, type, row) {
        	var content = "<div class=\"text-right\">";
          content += jmoney(data.price);
          content += "</div>";
          return content;
        }},
        { "targets": 5, "render": function(data, type, row) {
          var content = "<div class=\"text-right\">";
          content += jmoney(data.area);
          content += "</div>";
          return content;
        }},
        { "targets": 6, "render": function(data, type, row) {
          var content = to_date_hm(data.releaseTime);
          return content;
        }},
        { "orderable": false, "targets": 7, "render": function(data, type, row) {
        	var content = "<div class=\"text-center\">";
          content += "<span class=\"label label-sm label-warning\">有效</span>";
          content += "</div>";
          return content;
        }},
        { "orderable": false, "targets": 8, "render": function(data, type, row) {
          var content = "<div class=\"text-center\">";
          content += "<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">";
          content += "  <a class=\"blue\" href=\"#\" title=\"详情\"><i class=\"icon-zoom-in bigger-130\"></i></a>";
          content += "  <a class=\"green\" href=\"#\" title=\"编辑\"><i class=\"icon-pencil bigger-130\"></i></a>";
          content += "  <a class=\"red\" href=\"#\" onclick=\"houseTrash('" + data.tradeId + "');\"  title=\"删除\"><i class=\"icon-trash bigger-130\"></i></a>";
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
        { "data": null },
        { "data": null }
      ]
		});
		queryBuildingName("buildingName", "buildingUnit", "districtsValue", "townsValue");
		queryBuildingName("buildingNameAdd", "buildingUnitAdd", "districtsAddValue", "townsAddValue");
		changeBuildingUnit("buildingUnit", "house");
		changeBuildingUnit("buildingUnitAdd", "houseAdd");
		
		$(".date-picker").datepicker({autoclose:true}).next().on(ace.click_event, function(){
      $(this).prev().focus();
    });
		
		$("#btnHouseSearch").click(function() {
			d = dialog({
	      title: '房源载入中...'
	    });
	    d.showModal();
	    var search = "?random=" + Math.random();
	    var townsValue = $("#townsValue").val();
      if (townsValue) {
        search += "&townId=" + townsValue;
      } else {
        var districtsValue = $("#districtsValue").val();
        if (districtsValue) {
          search += "&districtId=" + districtsValue;
        }
      }
      var priceBeginValue = $("#priceBegin").val();
      if (priceBeginValue && priceBeginValue != "0") {
        search += "&priceBegin=" + (Number(priceBeginValue)*100);
      }
      var priceEndValue = $("#priceEnd").val();
      if (priceEndValue && priceEndValue != "0") {
        search += "&priceEnd=" + (Number(priceEndValue)*100);
      }
      var areaBeginValue = $("#areaBegin").val();
      if (areaBeginValue && areaBeginValue != "0") {
        search += "&areaBegin=" + (Number(areaBeginValue)*100);
      }
      var areaEndValue = $("#areaEnd").val();
      if (areaEndValue && areaEndValue != "0") {
        search += "&areaEnd=" + (Number(areaEndValue)*100);
      }
      var roomValue = $("#room").val();
      if (roomValue && roomValue != "0") {
        var values = roomValue.split(":");
        if (values.length > 1) {
          search += "&symbol=" + values[1];
        }
        search += "&room=" + values[0];
      }
      var saloonValue = $("#saloon").val();
      if (saloonValue && saloonValue != "0") {
    	  search += "&saloon=" + saloonValue;
      }
      var toiletValue = $("#toilet").val();
      if (toiletValue && toiletValue != "0") {
        search += "&toilet=" + toiletValue;
      }
      
      var dateBeginValue = $("#dateBegin").val();
      if (dateBeginValue) {
        search += "&releaseDateBegin=" + dateBeginValue;
      }
      var dateEndValue = $("#dateEnd").val();
      if (dateEndValue) {
        search += "&releaseDateEnd=" + dateEndValue;
      }
      tableHouse.ajax.url("${ctx}/home/house/queryHomeData" + search).load();
	    d.close();
		});
		
		$('#btnHouseSave').click(function() {
			var houseId = $('#houseId').val();
      var title = $('#titleAdd').val();
      var price = $('#priceAdd').val();
      var url = '${ctx}/home/trade/save?random='+ Math.random();
      var params = {
    		  houseId: houseId,
    		  title: title,
    		  price: price
      };
      $.post(url, params, function(result) {
    	  $('#modal-add').modal('hide');
        dialog({
         title: '消息',
         content: result.message,
         okValue: '确定',
         ok: function () {
        	 tableHouse.ajax.reload();
           return true;
         }
       }).width(100).showModal();
      }, 'json');
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
		
		$('#houseAdd').change(function() {
			var value = $(this).val();
			if(value) {
				var values = value.split(',');
				$('#houseId').val(values[0]);
				$('#areaAdd').val(jmoney(values[1]) + '㎡');
				$('#patternAdd').val(values[2] + '室' + values[3] + '厅' + values[4] + '卫');
				$('#faceAdd').val(values[5]);
			}
		});
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
    if (regionId) {
      var url = "${ctx}/home/region/list?random="+ Math.random();
      var params = {
        parentId: regionId
      };
      var $htmlLi = $("<li><button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"addActivedName('" + fieldIds[1] + "', '', '', this);\">请选择</button></li>");
      $towns.append($htmlLi).append("\n");
      
      $.post(url, params, function(result) {
        if (result.status) {
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
    $("#" + fieldId + "Value").val(val);
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
      },
      callback: function (value, index, selected) {
        if (selected) {
          var buildingId = selected.buildingId;
          if (buildingId) {
            var url = "${ctx}/home/buildingUnit/select?random="+ Math.random();
            var params = {
                buildingId: buildingId
            };
            $.post(url, params, function(result) {
              if (result.status) {
                var $buildingUnit = $("#" + buildingUnit);
                $buildingUnit.children().not(':first').remove();
                for(var i=0; i<result.data.length; i++) {
                  $buildingUnit.append("<option value=\"" + result.data[i].id + "\">" + result.data[i].name + "</option>");
                }
              }
            }, "json");
          }
        }
      }
    });
	}
	function changeBuildingUnit(buildingUnit, house) {
		$("#" + buildingUnit).change(function() {
	    var buildingUnitId = $(this).val();
	    if (buildingUnitId) {
	      var url = "${ctx}/home/house/select?random="+ Math.random();
	      var params = {
	          buildingUnitId: buildingUnitId
	      };
	      $.post(url, params, function(result) {
	        if (result.status) {
	        	var $house = $("#" + house);
	          $house.children().not(':first').remove();
	          var items = [];
	          for(var i=0; i<result.data.length; i++) {
	        	  items.push(result.data[i].houseId);
	        	  items.push(result.data[i].area);
	        	  items.push(result.data[i].room);
	        	  items.push(result.data[i].saloon);
	        	  items.push(result.data[i].toilet);
	        	  items.push(result.data[i].faceName);
	            $house.append("<option value=\"" + items.join() + "\">" + result.data[i].card + "</option>");
	            items.length = 0;
	          }
	        }
	      }, "json");
	    }
	  });
	}
	function houseTrash(tradeId) {
	    dialog({
	      title: '消息',
	      content: '确定要删除吗?',
	      okValue: '确定',
	      ok: function () {
	        var that = this;
	        this.title('删除中…');
	        var url = '${ctx}/home/trade/trash?random='+ Math.random();
	        var params = {
	            id: tradeId
	        };
	        $.post(url, params, function(result) {
	          dialog({
	            title: '消息',
	            content: result.message,
	            okValue: '确定',
	            ok: function () {
	              tableHouse.ajax.reload();
	              return true;
	            }
	          }).width(100).showModal();
	        }, 'json');
	      },
	      cancelValue: '取消',
	      cancel: function () {}
	    }).width(100).showModal();
	  }
	</script>
	</jscript>
</body>
</html>
