class AddIndexToRecyclersEmail < ActiveRecord::Migration[7.2]
  def change
    add_index :recyclers, :email, unique: true
  end
end
