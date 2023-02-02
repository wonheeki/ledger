$(window).on('load',function(){
	$('#load').hide();
	
	document.getElementById('fl_date').valueAsDate = new Date();
});

/*$('#confirm').click(function() {
	if($('#fl_expense').val()=='')  {
        $('#fl_expense').val=0;
	}
	if($('#fl_income').val()=='')  {
		$('#fl_income').val=0;
	}
	if($('#fl_detail').val()=='')  {
		$('#fl_detail').val='-';
	}

});
*/

$(document).ready(function() {
	  $('#tbl_expense').hide();	
	  $('#fl_category').change(function() {
	    var result = $("#fl_category option:selected").val();
	    if (result == '월급' || 
	    		result =='용돈' ||
	    		result =='(수입)기타') {
	      $('#tbl_income').show();
	      $('#tbl_expense').hide();
	    } else if(result == '식비' || 
	    		result =='생활비' ||
	    		result =='공과금' ||
	    		result =='경조사비' ||
	    		result =='여행비' ||
	    		result =='교육비' ||
	    		result =='교통비' ||
	    		result =='여가' ||
	    		result =='쇼핑' ||
	    		result =='의료' ||
	    		result =='(지출)기타'){
	    	$('#tbl_income').hide();
	    	$('#tbl_expense').show();
	      
	    }
	    
	}); 
	  
}); 

function goBack(){
	history.go(-1);
}

