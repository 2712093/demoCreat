<#assign menu="prizeHistory_list">
<#assign submenu="prizeHistory_list">
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
					<div class="panel-body">
						 <form id="select_ph_form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/prizeHistory/list.htm">
							<fieldset>
								<div class="form-group">
                                      <label class="col-sm-1 col-sm-1 control-label">用户名</label>
                                      <div class="col-sm-3">
                                          <input type="text" class="form-control" name="userName"
                                            placeholder="用户名" id="userName"  value="<#if user??>${user.name}<#else>${userName?if_exists}</#if>">
                                      </div>
                                 
                                      <label class="col-sm-1 col-sm-1 control-label">奖品名</label>
                                      <div class="col-sm-3">
                                          <input type="prizeName" class="form-control" name="prizeName"
                                            placeholder="奖品名" id="prizeName" value="${prizeName?if_exists}">
                                      </div>
                                  
                                    <div class="col-sm-2">
                                      <button class="btn btn-danger" type="submit">查询</button>
                                    </div>
                                  </div>		
							</fieldset>
						</form>
						</div>
				</section>
			</div>
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> 中奖历史 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
                              <thead>
                                  <tr>
                            <th>用户名</th>
                            <th>奖品名称</th>
                            <th>奖品类型</th>
                            <th>奖品奖值</th>
                            <th>中奖时间</th>
                          </tr>
                                </thead>
                              <tbody role="alert" aria-live="polite" aria-relevant="all">
                                <#list pageVo.list as e>
                                <tr class="gradeA odd">
                                      <td>${e.userName}</td>
                                      <td>${e.name}</td>
                                      <td>${e.type}</td>
                                      <td>${e.prizeNumber}</td>
                                      <td>${e.historyTime?string("yyyy-MM-dd HH:mm:ss")}</td>
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