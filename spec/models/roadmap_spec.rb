# == Schema Information
#
# Table name: roadmaps
#
#  id                   :bigint(8)        not null, primary key
#  reminder_period      :integer(4)
#  reminder_period_days :integer(4)
#  start_date           :date
#  the_one_habit        :string
#  the_one_thing        :string
#  the_why_of_one_thing :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer(4)
#
require 'rails_helper'

RSpec.describe Roadmap, type: :model do
  subject(:roadmap) { described_class.create!(params) }
  let(:params) {
    {
      the_one_thing: 'pusheen',
      the_why_of_one_thing: 'cause it\'s neat',
      the_one_habit: 'grindin',
      start_date: Date.tomorrow,
      milestones: [create(:milestone)],
      accountability_buddies: [create(:accountability_buddy)],
      user: create(:confirmed_blank_user)
    }
  }

  it 'has The One Thing' do
    # FIXME: don't hard code
    expect(roadmap.the_one_thing).to eq 'pusheen'
  end
  it 'has a user'
  it 'has a habit to track'
  it 'starts in future'

  context 'when newly created' do
    context 'with an accountability buddy defined' do
      it 'sends out an email to buddy'
    end

    context 'without a defined accountability buddy' do
      it 'does not trigger the BuddyMailer'
    end
  end
end
