/**
 *
 */

 $(document).ready(function() {
	delivNumberAdd();
});
function delivNumberAdd() {
	$('button[id^=delivNumberAdd_btn_')
		.on(
			"click",
			function() {

				$(this).next().html(
					"  <div><input placeholder='택배사' class='form-control' type='text' style='float:left; width:55%;' id='ordLDelivComp' name='ordLDelivComp' >"
					+ "  <br><div class='form-group'><input placeholder='송장번호' class='form-control' type='text' style='float:left; width:55%' id='ordLDelivNum' name='ordLDelivNum' >"
							+ "<button type='submit' class='btn btn-primary ' >" + "입력"+"</button></div>"

						);

			});
}
