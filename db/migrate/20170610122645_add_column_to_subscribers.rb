class AddColumnToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :age, :integer
  end
end
