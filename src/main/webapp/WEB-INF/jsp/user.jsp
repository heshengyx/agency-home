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
	      <li><i class="icon-home home-icon"></i><a href="#">用户信息</a></li>
	      <li class="active">个人资料</li>
	    </ul><!-- .breadcrumb -->
	  </div>
	
	  <div class="page-content">
	    <div class="hr dotted"></div>
	    <div class="tabbable">
	      <ul class="nav nav-tabs padding-18" style="height:34px;">
          <li class="active">
            <a data-toggle="tab" href="#home">
              <i class="green icon-user bigger-120"></i>
              Profile
            </a>
          </li>

          <li>
            <a data-toggle="tab" href="#feed">
              <i class="orange icon-rss bigger-120"></i>
              Activity Feed
            </a>
          </li>

          <li>
            <a data-toggle="tab" href="#friends">
              <i class="blue icon-group bigger-120"></i>
              Friends
            </a>
          </li>

          <li>
            <a data-toggle="tab" href="#pictures">
              <i class="pink icon-picture bigger-120"></i>
              Pictures
            </a>
          </li>
        </ul>
        
        <div class="tab-content no-border padding-24">
          <div id="home" class="tab-pane in active">
            <div class="row">
              <div class="col-xs-12 col-sm-3 center">
                <span class="profile-picture">
                  <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="${ctx}/avatars/profile-pic.jpg" />
                </span>

                <div class="space-4"></div>
                
                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                  <div class="inline position-relative">
                    <a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                      <i class="icon-circle light-green middle"></i>
                      &nbsp;
                      <span class="white">Alex M. Doe</span>
                    </a>

                    <ul class="align-left dropdown-menu dropdown-caret dropdown-lighter">
                      <li class="dropdown-header"> Change Status </li>

                      <li>
                        <a href="#">
                          <i class="icon-circle green"></i>
                          &nbsp;
                          <span class="green">Available</span>
                        </a>
                      </li>

                      <li>
                        <a href="#">
                          <i class="icon-circle red"></i>
                          &nbsp;
                          <span class="red">Busy</span>
                        </a>
                      </li>

                      <li>
                        <a href="#">
                          <i class="icon-circle grey"></i>
                          &nbsp;
                          <span class="grey">Invisible</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
                
                <div class="space-6"></div>

                      <div class="profile-contact-info">
                        <div class="profile-contact-links align-left">
                          <a class="btn btn-link" href="#">
                            <i class="icon-plus-sign bigger-120 green"></i>
                            Add as a friend
                          </a>

                          <a class="btn btn-link" href="#">
                            <i class="icon-envelope bigger-120 pink"></i>
                            Send a message
                          </a>

                          <a class="btn btn-link" href="#">
                            <i class="icon-globe bigger-125 blue"></i>
                            www.alexdoe.com
                          </a>
                        </div>

                        <div class="space-6"></div>

                        <div class="profile-social-links center">
                          <a href="#" class="tooltip-info" title="" data-original-title="Visit my Facebook">
                            <i class="middle icon-facebook-sign icon-2x blue"></i>
                          </a>

                          <a href="#" class="tooltip-info" title="" data-original-title="Visit my Twitter">
                            <i class="middle icon-twitter-sign icon-2x light-blue"></i>
                          </a>

                          <a href="#" class="tooltip-error" title="" data-original-title="Visit my Pinterest">
                            <i class="middle icon-pinterest-sign icon-2x red"></i>
                          </a>
                        </div>
                      </div>
              
              </div>
              
              
              <div class="col-xs-12 col-sm-9">
                <div class="center">
                        <span class="btn btn-app btn-sm btn-light no-hover">
                          <span class="line-height-1 bigger-170 blue"> 1,411 </span>

                          <br />
                          <span class="line-height-1 smaller-90"> Views </span>
                        </span>

                        <span class="btn btn-app btn-sm btn-yellow no-hover">
                          <span class="line-height-1 bigger-170"> 32 </span>

                          <br />
                          <span class="line-height-1 smaller-90"> Followers </span>
                        </span>

                        <span class="btn btn-app btn-sm btn-pink no-hover">
                          <span class="line-height-1 bigger-170"> 4 </span>

                          <br />
                          <span class="line-height-1 smaller-90"> Projects </span>
                        </span>

                        <span class="btn btn-app btn-sm btn-grey no-hover">
                          <span class="line-height-1 bigger-170"> 23 </span>

                          <br />
                          <span class="line-height-1 smaller-90"> Reviews </span>
                        </span>

                        <span class="btn btn-app btn-sm btn-success no-hover">
                          <span class="line-height-1 bigger-170"> 7 </span>

                          <br />
                          <span class="line-height-1 smaller-90"> Albums </span>
                        </span>

                        <span class="btn btn-app btn-sm btn-primary no-hover">
                          <span class="line-height-1 bigger-170"> 55 </span>

                          <br />
                          <span class="line-height-1 smaller-90"> Contacts </span>
                        </span>
                      </div>
                      
                <div class="space-12"></div>

                      <div class="profile-user-info profile-user-info-striped">
                        <div class="profile-info-row">
                          <div class="profile-info-name"> Username </div>

                          <div class="profile-info-value">
                            <span class="editable" id="username">alexdoe</span>
                          </div>
                        </div>

                        <div class="profile-info-row">
                          <div class="profile-info-name"> Location </div>

                          <div class="profile-info-value">
                            <i class="icon-map-marker light-orange bigger-110"></i>
                            <span class="editable" id="country">Netherlands</span>
                            <span class="editable" id="city">Amsterdam</span>
                          </div>
                        </div>

                        <div class="profile-info-row">
                          <div class="profile-info-name"> Age </div>

                          <div class="profile-info-value">
                            <span class="editable" id="age">38</span>
                          </div>
                        </div>

                        <div class="profile-info-row">
                          <div class="profile-info-name"> Joined </div>

                          <div class="profile-info-value">
                            <span class="editable" id="signup">20/06/2010</span>
                          </div>
                        </div>

                        <div class="profile-info-row">
                          <div class="profile-info-name"> Last Online </div>

                          <div class="profile-info-value">
                            <span class="editable" id="login">3 hours ago</span>
                          </div>
                        </div>

                        <div class="profile-info-row">
                          <div class="profile-info-name"> About Me </div>

                          <div class="profile-info-value">
                            <span class="editable" id="about">Editable as WYSIWYG</span>
                          </div>
                        </div>
                      </div>
                
                
                <div class="space-12"></div>
                <div class="widget-box transparent">
                                <div class="widget-header widget-header-small">
                                  <h4 class="smaller">
                                    <i class="icon-check bigger-110"></i>
                                    Little About Me
                                  </h4>
                                </div>

                                <div class="widget-body">
                                  <div class="widget-main">
                                    <p>
                                      My job is mostly lorem ipsuming and dolor sit ameting as long as consectetur adipiscing elit.
                                    </p>
                                    <p>
                                      Sometimes quisque commodo massa gets in the way and sed ipsum porttitor facilisis.
                                    </p>
                                    <p>
                                      The best thing about my job is that vestibulum id ligula porta felis euismod and nullam quis risus eget urna mollis ornare.
                                    </p>
                                    <p>
                                      Thanks for visiting my profile.
                                    </p>
                                  </div>
                                </div>
                              </div>
                              
                <div class="space-12"></div>
                <div class="widget-box transparent">
                                <div class="widget-header widget-header-small header-color-blue2">
                                  <h4 class="smaller">
                                    <i class="icon-lightbulb bigger-120"></i>
                                    My Skills
                                  </h4>
                                </div>

                                <div class="widget-body">
                                  <div class="widget-main padding-16">
                                    <div class="clearfix">
                                      <div class="grid3 center">
                                        <div class="easy-pie-chart percentage" data-percent="45" data-color="#CA5952">
                                          <span class="percent">45</span>%
                                        </div>

                                        <div class="space-2"></div>
                                        Graphic Design
                                      </div>

                                      <div class="grid3 center">
                                        <div class="center easy-pie-chart percentage" data-percent="90" data-color="#59A84B">
                                          <span class="percent">90</span>%
                                        </div>

                                        <div class="space-2"></div>
                                        HTML5 & CSS3
                                      </div>

                                      <div class="grid3 center">
                                        <div class="center easy-pie-chart percentage" data-percent="80" data-color="#9585BF">
                                          <span class="percent">80</span>%
                                        </div>

                                        <div class="space-2"></div>
                                        Javascript/jQuery
                                      </div>
                                    </div>

                                    <div class="hr hr-16"></div>

                                    <div class="profile-skills">
                                      <div class="progress">
                                        <div class="progress-bar" style="width:80%">
                                          <span class="pull-left">HTML5 & CSS3</span>
                                          <span class="pull-right">80%</span>
                                        </div>
                                      </div>

                                      <div class="progress">
                                        <div class="progress-bar progress-bar-success" style="width:72%">
                                          <span class="pull-left">Javascript & jQuery</span>

                                          <span class="pull-right">72%</span>
                                        </div>
                                      </div>

                                      <div class="progress">
                                        <div class="progress-bar progress-bar-purple" style="width:70%">
                                          <span class="pull-left">PHP & MySQL</span>

                                          <span class="pull-right">70%</span>
                                        </div>
                                      </div>

                                      <div class="progress">
                                        <div class="progress-bar progress-bar-warning" style="width:50%">
                                          <span class="pull-left">Wordpress</span>

                                          <span class="pull-right">50%</span>
                                        </div>
                                      </div>

                                      <div class="progress">
                                        <div class="progress-bar progress-bar-danger" style="width:35%">
                                          <span class="pull-left">Photoshop</span>

                                          <span class="pull-right">35%</span>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
              </div>
            </div>
          </div>
          
          <div id="feed" class="tab-pane">
            <div class="profile-feed row-fluid">
              <div class="span6">
                <div class="profile-activity clearfix">
                                <div>
                                  <img class="pull-left" alt="Alex Doe's avatar" src="assets/avatars/avatar5.png" />
                                  <a class="user" href="#"> Alex Doe </a>
                                  changed his profile photo.
                                  <a href="#">Take a look</a>

                                  <div class="time">
                                    <i class="icon-time bigger-110"></i>
                                    an hour ago
                                  </div>
                                </div>

                                <div class="tools action-buttons">
                                  <a href="#" class="blue">
                                    <i class="icon-pencil bigger-125"></i>
                                  </a>

                                  <a href="#" class="red">
                                    <i class="icon-remove bigger-125"></i>
                                  </a>
                                </div>
                              </div>
              </div>
            </div>
          </div>
          
        </div>
	    </div>
	  </div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jscript>
	<script>
	$(document).ready(function() {
		
	});
	</script>
	</jscript>
</body>
</html>
