<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>微信分享页面</title>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="${TEMPLATE_DRAW_PATH}/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
		url:  "${BASE_PATH}/wx/getJsApiTicket.json",
		async: true,
		type: "GET",
		dataType: "json",
		async: true,
		data: {
			"link": location.href
		},
		success: function(data) {
			wx.config({
				debug: false,
				appId: data.info.appid,
				timestamp: data.info.timestamp,
				nonceStr: data.info.nonceStr,
				signature: data.info.signature,
				jsApiList: ['onMenuShareAppMessage', 'onMenuShareTimeline', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone']
			});
 
			//--
			wx.ready(function() {
				wx.checkJsApi({
					jsApiList: [
						'onMenuShareAppMessage', 'onMenuShareTimeline', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone'
					],
					success: function(res) {
						
					}
				});
				//分享到朋友圈
				wx.onMenuShareTimeline({ 
					title: data.info.title,
					desc: data.info.title,
					link: location.href,
					imgUrl: data.info.imgUrl,
					success: function() {
						//alert("分享成功！")
						// 用户确认分享后执行的回调函数
					},
					cancel: function() {
						//alert("取消分享！")
						// 用户取消分享后执行的回调函数
					}
				});
				//分享朋友
				wx.onMenuShareAppMessage({
					title: data.info.title,
					desc: data.info.title,
					link: location.href,
					imgUrl:  data.info.imgUrl
				});
				//分享到QQ
				wx.onMenuShareQQ({ 
					title: data.info.title,
					desc: data.info.title,
					link: location.href,
					imgUrl: data.info.imgUrl
				});
			});
			///---
 
		},
		error: function() {
			console.log("二次分享错误！");
		}
	});

	});
</script>
</head>
<body>
		暂时没有内容
</body>
</html>