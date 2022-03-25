class SetDefaultValueOnIsComplete < ActiveRecord::Migration[6.0]
  def change
    change_column_default :todos, :isCompleted, from: nil, to: false
  end
end
