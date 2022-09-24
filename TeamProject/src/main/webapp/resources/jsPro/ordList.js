/**
 *
 */

 $(document).ready(function() {
	delivNumberAdd();
});
function delivNumberAdd() {
	var optionIndex = 1;
	$('button[id^=delivNumberAdd_btn_')
		.on(
			"click",
			function() {

				$(this).next().html(
					"  <div class='form-group mt-2'><input placeholder='택배사' class='form-control' type='text' style='float:left; width:55%;' id='ordLDelivNumber' name='ordLDelivNumber' >"
					+ "  <br><div class='form-group'><input placeholder='송장번호' class='form-control' type='text' style='float:left; width:55%' id='ordLDelivNumber' name='ordLDelivNumber' >"
							+ "<button type='submit' class='btn btn-primary ' >" + "입력"+"</button></div>"

						);

			});
}