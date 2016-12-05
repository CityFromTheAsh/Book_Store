require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'methods' do
    let(:user) { build :user }
    let(:order) { build :order }
    let(:book) { build :book }

    it '@user.balance should be 50' do
      book.price = 50
      user.balance = 100
      order.pay_for_book user, book
      expect(user.balance).to eq 50
      expect(user.login).not_to be_empty
      expect(book.status).to eq :delivery
    end

    it 'user.login check' do
      expect(user.login).not_to be_empty
    end

  end
end
