class Users < ActiveRecord::Migration[7.0]
  # def change
  # end
  def self.up
      create_table :users do |t|
         #t.column :id, :integer, :null => false
         t.column :nickname, :string, :null => false
         t.column :email, :string, :null => false
         t.column :password, :string, :null => false
      end
   end

   def self.down
      drop_table :users
   end
end
