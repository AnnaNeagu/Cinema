class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :generes
      t.integer :rating
      t.integer :running_time
      t.string :trailer
      t.string :image

      t.timestamps
    end
  end
end
