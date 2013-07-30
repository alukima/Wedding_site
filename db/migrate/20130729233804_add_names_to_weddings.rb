class AddNamesToWeddings < ActiveRecord::Migration
  def change
  	add_column :weddings, :groom_name, :string
  	add_column :weddings, :bride_name, :string
  	add_column :weddings, :couple_name, :string
  	
  	create_table :registrations do |t|
  		t.string :name 
  		t.string :url
  	end

  end
end
