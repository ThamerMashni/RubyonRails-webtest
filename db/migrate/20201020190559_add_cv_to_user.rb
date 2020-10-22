class AddCvToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cvFile, :string
  end
end
