// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-alerts
//= require bootstrap-dropdown
//= require bootstrap-buttons
//= require bootstrap-modal
//= require jquery-ui
//= require jquery.meio.mask.min
//= require jquery.miniColors.min
//= require_tree .


$(function(global) {
	
	jQuery.ajaxSetup({ 
	  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript")}
	})
	
	$('body')
		.bind("ajax:beforeSend",function() { disableSubmits(true) })
		.bind("ajax:complete", function(){ disableSubmits(false) });

	
	window.disableSubmits = function(toBeDisable) {
		if (toBeDisable)
			$("form[data-remote] input[type=submit]").attr('disabled', 'disabled');
		else 
			$("form[data-remote] input[type=submit]").removeAttr('disabled');

	};
	
	var loadingHandle = function(e) {
		var $this = $(this); 
		$this.val('loading...');
		$this.prop('disabled', true);
	},
	completeHandle = function(e) {

	};
	
	$('a[data-code]').click(function() {
		$('pre').toggle();
	});
	
	window.openModal = function(modal, options) {
		$(modal).modal((options || {backdrop : true, show : true}));
	};
	
	window.hideModal = function(modal) {
		$(modal).modal('hide');
	};
	
	window.validationForms = function() {
		//Mask of numbers
	 	$.mask.masks.number = { mask : '99999999999999'};
	 	$.mask.masks.state = { mask : 'aa'};
		$('input:text').setMask();
		//Wrapper to dates class 
		$('input.date_picker').datepicker({ dateFormat : "dd-mm-yy" });  		
	};
	
	$('.modal').bind('hidden', function() {
		$('form')[0].reset();
	});
	
	$('input.color_picker').miniColors();
	
	window.validationForms();
});