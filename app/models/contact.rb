# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#

class Contact < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :email }
  validates :name, :email, :user_id, presence: true

  belongs_to :owner,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy

  has_many :contact_shares
  has_many :shared_users, through: :contact_shares
  has_many :comments, as: :target
end
