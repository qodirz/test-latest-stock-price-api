class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', optional: true

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true, inclusion: { in: %w[credit debit transfer] }
  validate :source_and_target_wallet_presence
  validate :sufficient_funds_for_debit

  private

  def source_and_target_wallet_presence
    if transaction_type == 'credit' && source_wallet.present?
      errors.add(:source_wallet, 'must be nil for credit transactions')
    elsif transaction_type == 'debit' && target_wallet.present?
      errors.add(:target_wallet, 'must be nil for debit transactions')
    elsif transaction_type == 'transfer' && (source_wallet.nil? || target_wallet.nil?)
      errors.add(:base, 'Both source and target wallets must be present for transfers')
    end
  end

  def sufficient_funds_for_debit
    if transaction_type == 'debit' && source_wallet.balance < amount
      errors.add(:amount, 'Insufficient funds in the source wallet')
    end
  end
end
