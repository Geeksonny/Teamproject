
		
		
	  function dateSub(month) {
		    var d = new Date();
		    d.setMonth(d.getMonth() - month);
		    return d;
		}

  		function dateFormat(d){
			var date=new Date(d);
			var yyyy=date.getFullYear();
			var mm=date.getMonth()+1;
			mm = mm >=10 ? mm : '0'+mm;
			var dd=date.getDate();
			dd = dd>=10 ? dd : '0'+dd;
			return yyyy+'-'+mm+'-'+dd;
		}

	   	function Today(){
			var date=new Date();
			var yyyy=date.getFullYear();
			var mm=date.getMonth()+1;
			mm = mm >=10 ? mm : '0'+mm;
			var dd=date.getDate();
			dd = dd>=10 ? dd : '0'+dd;
			return yyyy+'-'+mm+'-'+dd;
		}
		
		$(document).ready( function() {

			// 버튼 누르면
			$('#searchMonth1').click( function() {
				var endDate = $('#endDate').val(Today());
				var startDate=$('#startDate').val(dateFormat(dateSub(1)));
			});
			
			$('#searchMonth3').click( function() {
				var endDate = $('#endDate').val(Today());
				var startDate=$('#startDate').val(dateFormat(dateSub(3)));
			});
			
			$('#searchMonth6').click( function() {
				var endDate = $('#endDate').val(Today());
				var startDate=$('#startDate').val(dateFormat(dateSub(6)));
			});
			
			
			
			
		});