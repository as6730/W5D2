# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :user_id, presence: true

  has_many :subs # how can a post have many subs and a sub many posts??
  
  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
end
