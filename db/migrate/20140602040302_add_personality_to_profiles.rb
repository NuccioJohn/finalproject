class AddPersonalityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :personality, :string
  end
end
