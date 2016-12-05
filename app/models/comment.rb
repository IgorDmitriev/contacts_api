# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  target_id   :integer
#  target_type :string
#  user_id     :integer          not null
#  text        :text             not null
#

class Comment < ActiveRecord::Base
  validates :target_id, :target_type, :user_id, :text, presence: true

  belongs_to :target, polymorphic: true
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
end
