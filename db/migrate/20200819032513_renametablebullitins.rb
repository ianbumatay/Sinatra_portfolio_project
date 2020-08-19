class Renametablebullitins < ActiveRecord::Migration[5.2]
  def change 
    rename_table :bullitins, :bulletins
  end
end
