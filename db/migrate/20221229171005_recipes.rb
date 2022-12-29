class Recipes < ActiveRecord::Migration[7.0]
  # def change
  # end
  def self.up
      create_table :recipes do |t|
         #t.column :id, :integer, :null => false
         t.column :name, :string, :null => false
         t.column :photo_link, :string, :null => false
         t.column :instructions, :string, :null => false
      end
   end

   def self.down
      drop_table :recipes
   end
end
