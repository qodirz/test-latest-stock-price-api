class WalletService
  def self.create_transaction(amount:, source_wallet: nil, target_wallet: nil, transaction_type:, description: nil)
    ActiveRecord::Base.transaction do
      transaction = Transaction.create!(
        amount: amount,
        source_wallet: source_wallet,
        target_wallet: target_wallet,
        transaction_type: transaction_type,
        description: description,
        status: 'pending'
      )

      if transaction_type == 'credit'
        target_wallet.update(balance: target_wallet.balance + amount)
      elsif transaction_type == 'debit'
        source_wallet.update(balance: source_wallet.balance - amount)
      elsif transaction_type == 'transfer'
        source_wallet.update(balance: source_wallet.balance - amount)
        target_wallet.update(balance: target_wallet.balance + amount)
      end

      transaction.update(status: 'completed')
      transaction
    end
  rescue ActiveRecord::RecordInvalid => e
    transaction.update(status: 'failed') if transaction
  end
end
