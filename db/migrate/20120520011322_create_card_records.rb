class CreateCardRecords < ActiveRecord::Migration
  def change
    create_table :card_records do |t|
      t.integer :user_id
      t.integer :card_id
      t.integer :seen_count, default: 0
      t.integer :wrong_count, default: 0
      t.integer :right_count, default: 0
      t.integer :bucket, default: 0
      t.boolean :active, default: false
      t.datetime :last_seen_at
    end

    add_index :card_records, :user_id
    add_index :card_records, [:user_id, :card_id], unique: true
  end
end
