class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :url
      t.boolean :status
      t.datetime :lastchecked

      t.timestamps
    end
  end
end
