# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :description, :moderator_id, presence: true
  validates :name, presence: true, uniqueness: true

  has_many :posts # how can a post have many subs and a sub many posts??
  belongs_to :moderator,
    class_name: :User,
    foreign_key: :moderator_id,
    primary_key: :id
end
