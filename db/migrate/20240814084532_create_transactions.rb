class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.string :transaction_type, null: false
      t.references :source_wallet, foreign_key: { to_table: :wallets }, index: true
      t.references :target_wallet, foreign_key: { to_table: :wallets }, index: true
      t.string :description
      t.string :status, default: 'pending', null: false

      t.timestamps
    end

    add_index :transactions, [:source_wallet_id, :target_wallet_id]
  end
end
