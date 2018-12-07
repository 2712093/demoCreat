<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>${shamrock_seo_title} 抽奖</title>
<link rel="shortcut icon" href="${TEMPLATE_BASE_PATH}/images/favicon.ico" type="image/vnd.microsoft.icon">
<!-- Bootstrap core CSS -->
<link href="${TEMPLATE_MANAGE_PATH}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${TEMPLATE_MANAGE_PATH}/css/bootstrap-reset.css"
	rel="stylesheet">
<!--external css-->
<link
	href="${TEMPLATE_MANAGE_PATH}/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="${TEMPLATE_MANAGE_PATH}/css/style.css" rel="stylesheet">
<link href="${TEMPLATE_MANAGE_PATH}/css/style-responsive.css"
	rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
    <script src="${TEMPLATE_MANAGE_PATH}/js/html5shiv.js"></script>
    <script src="${TEMPLATE_MANAGE_PATH}/js/respond.min.js"></script>
    <![endif]-->
<script src="${TEMPLATE_MANAGE_PATH}/js/jquery.js"></script>
<script src="${TEMPLATE_MANAGE_PATH}/js/jquery.form.min.js"></script>

<style type="text/css">
p.error {
	color: #DE5959;
}

.form-signin input[type="text"].error, .form-signin input[type="password"].error
	{
	border-color: #b94a48;
	color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

input.error:focus {
	border-color: #953b39;
	color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px
		#d59392;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
}
</style>
</head>

<body class="login-body">

	<div class="container" style="margin-top:8%">
		<div>f</div>
		<div class="form-signin">
			
			
			
			<div class="login-wrap">
				<div class="form-group">
				<button id="" class="btn btn-default btn-xs" style="float: left;" type="submit">活动规则</button>
				<button id="myDraw" class="btn btn-default btn-xs" style="float: right;" type="submit">我的奖品</button>
				</div>
				<div class="form-group">
		             <button class="btn btn-lg btn-block" type="submit" onclick="">抽奖</button>
		          </div>
 				<div class="form-group">
                                     <button class="btn btn-lg btn-block" type="submit">抽奖</button>
                                  </div>	                                 	
				<div class="form-group">
					<button class="btn btn-lg btn-block" type="submit">抽奖</button>
				</div>
				<div class="clearfix"></div>
				<div>
					<p class="error" for="captcha" style="display: none;"></p>
				</div>
				<img style="width:80%;" src="${TEMPLATE_MANAGE_PATH}/img/adminlogin.png"></img>
			</div>
		</div>
		
	</div>
	<script type="text/javascript">
	    
		
		$(function() {
			$("button").click(function(){
	    	var mobilePhone = "${mobilePhone?if_exists}";
	    	if(mobilePhone!=""){
			   $.ajax({
			        type: "POST",
			        url: "${BASE_PATH}/draw/draw.json",
			        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			        data: {mobilePhone:mobilePhone},
			        dataType: "json",
			        success: function (data) {
			           if (data.result) {
			           		if(data.t != undefined){
			           			if(data.t.prizeNumber>0){
			           				alert("恭喜你抽中"+data.t.prizeNumber+"G流量！");
			           			}else{
			           				alert("没抽中，请再接再厉！");
			           			}
			           		}else{
			           			alert(data.errors.drawMsg);
			           		}
						} else {
							alert(data.errors.drawMsg);
						}
			        },
			        error: function (message) {
			           alert("提交数据失败！");
			        }
			    });
			 }else{
			 	alert("缺少关键信息！");
			 }
		});
		$("#myDraw").click(function(){
	    	var mobilePhone = "${mobilePhone?if_exists}";
	    	if(mobilePhone!=""){
			   $.ajax({
			        type: "POST",
			        url: "${BASE_PATH}/draw/myPrize.json",
			        contentType: "application/x-www-form-urlencoded; charset=utf-8",
			        data: {mobilePhone:mobilePhone},
			        dataType: "json",
			        success: function (data) {
			           if (data.result) {
			           		console.log(data.t);
							alert("成功")
						} else {
							alert(data.errors.drawMsg);
						}
			        },
			        error: function (message) {
			           alert("提交数据失败！");
			        }
			    });
			 }else{
			 	alert("缺少关键信息！");
			 }
		});
		
		});
		
	</script>
</body>
</html>