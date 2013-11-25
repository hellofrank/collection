<div class="company-titles">
	<h3>公司名称:<%= @company.name %></h3>
<!--<div>image_tag @company.logo_url(:thumb) if @company.logo?</div>-->
</div>

<div class="row">
	<div class="span11" id="company-navs">
		<ul class="nav nav-pills">
			<li><%= link_to '公司介绍', company_path(@company)%></li>
			<li><%= link_to '联系方式', company_contact_path(@company)%></li>
			<li><%= link_to '法人信息', company_owner_path(@company)%></li>
			<li><%= link_to '服务范围', company_service_path(@company)%></li>
			<li><a href="#">工程介绍</a></li>
			<li><a href="#">套餐报价</a></li>
			<li><a href="#">案例展示</a></li>
		</ul>
	</div>
	<div class="span11">
		<div id="logo-images">
			<%= image_tag @company.logo , :class => "img-polaroid", :width => 150, :height => 180 %>
		</div>
		<div id="company-intro">
			广东星艺装饰集团股份有限公司于1991年在广州创立，属建筑装修装饰工程专业承包壹级、建筑装饰工程设计专项乙级、ISO9001国际质量体系认证企业，是广东省和广州市的“著名商标”企业。本集团公司注册资金3000万元，主营住宅装饰装修和酒店、宾馆、会所、商场、展厅、办公楼等公共空间设计和施工，兼营木业生产、家具制作、建筑材料、软装配饰、酒店餐饮和文化传媒、高级职业教育等产业。

			本集团下辖23个子公司和430个分公司，分布在全国23个省、市、自治区，从业人员45000人，其中拥有高端公共空间、家居空间、艺术配饰和园林设计师5000人，项目经理和工程监理9000人，技术工人30000人，成为国内业界经营网点最广、从业人数最多、专业实力最强的大型装饰装修企业。本集团公司为中国建筑装饰协会常务理事单位、中国建筑装饰协会住宅委员会副主任委员单位和中国建筑装饰协会设计委员会副主任委员单位。

		</div>
	</div>
</div>


