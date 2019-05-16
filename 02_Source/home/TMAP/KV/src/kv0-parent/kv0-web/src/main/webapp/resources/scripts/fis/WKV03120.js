(function($) {
	var checkConfirmMessageBeforeExit = false;

	window.onbeforeunload = function(event) {
		if (checkConfirmMessageBeforeExit) {
			return MSTD0003ACFM;
		}
	};
	
	var lastAction = '';

	$(function() {
		
		$('#premiumInput, #activation, #birthDate, #dateCompRegistration, #coverageUntil').datepicker({
			showOn: "button",
			buttonImage: calendarImgPath,
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: 'dd/mm/yy',
			onSelect: function(){
				$(this).focus();	
			}
		});
		
		validateDate(document.getElementById('activation'));
		validateDate(document.getElementById('birthDate'));
		validateDate(document.getElementById('registerDate'));
		validateDate(document.getElementById('coverageTo'));
		
		validateDecimal(document.getElementById('insPremium'), 10, 0, '');
		validateDecimal(document.getElementById('coverage'), 10, 0, '');
		validateNumber(document.getElementById('vehicleAct'), 3, 0, false);
		
		$("[name='typeOfCustomer']").click(function() {
			if($(this).val()=='Personal'){
				$('#customerIndividual').show();
				$('#customerJuristic').hide();
			}else{
				$('#customerIndividual').hide();
				$('#customerJuristic').show();
			}
		});
		
		
		$("input:radio[name='typeOfCustomer']:first").attr("checked",true);
		$("input:radio[name='typeOfCustomer']:first").click();
		
		//begin personal
		$('#cuspProvince').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuspProvinceChange',
				  data: { cuspProvince : $("#cuspProvince").val()}
				})
				.done(function( data ) {
					var cuspDistrict = $('#cuspDistrict');
					var cuspSubDistrict = $("#cuspSubDistrict");
					var cuspZipcode = $("#cuspZipcode");
					cuspDistrict.empty();
					cuspSubDistrict.empty();
					cuspZipcode.empty();
									
					cuspDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuspSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuspZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuspDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuspDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuspDistrictChange',
				  data: { cuspProvince : $("#cuspProvince").val(), 
					  	  cuspDistrict : $("#cuspDistrict").val()}
				})
				.done(function( data ) {
					var cuspSubDistrict = $("#cuspSubDistrict");
					var cuspZipcode = $("#cuspZipcode");
					cuspSubDistrict.empty();
					cuspZipcode.empty();
									
					cuspSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuspZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuspSubDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuspSubDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuspSubDistrictChange',
				  data: { cuspSubDistrict : $("#cuspSubDistrict").val()}
				})
				.done(function( data ) {
					var cuspZipcode = $("#cuspZipcode");
					cuspZipcode.empty();
									
					cuspZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuspZipcode.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuspBillProvince').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuspBillProvinceChange',
				  data: { cuspBillProvince : $("#cuspBillProvince").val()}
				})
				.done(function( data ) {
					var cuspBillDistrict = $('#cuspBillDistrict');
					var cuspBillSubDistrict = $("#cuspBillSubDistrict");
					var cuspBillZipcode = $("#cuspBillZipcode");
					cuspBillDistrict.empty();
					cuspBillSubDistrict.empty();
					cuspBillZipcode.empty();
									
					cuspBillDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuspBillSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuspBillZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuspBillDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuspBillDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuspBillDistrictChange',
				  data: { cuspBillProvince : $("#cuspBillProvince").val(), 
					  	  cuspBillDistrict : $("#cuspBillDistrict").val()}
				})
				.done(function( data ) {
					var cuspBillSubDistrict = $("#cuspBillSubDistrict");
					var cuspBillZipcode = $("#cuspBillZipcode");
					cuspBillSubDistrict.empty();
					cuspBillZipcode.empty();
									
					cuspBillSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuspBillZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuspBillSubDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuspBillSubDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuspBillSubDistrictChange',
				  data: { cuspBillSubDistrict : $("#cuspBillSubDistrict").val()}
				})
				.done(function( data ) {
					var cuspBillZipcode = $("#cuspBillZipcode");
					cuspBillZipcode.empty();
									
					cuspBillZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuspBillZipcode.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		//end of personal
		
		//begin company
		$('#cuscProvince').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuscProvinceChange',
				  data: { cuscProvince : $("#cuscProvince").val()}
				})
				.done(function( data ) {
					var cuscDistrict = $('#cuscDistrict');
					var cuscSubDistrict = $("#cuscSubDistrict");
					var cuscZipcode = $("#cuscZipcode");
					cuscDistrict.empty();
					cuscSubDistrict.empty();
					cuscZipcode.empty();
									
					cuscDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuscSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuscZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuscDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuscDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuscDistrictChange',
				  data: { cuscProvince : $("#cuscProvince").val(), 
					  	  cuscDistrict : $("#cuscDistrict").val()}
				})
				.done(function( data ) {
					var cuscSubDistrict = $("#cuscSubDistrict");
					var cuscZipcode = $("#cuscZipcode");
					cuscSubDistrict.empty();
					cuscZipcode.empty();
									
					cuscSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuscZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuscSubDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuscSubDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuscSubDistrictChange',
				  data: { cuscSubDistrict : $("#cuscSubDistrict").val()}
				})
				.done(function( data ) {
					var cuscZipcode = $("#cuscZipcode");
					cuscZipcode.empty();
									
					cuscZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuscZipcode.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuscBillProvince').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuscBillProvinceChange',
				  data: { cuscBillProvince : $("#cuscBillProvince").val()}
				})
				.done(function( data ) {
					var cuscBillDistrict = $('#cuscBillDistrict');
					var cuscBillSubDistrict = $("#cuscBillSubDistrict");
					var cuscBillZipcode = $("#cuscBillZipcode");
					cuscBillDistrict.empty();
					cuscBillSubDistrict.empty();
					cuscBillZipcode.empty();
									
					cuscBillDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuscBillSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuscBillZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuscBillDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuscBillDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuscBillDistrictChange',
				  data: { cuscBillProvince : $("#cuscBillProvince").val(), 
					  	  cuscBillDistrict : $("#cuscBillDistrict").val()}
				})
				.done(function( data ) {
					var cuscBillSubDistrict = $("#cuscBillSubDistrict");
					var cuscBillZipcode = $("#cuscBillZipcode");
					cuscBillSubDistrict.empty();
					cuscBillZipcode.empty();
									
					cuscBillSubDistrict.append('<option value="">&lt;Select&gt;</option>');
					cuscBillZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuscBillSubDistrict.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		
		$('#cuscBillSubDistrict').change(function() {
			$.ajax({
				  method: "POST",
				  async : false,
				  url: mappingPath+'/cuscBillSubDistrictChange',
				  data: { cuscBillSubDistrict : $("#cuscBillSubDistrict").val()}
				})
				.done(function( data ) {
					var cuscBillZipcode = $("#cuscBillZipcode");
					cuscBillZipcode.empty();
									
					cuscBillZipcode.append('<option value="">&lt;Select&gt;</option>');
					
					if(data){										
						for(var i = 0; i < data.length; ++i) {
							var obj = data[i];						
							cuscBillZipcode.append('<option value="{0}">{1}</option>'.format(obj.stValue, obj.stLabel));
						}
					}
				})
				.error(function() {});
		});
		//end of company
	});
	
	
	window.saveAddEditObject = 
		function saveAddEditObject(){
			var confirmMsg = MKV00001ACFM;
			var confirmCode = 'MKV00001ACFM';
			if (lastAction !== 'add') {
				confirmMsg = MKV00002ACFM;
				confirmCode = 'MKV00002ACFM';
			}
		
			ST3Lib.dialog.confirm(confirmMsg, confirmCode, function(ret){
				if (!ret) {
					return;
				}else{
					GWRDSLib.clearST3Message();
					if (lastAction === 'add') {
						$('#search-form').attr('action', mappingPath + '/saveAdd').attr('_method', 'post');
					} else {
						$("#tcFrom").val($("#hidtcFrom").val());
						$('#search-form').attr('action', mappingPath + '/saveEdit').attr('_method', 'post');
					}
					var saveForm = $('#search-form');
					saveForm.submit();
				}
			});
		};
	
	
	window.doConfirmSubmit = function doConfirmSubmit() {
		FISLib.dialog.open("NewCarConfirmSubmitDialog", _rootPath
				+ "/NewCarInsurance/ActivateRedPlant/confirmSubmit",
				"Do you confirm to activate ?", 400, 200);
	}
	
	window.doActivate = function doActivate() {
		FISLib.dialog.open("NewCarActivateDialog", _rootPath
				+ "/NewCarInsurance/ActivateRedPlant/activate",
				"Temporary Policy activated", 220, 120);
	}

})(ST3Lib.$);