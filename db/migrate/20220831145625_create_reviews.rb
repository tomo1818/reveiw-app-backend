class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.integer :evaluation
      t.boolean :done
      t.date :visit_day

      t.timestamps
    end
  end
end
