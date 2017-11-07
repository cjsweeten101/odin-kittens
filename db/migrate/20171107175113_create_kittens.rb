class CreateKittens < ActiveRecord::Migration[5.1]
  def change
    create_table :kittens do |t|
      t.string :name
      t.int :age
      t.int :cuteness
      t.int :softness

      t.timestamps
    end
  end
end
