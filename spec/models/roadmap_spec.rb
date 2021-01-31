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
  pending "add some examples to (or delete) #{__FILE__}"
end
