class AddClientOrder < ActiveRecord::Migration
  def change
  	  create_table :client_orders do |t|
  		t.string :name
  		t.string :phone
  		t.string :address
  		t.string :list  		  		
  		t.decimal :total

  		t.timestamps
  	  end
  end
end
