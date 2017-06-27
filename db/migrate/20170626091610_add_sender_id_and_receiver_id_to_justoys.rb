class AddSenderIdAndReceiverIdToJustoys < ActiveRecord::Migration[5.0]
  def change
    add_column :justoys, :sender_id, :integer
    add_column :justoys, :receiver_id, :integer
  end
end
