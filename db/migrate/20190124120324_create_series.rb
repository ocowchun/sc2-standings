class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
