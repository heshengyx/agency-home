<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户注册-爱房网</title>
    <!-- basic styles -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">

    <!--[if IE 7]>
      <link rel="stylesheet" href="${ctx}/css/font-awesome-ie7.min.css">
    <![endif]-->

    <!-- fonts -->
    <!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" rel="stylesheet"> -->
  
    <!-- ace styles -->
    <link href="${ctx}/css/ace.min.css" rel="stylesheet">
    <link href="${ctx}/css/ace-rtl.min.css" rel="stylesheet">
    <link href="${ctx}/css/ace-skins.min.css" rel="stylesheet">
  
    <!--[if lte IE 8]>
      <link href="${ctx}/css/ace-ie.min.css" rel="stylesheet">
    <![endif]-->
    
    <!-- page specific plugin styles -->
    <link href="${ctx}/css/ui-dialog.css" rel="stylesheet">
    <link href="${ctx}/css/bootstrapValidator.min.css" rel="stylesheet">
    
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <script src="${ctx}/js/ace-extra.min.js"></script>
  
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${ctx}/js/html5shiv.js"></script>
    <script src="${ctx}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body class="login-layout">
    <div class="main-container">
      <div class="main-content">
        <div class="row">
          <div class="col-sm-10 col-sm-offset-1">
            <div class="login-container">
              <div class="center">
                <br><br>
                <h1>
                  <i class="icon-home green"></i>
                  <span class="red">爱房网</span>
                  <span class="white">经纪人平台</span>
                </h1>
                <!-- <h4 class="blue">&copy; Company Name</h4> -->
              </div>
              <div class="space-6"></div>

              <div class="position-relative">
                <div id="signup-box" class="signup-box visible widget-box no-border">
                  <div class="widget-body">
                    <div class="widget-main">
                      <h4 class="header green lighter bigger">
                        <i class="icon-group blue"></i>用户注册
                      </h4>

                      <div class="space-6"></div>
                      <p> 请填写以下信息: </p>

                      <form id="dataForm" action="${ctx}/home/signup" method="post">
                        <fieldset>
                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="email" class="form-control" name="email" placeholder="邮箱" />
                              <i class="icon-envelope"></i>
                              <span id="emailMessage"></span>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="text" class="form-control" name="account" id="account" placeholder="账号" />
                              <i class="icon-user"></i>
                              <span id="accountMessage"></span>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="password" class="form-control" name="password" placeholder="密码" />
                              <i class="icon-lock"></i>
                              <span id="passwordMessage"></span>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="password" class="form-control" name="pwdConfirm" placeholder="确认密码" />
                              <i class="icon-retweet"></i>
                              <span id="pwdConfirmMessage"></span>
                            </span>
                          </label>

                          <label class="block">
                            <input type="checkbox" class="ace" />
                            <span class="lbl">我接受注册<a href="#">条款</a></span>
                          </label>

                          <div class="space-24"></div>

                          <div class="clearfix">
                            <button type="reset" class="width-30 pull-left btn btn-sm">
                              <i class="icon-refresh"></i>重置
                            </button>

                            <button type="submit" class="width-65 pull-right btn btn-sm btn-success">提交
                              <i class="icon-arrow-right icon-on-right"></i>
                            </button>
                          </div>
                        </fieldset>
                      </form>
                    </div>

                    <div class="toolbar center">
                      <a href="${ctx}/login.jsp"  class="back-to-login-link">
                        <i class="icon-arrow-left"></i>返回登录
                      </a>
                    </div>
                  </div><!-- /widget-body -->
                </div><!-- /signup-box -->
              </div><!-- /position-relative -->
            </div>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div>
    </div><!-- /.main-container -->
    
    <!--[if !IE]> -->
    <script type="text/javascript">
      window.jQuery || document.write("<script src='${ctx}/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">
     window.jQuery || document.write("<script src='${ctx}/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
      if("ontouchend" in document) document.write("<script src='${ctx}/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/typeahead-bs2.min.js"></script>
    <!-- ace scripts -->
    <script src="${ctx}/js/ace-elements.min.js"></script>
    <script src="${ctx}/js/ace.min.js"></script>
    <script src="${ctx}/js/bootstrapValidator.min.js"></script>
    <script src="${ctx}/js/dialog-min.js"></script>
    <script src="${ctx}/js/dialog-util.js"></script>
    <script>
    $(document).ready(function() {
			$('#dataForm').bootstrapValidator({
			  submitHandler: function(validator, form, submitButton) {
			    $.post(form.attr('action'), form.serialize(), function(result) {
			      if (result.status) {
			    	  dialog({
	              title: '消息',
	              content: '恭喜！账号：' + $('#account').val() + '注册成功。',
	              okValue: '确定',
	              ok: function () {
	                var that = this;
	                that.close().remove();
                  location.href = "${ctx}/login.jsp";
	              }
	            }).width(150).showModal();
			      } else {
			    	  //$('#message').text(result.message);
		          validator.disableSubmitButtons(false);
			      }
			    }, 'json');
			  },
			  fields: {
				  email: {
            container: '#emailMessage',
            validators: {
              notEmpty: {
                message: '邮箱不能为空'
              },
              emailAddress: {
            	  message: '邮箱格式不正确'
              }
            }
          },
			    account: {
			    	container: '#accountMessage',
            validators: {
              notEmpty: {
            	  message: '账号不能为空'
              },
              stringLength: {
            	  min: 6,
            	  max: 20,
            	  message: '账号必须在6个字符至20个字符之间'
              },
              different: {
                field: 'password',
                message: '账号不能与密码相同'
              },
              regexp: {
            	  regexp: '[a-zA-Z0-9_\.]+',
            		message: '账号只能包含字母，数字，点和下划线'
              },
              remote: {
            	  url: '${ctx}/home/check',
            	  message: '此账号已存在'
              }
            }
          },
          password: {
        	  container: '#passwordMessage',
            validators: {
              notEmpty: {
            	  message: '密码不能为空'
              },
              stringLength: {
                min: 6,
                max: 20,
                message: '密码必须在6个字符至20个字符之间'
              },
              different: {
            	  field: 'account',
            	  message: '密码不能与账号相同'
              }
            }
          },
          pwdConfirm: {
            container: '#pwdConfirmMessage',
            validators: {
              notEmpty: {
                message: '确认密码不能为空'
              },
              identical: {
            	  field: 'password',
            	  message: '两次密码输入不一致'
              }
            }
          }
			  }
		  });
    });
    </script>
  </body>
</html>

