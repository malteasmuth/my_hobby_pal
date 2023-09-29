class Profil < ActiveRecord::Base
  belongs_to :user

  has_many :interests
  accepts_nested_attributes_for :interests
end
