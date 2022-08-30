class Cities < ActiveRecord::Migration[7.0]
  def up
    create_table :cities do |t|
      t.string :name
      t.api_id :integer
      t.timestamp :date
      
    end
  end
 
  def down
    drop_table :products
  end
end
