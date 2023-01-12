class AddRefGossipToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :gossip, null: false, foreign_key: true
  end
end
