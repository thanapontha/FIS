(function($){
	
	var lastAction = '';
	var lastSearchCriteria = {};
	
	
	/**
	 * Likewise Onload()
	 */
	$(function(){
		
		lastSearchCriteria = {};
		enableDisableButton(false);
		$('#rowsPerPage').val(rowsPerPage);
		
		$('#createDateFrom, #createDateTo, #deliveryDateFrom, #deliveryDateTo, #activationDateFrom, #activationDateTo').datepicker({
			showOn: "button",
			buttonImage: calendarImgPath,
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: 'dd/mm/yy',
			onSelect: function(){
				$(this).focus();	
			}
		});
		
		$('#openActivateRedPlant').live('click',function(e){
			var jsonParams = {
					"vehBrand" : $(this).attr("brand"),
					"vehVinNo" : $(this).attr("vinNo")				
					};			
			
			FISLib.PageOpen(_rootPath + '/NewCarInsurance/ActivateRedPlant', "WKV03120", jsonParams);
		});
		
		validateDate(document.getElementById('deliveryDateFrom'));
		validateDate(document.getElementById('deliveryDateTo'));
		validateDate(document.getElementById('createDateFrom'));
		validateDate(document.getElementById('createDateTo'));
		validateDate(document.getElementById('activationDateFrom'));
		validateDate(document.getElementById('activationDateTo'));
		
	});
	
	
	/**
	 * Function : Click Search at Button 'Search' by in Button will have OnClick = 'clickSearch'
	 */
	window.clickSearch = 
		function clickSearch(){
			lastAction = 'search';
			$("#messageResult").val("");
			
			var searchForm = $('#search-form');
			searchForm.find('input[name=firstResult]').val(0);
			searchForm.find('input[name=rowsPerPage]').val(rowsPerPage);
			
			//Reset result panel
			var prevFlag = initDataTable;
			initDataTable = false;
			var dataTable = $('#result').dataTable();
			var setting = dataTable.fnSettings();
			setting._iDisplayStart = 0;
			dataTable.fnClearTable(true);
			initDataTable = prevFlag;
			
			FISLib.clearST3Message();
			$("#search-form").submit();
			enableDisableButton(false);
	}
	
	
	/**
	 * Function : Return from method for Controller(Action) by set at Form:[ajax='searchFinish']
	 */
	window.searchFinish = 
		function searchFinish(data,loading){
		
			saveSearchCriteria();
		
			if(data  && typeof data != 'undefined'){
				
				if(data.errorMessages != "" && typeof data.errorMessages != 'undefined') {
	    			if (data.focusId != "" && typeof data.focusId != 'undefined') {
	    				searchNotFoundMode();
	    				enableDisableButton(false);
	    			}
	    		} else {
	    			dataForm = data.objectForm;
	    			var dataTable = $( '#result' ).dataTable();
	    			dataTable.fnClearTable(true);
	    			
	    			if (dataForm != null) {
	    				ST3Lib.content.disabled( '#data-head-panel', false );
	    				$.each(dataForm, function(item, value){
	    		            $("#"+item).val(value);
	    		        });
	    				ST3Lib.content.disabled( '#data-head-panel', true );
	    			}
	    			
	    			loading.close();
	    		}
			}
			loading.close();
		};
	
	/**
	 * Function : Create Row in Table in Case Search Data
	 */
	window.processAjaxDataList =
		function processAjaxDataList(datas, loading, callback){
			var dataList = datas.objectsInfoList;
			if(dataList){
				$('#result .dataTables_empty').parent().hide();
				var dataTable = $('#result').dataTable();
				
				var setting = dataTable.fnSettings();
				setting.aoColumns[0].sClass = 'col1 rownum';
				setting.aoColumns[1].sClass = 'col2 ';
				setting.aoColumns[2].sClass = 'col3';
				setting.aoColumns[3].sClass = 'col4';
				setting.aoColumns[4].sClass = 'col5';
				setting.aoColumns[5].sClass = 'col6';
				setting.aoColumns[6].sClass = 'col7';
				setting.aoColumns[7].sClass = 'col8';
				setting.aoColumns[8].sClass = 'col9';
				setting.aoColumns[9].sClass = 'col10';
				setting.aoColumns[10].sClass = 'col11';
				setting.aoColumns[11].sClass = 'col12';
								
				var tempDiv = $('<div/>');
				var i = 0;
				var arrayData = [];
				var processor = setInterval(function(){
				var processPerTick = rowsPerPage;
				for(var j = 0; j < processPerTick; ++j) {
					var data = dataList[i++];
					if ( data ) {
						var link = "<a id='openActivateRedPlant' class='openActivateRedPlant' brand='Toyota' vinNo='"+data.vinNo+"'>"+data.vinNo+"</a>";
						
						//var link = '<a href="'+_rootPath+'/NewCarInsurance/ActivateRedPlant">' + data.vinNo + '</a>';
						arrayData.push([ 
						                ''
						                , data.documentStatus || ''
									    , data.model || ''
									    , link || ''
									    , data.customerName || ''
									    , data.insType || ''
									    , data.premiumType || ''
									    , data.insCompany || ''
									    , data.insClass || ''
									    , data.insPremium || ''
									    , data.activationDate || ''
									    , data.ddmsStatus || ''
									]);
					}else{
						processPerTick = 0;
						clearInterval(processor);
						callback(arrayData);
						break;
					}
				}
			},1 );
				
			enableDisableButton(true);
		} else {
			enableDisableButton(false);
			callback([]);
		}};	
	
		window.clearSearch =
			function clearSearch(){
				lastAction = "clear";
				$('#result').dataTable().fnClearTable();
				$("#messageResult").val("");
				document.getElementById("search-form").reset();	
				FISLib.clearST3Message();
				enableDisableButton(false);
				lastSearchCriteria = {}
			};
		
			
		window.searchValidateError =
			function searchValidateError(){
				return;
			};
				
		window.saveValidateError =
			function saveValidateError(){
				return;
			};	
		
		/**
		 * Funciton : Create Pagination 
		 */
		var initDataTable = false;
		window.serverData = 
		function serverData(sSource, aoData, fnCallback, oSettings) {

			if (initDataTable === false || lastAction === 'clear' ) {
				initDataTable = true;
				fnCallback({iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: []});
				return;
			}
			
			if(lastAction === 'cancel') {
				FISLib.clearST3Message();
				fnCallback({iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: []});
				return;
			}
			
			var searchForm = $('#search-form');
			searchForm.find('input[name=firstResult]').val(oSettings._iDisplayStart || 0);
			searchForm.find('input[name=rowsPerPage]').val(oSettings._iDisplayLength || rowsPerPage);
			searchForm.find('input[name=messagResult]').val("");
			
			
			searchForm.submitForm(function(data, loading){
				var firstResult = data.firstResult
				, rowsPerPage = data.rowsPerPage
				, totalRows =  data.totalRows;
				processAjaxDataList(data, loading, function(arrayData){
					fnCallback({
						iTotalRecords: totalRows,
						iTotalDisplayRecords: totalRows,
						aaData: arrayData
					});
				});
			});
		};

		window.moveHScrollBar =
			function moveHScrollBar(value){
				$('#search-result .dataTable-wrapper').scrollLeft(0);
			};
		
		function restoreSearchCriteria(){
		}
			
		function saveSearchCriteria(){
		}
		
		function searchNotFoundMode(){
			ST3Lib.content.disabled('#search-criteria', false);
			$( '#result' ).dataTable().fnClearTable(true);
		}
		
		function enableFieldMode(type) {

		}
		
		
		function searchFoundMode(){		
			ST3Lib.content.disabled('#search-result', true);
			ST3Lib.content.disabled('#search-criteria', false);
		}
		
	function enableDisableButton(haveData){

	}
	
})(ST3Lib.$);