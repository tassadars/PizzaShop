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

function get_product_count (id)
{
	var result = window.localStorage.getItem(key+id); 
	if (result == null) return 0
		else
	return result; 	
}

