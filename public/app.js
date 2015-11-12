function something()
{
	var x = window.localStorage.getItem('aaa');

	x = x*1 + 1;

	window.localStorage.setItem('aaa', x);

	alert(x);
}


function add_to_cart(id)
{
	var key = 'product_' + id;	

	var x = window.localStorage.getItem(key);
	x = x*1 + 1;
	window.localStorage.setItem(key, x);
}


function get_total_product_count ()
{
	var total = 0;

	$.each(localStorage, function(key, value){
  		if (key.indexOf("product_") > -1) {
			total = total*1 + value*1;
			//alert(value); 		
  		}
 	});
	
	window.localStorage.setItem('total', total)
}