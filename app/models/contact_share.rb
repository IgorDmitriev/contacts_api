# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :integer          not null
#  user_id    :integer          not null
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :contact_id }

  belongs_to :contact
  belongs_to :user, dependent: :destroy
end
