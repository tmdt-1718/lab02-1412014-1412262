class Rmessage < ApplicationRecord
	belongs_to :user

	scope :newest_order, lambda { order(created_at: :asc) }
end
