<#assign menu="folder"> 
<#assign submenu="update_folder"> 
<#include "../head.ftl">
<style type="text/css">
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<div class="row">
			<form id="edit_config_form" method="post"
				class="form-horizontal" autocomplete="off"
				action="${BASE_PATH}/manage/config/update.json">
				<div class="col-lg-12">
					<section class="panel">
						<#if config??>
							<#assign desc = config.description>
							<#assign key = config.key>
							<#assign value = config.value>
						<#else>
							<#assign desc = '基础设置'>
							<#assign key = ''>
							<#assign value = ''>
						</#if>
						<header class="panel-heading"> 
						${desc}修改
						</header>
						<div class="panel-body">
							<div class="form-group">
	                          <label class="col-sm-2 col-sm-2 control-label">字段名称</label>
	                          <div class="col-sm-10">
	                               <input type="text" class="form-control" name="key"
                                            placeholder="字段名称" id="key" value="${key}"  readonly>
	                          </div>
	                        </div>
                        	<div class="form-group">
	                          <label class="col-sm-2 col-sm-2 control-label">字段内容</label>
	                          <div class="col-sm-10">
	                          	  <textarea class="form-control" rows="3" name="value" placeholder="字段内容" required>${value}</textarea>
	                              
	                          </div>
	                        </div>
	                        <div class="form-group">
	                      	  <div class="col-lg-offset-2 col-lg-10">
	                         	<button class="btn btn-shadow btn-primary" type="submit">修改</button>
	                          </div>
	                      </div>
						</div>
					</section>
				</div>
			</form>
		</div>

		<!-- page end-->
	</section>
</section>
<!--main content end-->
<script type="text/javascript">
	$(function() {
		$('#edit_config_form').ajaxForm({
			dataType : 'json',		
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
                       window.location.href = "${BASE_PATH}/manage/config/index.htm";
					});
				}else{
					showErrors($('#edit_config_form'),data.errors);
				}
			}
		});			
	});	
</script>
<#include "../foot.ftl">
