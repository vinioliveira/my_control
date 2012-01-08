$(function($) {
	$('body').delegate('[data-faux-submit]', 'click', function (e) {
		e.preventDefault();
		var $this 	= $(this),  
				$form		= $('#' + $this.data('faux-submit')), 
				action  = $form.attr('action'),
				params 	= $form.serialize(); 
				
		$.post(action, params, null, "script");
	})
});
