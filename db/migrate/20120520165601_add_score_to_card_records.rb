class AddScoreToCardRecords < ActiveRecord::Migration
  def change
    add_column :card_records, :score, :integer, default: 0
  end
end
