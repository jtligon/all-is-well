class Client < ApplicationRecord
  has_one :user, as: :userable, dependent: :destroy
  has_many :contacts
  has_many :posts
  has_many :notes
  has_many :surveys
  belongs_to :therapist

  def has_recent_activity?
    (Survey.where(client_id: self.id, read: false).count + Post.where(client_id: self.id, read: false, sharable: true).count + Event.where(client_id: self.id, read: false).count) > 0 
  end
end
