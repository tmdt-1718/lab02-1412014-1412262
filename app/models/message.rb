class Message < ApplicationRecord
	has_one :rmessage
	has_one :smessage
end
