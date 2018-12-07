<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes">
<title>Examples</title>
<meta name="description" content="">
<meta name="keywords" content="">
   
</head>
<body class="MerryBody">
</body>
<script type="text/javascript">
 
	var resDiv = document.getElementById("popResult");
	(function(){ 
		var demo = document.getElementById("hand"); 
		demo.onclick=function(){ 
			
		  resDiv.style.display="block";
          setTimeout("close()", 2000);
		} 
	})();

	function close(){
		   resDiv.style.display="none";
			var handDiv = document.getElementById("pop01"); 
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

	function actRules(){

		var openBtnDiv = document.getElementById("popRules");
		openBtnDiv.style.display="block";
		
	}

	function actPrize(){
        var openBtnDiv = document.getElementById("popRules");
        openBtnDiv.style.display="none";
		var openBtnPrize = document.getElementById("popPrize");
		openBtnPrize.style.display="block";
		
	}

</script>
</html>