class RenameUserPasswordField < ActiveRecord::Migration
  @@table_name = 'users'
  @@column_name = 'password'
  @@new_column_name = 'password_hash'

  def self.up
    rename_column(@@table_name, @@column_name, @@new_column_name)
  end

  def self.down
    rename_column(@@table_name, @@new_column_name, @@column_name)
  end
end
