class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.references :entity, polymorphic: true, null: false
      t.decimal :balance, precision: 15, scale: 2, default: 0.0, null: false
      t.string :currency, null: false

      t.timestamps
    end

    add_index :wallets, [:entity_type, :entity_id]
  end
end
