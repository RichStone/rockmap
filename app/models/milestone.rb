# == Schema Information
#
# Table name: milestones
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  liveline    :date
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  roadmap_id  :bigint(8)        not null
#
# Indexes
#
#  index_milestones_on_roadmap_id  (roadmap_id)
#
# Foreign Keys
#
#  fk_rails_...  (roadmap_id => roadmaps.id)
#
class Milestone < ApplicationRecord
  belongs_to :roadmap
end
