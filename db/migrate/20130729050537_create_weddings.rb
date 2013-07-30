class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
    	t.string :name
    	t.string :tag_line
    	t.datetime :date
    	t.string :venue_name
    	t.string :venue_photo
    	t.text :directions
    	t.text :about_us
    	t.text :general_info
    	t.text :about_him
    	t.text :about_her
    	t.string :address
    	t.string :city
    	t.string :state
    	t.integer :zip_code
    	t.integer :user_id
      t.timestamps
    end
  end
end


# food options
# links to other registrations
# photo page for guests
# social media profiles
# groom_name
# bride_name
# couple_name