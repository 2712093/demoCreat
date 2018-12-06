<#assign menu="folder">
<#assign submenu="folder_list">
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
					<header class="panel-heading"> 可配置列表 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
									<thead>
										<tr>
											<th width="1%">字段描述</th>
											<th width="1%">字段名称</th>
											<th width="7%">字段内容</th>
											<th width="1%">操作</th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<tr class="gradeA odd">
											<td>${demo_user_drawCount.description}</td>
											<td>${demo_user_drawCount.key}</td>
											<td>${demo_user_drawCount.value}
											</td>
											<td>
												<a href="${BASE_PATH}/manage/config/edit.htm?key=${demo_user_drawCount.key}" title="修改">
													修改
												</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- page end-->
	</section>
</section>
<!--main content end-->
<script type="text/javascript">
$(function() {
   
});
</script>
<#include "../foot.ftl">
