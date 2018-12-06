<#assign menu="prize_list">
<#assign submenu="prize_list">
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
			<div class="col-lg-4">
				<section class="panel">
					<header class="panel-heading"> 添加奖品 </header>
					<div class="panel-body">
						 <form id="add_prize_form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/prize/addPrize.json">
							<fieldset>
                                 <div class="form-group">
                                      <label class="col-sm-3 col-sm-3 control-label">名称</label>
                                      <div class="col-sm-9">
                                          <input type="text" class="form-control" name="name"
                                            placeholder="名称" id="name"  required>
                                      </div>
                                  </div>
                                 <div class="form-group">
                                      <label class="col-sm-3 col-sm-3 control-label">描述</label>
                                      <div class="col-sm-9">
                                          <input type="text" class="form-control" name="info"
                                            placeholder="描述" id="info"  required>
                                      </div>
                                  </div>
                                 <div class="form-group">
                                      <label class="col-sm-3 col-sm-3 control-label">概率</label>
                                      <div class="col-sm-9">
                                          <input type="text" class="form-control" name="probability"
                                            placeholder="概率" id="probability" onkeyup="this.value=this.value.replace(/\D/g,'')"  required>
                                      </div>
                                  </div>
                                 <div class="form-group">
                                      <label class="col-sm-3 col-sm-3 control-label">奖值</label>
                                      <div class="col-sm-9">
                                          <input type="text" class="form-control" name="prizeNumber"
                                            placeholder="奖值" id="prizeNumber" onkeyup="this.value=this.value.replace(/\D/g,'')"  required>
                                      </div>
                                  </div>
                                 <div class="form-group">
                                      <label class="col-sm-3 col-sm-3 control-label">类型</label>
                                      <div class="col-sm-9">
                                          <input type="text" class="form-control" name="type"
                                            placeholder="类型" id="type"  required>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-3 col-sm-3 control-label"></label>
                                    <div class="col-sm-9">
                                      <button class="btn btn-danger" type="submit">增加</button>
                                    </div>
                                  </div>		
							</fieldset>
						</form>
					</div>
				</section>
			</div>
			<div class="col-lg-8">
				<section class="panel">
					<header class="panel-heading"> 抽奖列表 </header>
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
                            <th>操作</th>
                          </tr>
                                </thead>
                              <tbody role="alert" aria-live="polite" aria-relevant="all">
                                <#list pageVo.list as e>
                                <tr class="gradeA odd">
                                      <td>${e.name?if_exists}</td>
                                      <td>${e.info?if_exists}</td>
                                      <td>${e.probability}</td>
                                      <td>${e.prizeNumber}</td>
                                      <td>${e.type?if_exists}</td>
                                      <td> <a href="${BASE_PATH}/manage/prize/update.htm?prizeId=${e.prizeId}" title="修改">修改</a>
                                      | <a href="javascript:void(0);" prizeId="${e.prizeId}" title="删除" title="删除" class="js_delete_prize">删除</a></td>
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
	
		$('#add_prize_form').ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					showErrors($('#add_prize_form'),data.errors);
				}
			}
		});
		$('.js_delete_prize').click(function() {
		var prizeId= $(this).attr('prizeId');
        bootbox.dialog({
            message: "是否" + $(this).attr('title') + "奖品",
            title: "提示",
            buttons: {
                "delete": {
                    label: "删除",
                    className: "btn-success",
                    callback: function() {
                        $.post("${BASE_PATH}/manage/prize/delete.json", {
                            "prizeId": prizeId
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