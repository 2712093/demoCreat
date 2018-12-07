<#assign menu="loginLog_list">
<#assign submenu="loginLog_list">
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
					<header class="panel-heading"> 访问记录 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
                              <thead>
                                  <tr>
                            <th>手机号</th>
                            <th>ip</th>
                            <th>记录类型</th>
                            <th>记录描述</th>
                            <th>记录时间</th>
                          </tr>
                                </thead>
                              <tbody role="alert" aria-live="polite" aria-relevant="all">
                                <#list pageVo.list as e>
                                <tr class="gradeA odd">
                                      <td>${e.mobilePhone}</td>
                                      <td>${e.ip}</td>
                                      <td><#if e.type=='come'>抽奖主页<#elseif e.type=='wx10086'>领取流量<#else>其他</#if></td>
                                      <td>${e.descString}</td>
                                      <td>${e.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
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
	
		
	});	
</script>
<#include "../foot.ftl">