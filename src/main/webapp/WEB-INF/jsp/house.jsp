<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>首页-爱房网</title>
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
	    <div class="page-header">
	      <h1>
	        Tables
	        <small>
	          <i class="icon-double-angle-right"></i>
	          Static &amp; Dynamic Tables
	        </small>
	      </h1>
	    </div><!-- /.page-header -->
	    <div class="row">
	      <div class="col-xs-12">
	        <!-- PAGE CONTENT BEGINS -->
	        <!-- <div class="table-header">
	          <button class="btn btn-xs btn-success">
	          <i class="icon-edit"></i>
	          <span class="bigger-110 no-text-shadow">新增</span>
	          </button>
	        </div> -->
	        <div class="widget-header header-color-blue">
	         <h5 class="bigger lighter">
             <i class="icon-table"></i>
             Tables &amp; Colors
           </h5>
	        </div>
	
	        <div class="table-responsive">
	          <table id="sample-table-2" class="table table-striped table-bordered table-hover" width="100%">
	            <thead>
	              <tr>
	                <th></th>
	                <th class="center">
	                  <label>
	                    <input type="checkbox" class="ace" />
	                    <span class="lbl"></span>
	                  </label>
	                </th>
	                <th>楼盘</th>
	                <th>栋座</th>
	                <th class="hidden-480">Clicks</th>
	                <th><i class="icon-time bigger-110 hidden-480"></i>创建时间</th>
	                <th class="hidden-480">状态</th>
	                <th></th>
	              </tr>
	            </thead>
	
	            <tbody>
	              <tr>
	                <td></td>
	                <td class="center">
	                  <label>
	                    <input type="checkbox" class="ace" />
	                    <span class="lbl"></span>
	                  </label>
	                </td>
	                <td><a href="#">app.com</a></td>
	                <td>$45</td>
	                <td class="hidden-480">3,330</td>
	                <td>Feb 12</td>
	                <td class="hidden-480"><span class="label label-sm label-warning">Expiring</span></td>
	                <td>
	                  <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
	                    <a class="blue" href="#"><i class="icon-zoom-in bigger-130"></i></a>
	                    <a class="green" href="#"><i class="icon-pencil bigger-130"></i></a>
	                    <a class="red" href="#"><i class="icon-trash bigger-130"></i></a>
	                  </div>
	
	                  <div class="visible-xs visible-sm hidden-md hidden-lg">
	                    <div class="inline position-relative">
	                      <button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
	                        <i class="icon-caret-down icon-only bigger-120"></i>
	                      </button>
	
	                      <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
	                        <li>
	                          <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
	                            <span class="blue"><i class="icon-zoom-in bigger-120"></i></span>
	                          </a>
	                        </li>
	                        <li>
	                          <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
	                            <span class="green"><i class="icon-edit bigger-120"></i></span>
	                          </a>
	                        </li>
	                        <li>
	                          <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
	                            <span class="red"><i class="icon-trash bigger-120"></i></span>
	                          </a>
	                        </li>
	                      </ul>
	                    </div>
	                  </div>
	                </td>
	              </tr>
	              <tr>
                  <td></td>
                  <td class="center">
                    <label>
                      <input type="checkbox" class="ace" />
                      <span class="lbl"></span>
                    </label>
                  </td>
                  <td><a href="#">app.com</a></td>
                  <td>$45</td>
                  <td class="hidden-480">3,330</td>
                  <td>Feb 12</td>
                  <td class="hidden-480"><span class="label label-sm label-warning">Expiring</span></td>
                  <td>
                    <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                      <a class="blue" href="#"><i class="icon-zoom-in bigger-130"></i></a>
                      <a class="green" href="#"><i class="icon-pencil bigger-130"></i></a>
                      <a class="red" href="#"><i class="icon-trash bigger-130"></i></a>
                    </div>
  
                    <div class="visible-xs visible-sm hidden-md hidden-lg">
                      <div class="inline position-relative">
                        <button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
                          <i class="icon-caret-down icon-only bigger-120"></i>
                        </button>
  
                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                          <li>
                            <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
                              <span class="blue"><i class="icon-zoom-in bigger-120"></i></span>
                            </a>
                          </li>
                          <li>
                            <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
                              <span class="green"><i class="icon-edit bigger-120"></i></span>
                            </a>
                          </li>
                          <li>
                            <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
                              <span class="red"><i class="icon-trash bigger-120"></i></span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </td>
                </tr>
	            </tbody>
	          </table>
	        </div>
	        
	        <!-- PAGE CONTENT ENDS -->
	      </div><!-- /.col -->
	    </div><!-- /.row -->
	  </div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jscript>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script src="${ctx}/js/dataTables.bootstrap.js"></script>
	<script>
	$(document).ready(function() {
		//http://fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTegdm0LZdjqr5-oayXSOefg.woff2
		
		$('#sample-table-2').DataTable({
			"dom": "<'row'<'col-xs-12'>>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
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
        { "orderable": false, "targets": 7}
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
	});
	</script>
	</jscript>
</body>
</html>
