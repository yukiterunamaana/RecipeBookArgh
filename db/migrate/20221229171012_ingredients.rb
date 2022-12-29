class Ingredients < ActiveRecord::Migration[7.0]
  # def change
  # end
  def self.up
      create_table :ingredients do |t|
         #t.column :id, :integer, :null => false
         t.column :name, :string, :null => false
      end
   end

   def self.down
      drop_table :ingredients
   end
end
