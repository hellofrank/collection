//控制管理员界面的测导航栏
$('document').ready(function(){
	var currentUrl = window.location.pathname;
	if(currentUrl.match('manager')||currentUrl.match('index_images')){
		$('.admin_slider').removeClass('admin_active');
		$('.admin_index').addClass('admin_active');
	}else if(currentUrl.match('users')){
		$('.admin_slider').removeClass('admin_active');
		$('.admin_user').addClass('admin_active');
	}else if(currentUrl.match('companies')){
		$('.admin_slider').removeClass('admin_active');
		$('.admin_company').addClass('admin_active');
	}else if(currentUrl.match('articles')){
		$('.admin_slider').removeClass('admin_active');
		$('.admin_article').addClass('admin_active');
	}else if(currentUrl.match('logs')){
		$('.admin_slider').removeClass('admin_active');
		$('.admin_log').addClass('admin_active');
	}
});
