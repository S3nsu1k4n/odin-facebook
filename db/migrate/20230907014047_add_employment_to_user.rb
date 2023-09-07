class AddEmploymentToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :employment, :string
  end
end
