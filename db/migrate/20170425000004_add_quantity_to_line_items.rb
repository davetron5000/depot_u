class AddQuantityToLineItems < ActiveRecord::Migration[5.1]
  def change
# START_HIGHLIGHT
    add_column :line_items, :quantity, :integer, default: 1
# END_HIGHLIGHT
  end
end
