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
//= require bootstrap-modal
//= require jquery-ui
//= require jquery.meio.mask.min
//= require_tree .


$(function(global) {
	
	$('a[data-code]').click(function() {
		$('pre').toggle();
	});
	
	window.openModal = function(modal) {
		$(modal).modal({backdrop : true, show : true});
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
	})
	window.validationForms();
});