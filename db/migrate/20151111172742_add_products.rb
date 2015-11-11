class AddProducts < ActiveRecord::Migration
  def change
  	Product.create  :title => 'Bellissimo', 
  				 	:description => 'This is Bellissimo pizza',
  				 	:price => 350,
  				 	:size => 30,
  				 	:is_spicy => false,
  				 	:is_veg => false,
  				 	:is_best_offer => false,
  				 	:path_to_image => '/images/pizza_bellissimo.jpg'

  	Product.create  :title => 'Bueno', 
  				 	:description => 'This is Bueno pizza',
  				 	:price => 250,
  				 	:size => 50,
  				 	:is_spicy => true,
  				 	:is_veg => true,
  				 	:is_best_offer => false,
  				 	:path_to_image => '/images/pizza_bueno.jpg'

  	Product.create  :title => 'Italia', 
  				 	:description => 'This is Italia pizza',
  				 	:price => 550,
  				 	:size => 60,
  				 	:is_spicy => true,
  				 	:is_veg => false,
  				 	:is_best_offer => false,
  				 	:path_to_image => '/images/pizza_italia.jpg'  

  	Product.create  :title => 'Marcello', 
  				 	:description => 'This is Marcello pizza',
  				 	:price => 250,
  				 	:size => 40,
  				 	:is_spicy => true,
  				 	:is_veg => false,
  				 	:is_best_offer => true,
  				 	:path_to_image => '/images/pizza_marcello.jpg'  
  				
  	Product.create  :title => 'Rizio', 
  				 	:description => 'This is Rizio pizza',
  				 	:price => 1250,
  				 	:size => 60,
  				 	:is_spicy => true,
  				 	:is_veg => false,
  				 	:is_best_offer => false,
  				 	:path_to_image => '/images/pizza_rizio.jpg'  
  end
end
