class ChangeInterestColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :interests, :interest, :name
  end
end
