class AddUsersCtid < ActiveRecord::Migration
  def change
  	add_column :users, :ct_id, :string
  end
end
