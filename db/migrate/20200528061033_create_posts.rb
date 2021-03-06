class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :image
      t.string :title
      t.string :date
      t.string :time
      t.string :address
      t.string :whether
      t.string :temperature
      t.string :water_temperature
      t.string :tide
      t.text :fishing_style
      t.text :catch
      t.text :report
      
      t.timestamps
    end
  end
end
