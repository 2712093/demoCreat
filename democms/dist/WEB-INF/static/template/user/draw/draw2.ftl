<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes">
<title>Examples</title>
<meta name="description" content="">
<meta name="keywords" content="">
    <link href="${TEMPLATE_DRAW_PATH}/css/reset.css" type="text/css" rel="stylesheet"/>
    <link href="${TEMPLATE_DRAW_PATH}/css/styles.css" type="text/css" rel="stylesheet"/>
    <link href="${TEMPLATE_DRAW_PATH}/css/swiper.min.css" type="text/css" rel="stylesheet"/>
    <script src="${TEMPLATE_DRAW_PATH}/js/rem.js"></script>
    <script src="${TEMPLATE_DRAW_PATH}/js/jquery.js"></script>
    <script src="${TEMPLATE_DRAW_PATH}/js/TimeUtil.js"></script>
    <script src="${TEMPLATE_DRAW_PATH}/js/swiper.min.js"></script>
    
</head>
<body class="MerryBody">
    <div class="btnMerry">
        <span class="left" onclick="actRules()">活动规则</span>
        <span class="right" onclick="actPrize()">我的奖品</span>
    </div>
    <div class="MerryDady">
        <div class="giftMerryDiv">
          <div id="hand"><img src="${TEMPLATE_DRAW_PATH}/images/gift.png"></div>
          <div id="hand3"><img src="${TEMPLATE_DRAW_PATH}/images/gift.png"></div>
          <div id="hand2"><img src="${TEMPLATE_DRAW_PATH}/images/gift.png"></div>
       </div>
    </div>
 <div class="backWhit"></div>
<div class="footerMerry"><img src="${TEMPLATE_DRAW_PATH}/images/footer.jpg"></div>
<!--活动规则 弹窗-->
    <div id="popRules">
    	<div class="popDivRluseImg">
    		<div class="btnClose" onclick="closeXX()"><img src="${TEMPLATE_DRAW_PATH}/images/close.png"></div>
    		<div class="rulesDiv">
    			<h2>活动规则</h2>
    			<div class="rulesFont">
    				<h2>一、活动时间：</h2>
                    <p>2018年12月7日00:09:00-12月25日23:59:59</p>
                    <h2>二、活动对象：</h2>
                    <p>"中国移动10086"微信公众号用户，且已通过北京移动号码登录。</p>
                    <h2>三、参与方式：</h2>
                    <p>关注"中国移动10086"微信公众号并绑定手机号码的北京移动客户，可参加"冰雪狂欢季，圣诞大派送"抽奖活动。每位用户活动期间有1次抽取礼包流量的机会。北京移动用户抽取后流量直接到账。</p>
                    <h2>四、活动奖品：</h2>
                    <table cellpadding="0" cellspacing="0">
                        <thead>
                           <tr>
                            <th>奖品</th>
                            <th>份数</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                            <td>10GB</td>
                            <td>x份</td>
                           </tr>
                            <tr>
                            <td>5GB</td>
                            <td>x份</td>
                           </tr>
                            <tr>
                            <td>3GB</td>
                            <td>x份</td>
                           </tr>
                           <tr>
                            <td>1GB</td>
                            <td>x份</td>
                           </tr>
                        </tbody>
                        
                    </table>
                    <h2>五、赠送规则：</h2>
                    <p>1、中奖流量将于中奖后15日内自动充入用户的【中国移动10086】微信公众号关注绑定手机号账户内，充入日起生效，当月有效，具体到账时间以短信通知为准。</p>
<p>2、获赠流量为全国流量，优先级低于主套餐及可选包等，赠送流量无法共享，不可结转；</p>
<p>3、处于保留期、保号期、挂失、申停、欠停、转品牌过渡期的手机号；物联网卡、4G超级日租卡套餐、神州行开心听、语音套餐卡、神州行B标准资费基本策划等不可领取奖励；</p>
<p>4、赠送流量每月仅可领取100次，超出上限不可领取。</p>
<h2>声明</h2>
<p>您的个人信息我们将依法保护，未经您的授权不会向第三方提供。</p>

    			</div>
    			<div class="rulesFontSpan">
    			<span class="left" onclick="closeXX()">返回</span>
    			<span class="right" onclick="actPrize()">我的奖品</span>
    		    </div>
    		</div>
    	</div>	
    </div>

<!--我的奖品 弹窗-->
    <div id="popPrize">
    	<div class="popDivPrizeImg">
    		<div class="btnClosePrize" onclick="closePrizeXX()"><img src="${TEMPLATE_DRAW_PATH}/images/close.png"></div>
    		<div class="prizeDiv">
    			<div class="prizeFont">
               <!--已中奖 模块-->
    			  <div class="winPrize" style="display: block;">
                   <table cellpadding="0" cellspacing="0">
                       <thead>
                           <tr>
                               <th>序号</th>
                               <th>号码</th>
                               <th>奖品</th>
                               <th>中奖时间</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td>1</td>
                               <td>13817227277</td>
                               <td>10GB</td>
                               <td>10.07</td>
                           </tr>
                            <tr>
                               <td>2</td>
                               <td>13817227277</td>
                               <td>10GB</td>
                               <td>10.07</td>
                           </tr>
                            <tr>
                               <td>3</td>
                               <td>13817227277</td>
                               <td>10GB</td>
                               <td>10.07</td>
                           </tr>
                            <tr>
                               <td>4</td>
                               <td>13817227277</td>
                               <td>10GB</td>
                               <td>10.07</td>
                           </tr>
                       </tbody>
                   </table>         
                  </div>

                  <!--未中奖 模块-->
                  <div class="overPrize" style="display: none;">
                      <span>您还未中奖</span>
                      <span>赶紧去打开礼盒吧</span>
                  </div>
    			</div>
    			<div class="rulesFontSpan">
    			<span class="left">告诉朋友</span>
    			<span class="right"><a href="http://wx.10086.cn/website/score/index/new"  style="color:#000;">查询流量</a></span>
    		    </div>
    		</div>
    	</div>	
    </div>

<!--开箱 弹窗-->
    <div id="popResult">
    	<div class="popDivResImg"><img src="${TEMPLATE_DRAW_PATH}/images/result.png"></div>	
    </div>
	
<!--1GB 弹窗-->
    <div id="pop01">
    	<div class="popDivBgImg"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div>

<!--2GB 弹窗-->
    <div id="pop02">
    	<div class="popDivBgImg02"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div>

<!--3GB 弹窗-->
    <div id="pop03">
    	<div class="popDivBgImg03"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div>

<!--4GB 弹窗-->
    <div id="pop04">
    	<div class="popDivBgImg04"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div>
<!--5GB 弹窗-->
    <div id="pop05">
    	<div class="popDivBgImg05"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div>
<!--8GB 弹窗-->
    <div id="pop08">
    	<div class="popDivBgImg08"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div> 
<!--10GB 弹窗-->
    <div id="pop10">
    	<div class="popDivBgImg10"></div>
    	<span onclick="receiveClick()">收下咯，去查查流量吧</span>
    </div>     
    <a id="alink" href="http://wx.10086.cn/website/score/index/new" style="visibility: hidden;">收下咯，去查查流量吧</a>          
</body>

<script type="text/javascript">
	 var mySwiper = new Swiper('.swiper-container', {
	  autoplay: true,//可选选项，自动滑动
	   loop : true,
	})
	var resDiv = document.getElementById("popResult");
	(function(){ 
		var demo = document.getElementById("hand"); 
		demo.onclick=function(){ 
		  
          //setTimeout("close()", 2000);
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
			           				resDiv.style.display="block";
			           				setTimeout("close("+data.t.prizeNumber+")", 2000);
			           				//alert("恭喜你抽中"+data.t.prizeNumber+"G流量！");
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
		} 
		
	})();

	function close(num){
		   resDiv.style.display="none";
			var handDiv = document.getElementById("pop"+(num<10?"0"+num:num)); 
			handDiv.style.display="block";
	}

	function closeXX(){

		var closeBtnDiv = document.getElementById("popRules");
		closeBtnDiv.style.display="none";
		
	}

	function closePrizeXX(){
		var closeBtnPrize = document.getElementById("popPrize");
		closeBtnPrize.style.display="none";
	}
	function receiveClick(){
		var mobilePhone = "${mobilePhone?if_exists}";
		if(mobilePhone!=""){
		   $.ajax({
		        type: "POST",
		        url: "${BASE_PATH}/draw/receiveLog.json",
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",
		        data: {mobilePhone:mobilePhone},
		        dataType: "json",
		        success: function (data) {
		           if (data.result) {
		           		document.getElementById("alink").click(); 
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
	}
	function actRules(){

		var openBtnDiv = document.getElementById("popRules");
		openBtnDiv.style.display="block";
		
	}

	function actPrize(){
        var openBtnDiv = document.getElementById("popRules");
        openBtnDiv.style.display="none";
		var openBtnPrize = document.getElementById("popPrize");
		openBtnPrize.style.display="block";
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
		           		if(typeof data.t != "undefined" && !$.isEmptyObject(data.t)){
		           			var  html = "奖品名称 , 中奖时间</br>";
		           			$.each(data.t,function(i,n){
		           				html += n.name+" , " + TimeObjectUtil.longMsTimeConvertToDateTime(n.historyTime) + "</br>"
		           			})
		           			$(".prizeFont").html(html);
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
	}

</script>
</html>