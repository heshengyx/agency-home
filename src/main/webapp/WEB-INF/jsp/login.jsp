<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
    <!-- Theme style -->
    <link href="${ctx}/css/style.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/plugins/validator/bootstrapValidator.min.css" rel="stylesheet">
    <!-- iCheck -->
    <%-- <link href="${ctx}/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" /> --%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo"><b>管理</b>系统</div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">系统后台登录</p>
        <div id="message" class="btn-danger"></div>
        <form action="${ctx}/login/refer" method="post" id="dataForm">
          <input type="hidden" name="rememberMe" value="true" />
          <div class="form-group has-feedback">
            <input type="text" name="username" class="form-control" placeholder="账号" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="password" class="form-control" placeholder="密码" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row form-group">
            <div class="col-xs-6">
              <input type="text" name="captcha" class="form-control" placeholder="验证码" />
            </div><!-- /.col -->
            <div class="col-xs-6 text-right">
              <img src="${ctx}/images/kaptcha.jpg" style="height:34px;"/>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-4 col-xs-offset-8">
              <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
            </div><!-- /.col -->
          </div>
        </form>
        
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="${ctx}/js/jquery-2.1.4.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${ctx}/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <%-- <script src="${ctx}/plugins/iCheck/icheck.min.js" type="text/javascript"></script> --%>
    <script src="${ctx}/plugins/validator/bootstrapValidator.min.js" type="text/javascript"></script>
    <script>
    $(function () {
        /* $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        }); */
    	$('#dataForm').bootstrapValidator({
  			submitHandler: function(validator, form, submitButton) {
  				//validator.defaultSubmit();
  				$.post(form.attr('action'), form.serialize(), function(result) {
  					if (result.code == '500') {
  						$('#message').text(result.message);
  						validator.disableSubmitButtons(false);
  					} else {
  						window.location.href = '${ctx}/manage';
  					}
  			    }, 'json');
              },
  			fields: {
  				username: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
  			}
        });
    });
    </script>
  </body>
</html>

