<#assign menu="statistics_list">
<#assign submenu="statistics_list">
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
						 <form id="select_ph_form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/prizeHistory/statistics.htm">
							<fieldset>
								<div class="form-group">
                                      <label class="col-sm-2 control-label">开始日期</label>
                                      <div class="col-sm-3 input-append date form_datetime" >
                                      	<input type="text" name="startTime" class="form-control" value="${startTime?if_exists}" readonly>
                                      	<span class="add-on"><i class="icon-th"></i></span>
                                      </div>
                                 
                                      <label class="col-sm-2 control-label">结束日期</label>
                                      <div class="col-sm-3 input-append date form_datetime">
                                          <input type="text" name="endTime" class="form-control"  value="${endTime?if_exists}" readonly>
                                      	<span class="add-on"><i class="icon-th"></i></span>
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
					<header class="panel-heading"> 抽奖统计 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
                              <thead>
                                  <tr>
                            <th>奖品名称</th>
                            <th>奖品描述</th>
                            <th>中奖概率</th>
                            <th>奖品奖值</th>
                            <th>奖品类型</th>
                            <th>中奖次数</th>
                          </tr>
                                </thead>
                              <tbody role="alert" aria-live="polite" aria-relevant="all">
                              	<#assign x = 0> <#-- 创建变量 x -->
                                <#list pageVo as e>
                                	<tr class="gradeA odd">
                                      <td>${e.name?if_exists}</td>
                                      <td>${e.info?if_exists}</td>
                                      <td>${e.probability}</td>
                                      <td>${e.prizeNumber}</td>
                                      <td>${e.type?if_exists}</td>
                                      <td>${e.count}</td>
                                  	</tr>
                                  <#assign x = x + e.count> <#-- 替换变量 x -->
                                  </#list>
                                  <tr class="gradeA odd">
                                      <td colspan='5' align="right">总数</td>
                                      <td>${x}</td>
                                  </tr>
                                </tbody>
                              </table>
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
    $(".form_datetime").datetimepicker({
      format: "yyyy-mm-dd",
      autoclose: true,
      todayBtn: true,
      minView:3,
      language:'zh-CN',
      pickerPosition:"bottom-left"
    });
	});	
</script>
<#include "../foot.ftl">