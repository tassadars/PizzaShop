var key = 'product_';	

function something()
{
	var x = window.localStorage.getItem('aaa');

	x = x*1 + 1;

	window.localStorage.setItem('aaa', x);

	alert(x);
}


function add_to_cart(id)
{
	var x = window.localStorage.getItem(key+id);
	x = x*1 + 1;
	window.localStorage.setItem(key+id, x);
	
	move_orders_to_input();
}


function get_total_product_count ()
{
	var total = 0;

	$.each(localStorage, function(k, v){
  		if (k.indexOf(key) > -1) {
			total = total*1 + v*1;
  		}
 	});
	
	window.localStorage.setItem('total', total)
}

function get_all_cart_products ()
{
	var order = '';

	$.each(localStorage, function(k, v){
  		if (k.indexOf(key) > -1) {
			order = order + k + '=' + v + ',';
  		}
 	});
	
	return order;
}

function move_orders_to_input() {
	var orders = get_all_cart_products();
	$('#orders_input').val(orders);
}

function get_product_count (id)
{
	//var key = window.localStorage.key(index); // get the key in hash 
	var result = window.localStorage.getItem(key+id); 
	if (result == null) return 0
		else
	return result; 	
}
 
/*
function change(el)
{
    el.value = el.value*1 + 1;
}
*/