<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>首页-爱房网</title>
  <link href="${ctx}/css/ui-dialog.css" rel="stylesheet">
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <style>
  #townsPane hr {
    margin-top: 0;
    margin-bottom: 8px;
  }
  .form-row {margin-bottom: 5px;}
  /* .list-inline li button {border: 0;}
  .list-inline li button.btn-danger {border: 0;}
  .list-inline li button.btn-link {border: 0;} */
  
  .widget-none {border: 0;}
  .table-search {margin-bottom: 0;}
  .action-close {color: #e09e96;}
  .action-close:hover {color: #ffd9d5;}
  </style>
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
                        <label class="col-sm-1 control-label">区域：</label>
                        <div class="col-sm-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('0', '', this);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                          <div id="townsPane">
						                <hr>
						                <ul class="list-inline" id="towns">
						                  <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
						                </ul>
						              </div>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-sm-1 control-label" for="buildingName">楼盘：</label>
                        <div class="col-sm-3">
                          <input type="text" class="form-control col-xs-10 col-sm-5" id="buildingName" placeholder="楼盘名称">
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
	             <a href="#" id="btn-add" data-action="settings"><i class="icon-edit"></i></a>
	             <a href="#" data-action="reload"><i class="icon-refresh"></i></a>
	             <a class="action-close" href="#" title="删除"><i class="icon-remove"></i></a>
	            <!-- <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a> -->
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table id="sample-table-2" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th></th>
			                <th class="center"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>楼盘</th>
			                <th>栋座</th>
			                <th class="hidden-480">Clicks</th>
			                <th><i class="icon-time bigger-110 hidden-480"></i>发布时间</th>
			                <th class="hidden-480">状态</th>
			                <th></th>
			              </tr>
			            </thead>
			          </table>
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
  <script src="${ctx}/js/dialog-min.js"></script>
  <script src="${ctx}/js/dialog-util.js"></script>
	<script>
	$(document).ready(function() {
		//http://fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTegdm0LZdjqr5-oayXSOefg.woff2
		$("#townsPane").hide();
		$('#sample-table-2').DataTable({
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
        "url": "${ctx}/home/house/queryData",
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
        { "targets": 5, "render": function(data, type, row) {
          var content = to_date_hms(data.releaseTime);
          return content;
        }},
        { "orderable": false, "targets": 7, "render": function(data, type, row) {
          var content = "<div class=\"text-center\">";
          content += "<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">";
          content += "  <a class=\"blue\" href=\"#\"><i class=\"icon-zoom-in bigger-130\"></i></a>";
          content += "  <a class=\"green\" href=\"#\"><i class=\"icon-pencil bigger-130\"></i></a>";
          content += "  <a class=\"red\" href=\"#\"><i class=\"icon-trash bigger-130\"></i></a>";
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
        { "data": "buildingName" },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null }
      ]
		});
		
		$("#buildingName").autocompleter({
      // marker for autocomplete matches
      highlightMatches: true,
      // object to local or url to remote search
      source: '${ctx}/house/building/search',
      // custom template
      template: '{{ label }} <span>({{ districtName }}-{{ townName }})</span>',
      // show hint
      hint: true,
      // abort source if empty field
      empty: false,
      // max results
      //limit: 1,
      combine: function() {
        var districtId = $("#districtsValue").val();
        var townId = $("#townsValue").val();
        if (townId) {
          districtId = "";
        } else {
          townId = "";
        }
        return {
          buildingName: $("#buildingName").val(),
          districtId: districtId,
          townId: townId
        };
      },
      callback: function (value, index, selected) {
        if (selected) {
          alert(selected.buildingId);
        }
      }
    });
	
		$("#btn-add").click(function() {
      var url = "${ctx}/home/house/used/sale/add?random=" + Math.random();
      var options = {
        title: '新增',
        width: 500
      };
      showDialog(url, options);
    });
	});
	function queryRegions(regionId, name, _this) {
		addActivedName("districts", regionId, name, _this);
    var $towns = $("#towns");
    $("#towns li").remove();
    if (regionId != "0") {
      var url = "${ctx}/home/region/list?random="+ Math.random();
      var params = {
        parentId: regionId
      };
      var $htmlLi = $("<li><button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"addActivedName('towns', '0', '', this);\">不限</button></li>");
      $towns.append($htmlLi).append("\n");
      
      $.post(url, params, function(result) {
        if ("500" != result.code) {
          for (var i=0; i<result.data.length; i++) {
            $htmlLi = $("<li><button type=\"button\" class=\"btn btn-link btn-xs\" onclick=\"addActivedName('towns', '" + result.data[i].id + "', '" + result.data[i].name + "', this);\">" + result.data[i].name + "</button></li>");
            $towns.append($htmlLi).append("\n");
          }
          $("#townsPane").show();
        }
      }, "json");
    } else {
      $("#townsPane").hide();
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
	</script>
	</jscript>
</body>
</html>
