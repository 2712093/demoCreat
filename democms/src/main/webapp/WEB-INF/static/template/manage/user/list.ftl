<#assign menu="user_list">
<#assign submenu="user_list">
<#include "../head.ftl">		
<style type="text/css">
.pagination {
	border-radius: 4px;
	display: inline-block;
	margin: 0;
	padding-left: 0;
}
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<div class="row">
			<div class="col-lg-12">
				<!--breadcrumbs start -->
			
				<!--breadcrumbs end -->
			</div>
		</div>
		<div class="row">
			
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> 用户列表 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
                              <thead>
                                  <tr>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>创建时间</th>
                            <th>操作</th>
                          </tr>
                                </thead>
                              <tbody role="alert" aria-live="polite" aria-relevant="all">
                                <#list pageVo.list as e>
                                <tr class="gradeA odd">
                                      <td>${e.name?if_exists}</td>
									<td>${e.mobilePhone?if_exists}</td>
                                      <td>${e.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                      <td>
		                                <!-- Icons -->
		                               <a href="${BASE_PATH}/manage/prizeHistory/list.htm?userId=${e.userId}" title="中奖历史">中奖历史</a>
                            		</td>
                                  </tr>
                                  </#list>
                                </tbody>
                              </table>
                              <div style="height: 30px;">
                              <div class="pagination">${pageVo.pageNumHtml}</div>
                              </div>
                           </div>
						</div>
					</div>
				</section>
			</div>
			<!-- page end-->
	</section>
</section>
<script type="text/javascript">
	$(function() {
		$('#add_admin_form').ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					showErrors($('#add_admin_form'),data.errors);
				}
			}
		});
		
		$('.js_delete_admin').click(function() {
		var adminId= $(this).attr('adminId');
        bootbox.dialog({
            message: "是否" + $(this).attr('title') + "管理员",
            title: "提示",
            buttons: {
                "delete": {
                    label: "删除",
                    className: "btn-success",
                    callback: function() {
                        $.post("${BASE_PATH}/manage/admin/delete.json", {
                            "adminId": adminId
                        },
                        function(data) {
                            if (data.result) {
                                bootbox.alert("删除成功",
                                function() {
                                   window.location.reload();
                                });
                            } else {
                                bootbox.alert(data.msg,
                                function() {});
                            }
                        },
                        "json");
                    }
                },
                "cancel": {
                    label: "取消",
                    className: "btn-primary",
                    callback: function() {}
                }
            }
        });
    });
	});	
</script>
<#include "../foot.ftl">