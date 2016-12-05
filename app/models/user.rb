# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts
  has_many :contact_shares
  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact
  has_many :comments, as: :target
  has_many :authored_comments,
    foreign_key: :user_id,
    class_name: :Comment

end
