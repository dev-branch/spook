# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  country    :string           not null
#  photo      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ApplicationRecord
  has_and_belongs_to_many :cruises
  validates :name, :country, :photo, presence: true
  validates :name, uniqueness: true
end
