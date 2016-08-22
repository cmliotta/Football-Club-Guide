class AddStadiumAndAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :nickname, :string, after: :name
    add_column :clubs, :stadium, :string, after: :nickname
    add_column :clubs, :address, :string, after: :description
    add_column :clubs, :country, :string, after: :address
  end
end
