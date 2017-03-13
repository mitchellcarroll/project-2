class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.string :category
      # Good use of the decimal rails data type 
      t.decimal :value, :precision =>15, :scale => 2
      t.references :user
      t.timestamps
    end
  end
end
