class AddBreedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :breed, :string
  end
end
