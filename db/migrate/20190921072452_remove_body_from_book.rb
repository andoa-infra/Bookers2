class RemoveBodyFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :Body, :string
  end
end
