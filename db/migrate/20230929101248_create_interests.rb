class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.string :interest
      t.belongs_to :profil

      t.timestamps
    end
  end
end
