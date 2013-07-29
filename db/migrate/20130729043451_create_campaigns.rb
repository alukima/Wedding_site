class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.string   :title
    	t.datetime :expiration_date
    	t.string   :ct_campaign_id
    	t.string   :image_file_name
    	t.text     :note
    	t.integer   :tilt_amount, :default => 1.0, :null => false #leave at $1 
      t.timestamps
    end
  end
end
