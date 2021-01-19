require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when a new user is created' do
    subject(:user) { create(:user) }

    before { user.reload }

    it 'sends out a motivator mail' do
      expect(user.last_motivator_date).to eq Date.today
    end
  end
end
