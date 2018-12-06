<#assign menu="headline">
<#assign submenu="headline_list">
<#include "../head.ftl">
<style type="text/css">
.pagination {
    border-radius: 4px;
    display: inline-block;
    margin: 0;
    padding-left: 0;
}

.howto, .nonessential, #edit-slug-box, .form-input-tip, .subsubsub {
    color: #666666;
}

.subsubsub {
    float: left;
    font-size: 12px;
    list-style: none outside none;
    margin: 8px 0 5px;
    padding: 0;
}

.form-group{
	width:100%;
}

.count{
	position:absolute ;
	right:0px;
}

.arrticle_status{
	float:left;
}
</style>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<div class="row">
                  <div class="col-lg-12">
                      <!--breadcrumbs start -->
                      <ul class="breadcrumb">
				<li>
					今日统计
				</li>
                      </ul>
                      <!--breadcrumbs end -->
                  </div>
              </div>
        	<!-- page start-->
            <section class="panel">
	                <header class="panel-heading">
		                <div class="row">
		                  		<div class="col-lg-12">今日访问统计</div>
						</div>
					</header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
                            <table class="table table-striped table-advance table-hover">
                            	<thead>
                                	<tr>
										<th>新用户数量</th>
										<th>今日访问次数</th>
										<th>今日中奖数量</th>
										<th>今日领奖数量</th>
              						</tr>
                                </thead>
                            	<tbody role="alert" aria-live="polite" aria-relevant="all">
                            		<tr class="gradeA odd">
                                      <td>${userCount}</td>
                                      <td>${comeCount}</td>
                                      <td>${prizeCount}</td>
                                      <td>${wx10086Count}</td>
                                  	</tr>
                               	</tbody>
                              </table>
                           </div>
                        </div>
                  </div>
              </section>
              <section class="panel">
	                <header class="panel-heading">
		                <div class="row">
		                  	<div class="col-lg-12">今日中奖统计</div>
						</div>
					</header>
                <div class="panel-body">
                	<div class="adv-table">
                    	<div role="grid" class="dataTables_wrapper" id="hidden-table-info_wrapper">
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
	                                <#list prizeVo as e>
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
              </section>
              <!-- page end-->
          </section>
		</section>
		
		<!--main content end-->
<script>
$(function(){
			
});
</script>
<#include "../foot.ftl">
