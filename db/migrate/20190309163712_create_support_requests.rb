class CreateSupportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :support_requests do |t|
      t.text :request, comment: "text of the user's request"
      t.text :response, comment: "our response"
      t.references :order, foreign_key: true, comment: "their most recent order, if applicable"

      t.timestamps
    end
  end
end
