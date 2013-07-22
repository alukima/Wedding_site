class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.integer :host_id
    	t.string :name
    	t.string :email
    	t.string :passcode
      t.timestamps
    end
  end
end
