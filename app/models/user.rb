class User < ApplicationRecord
  
  has_many :rmessages
  has_many :smessages
  has_many :relationship_requests
 	has_and_belongs_to_many(:users,
    :join_table => "user_connections",
    :foreign_key => "user_a_id",
    :association_foreign_key => "user_b_id")
	has_secure_password

		def self.authenticate!(session_params)
		user = User.authenticate(session_params)

		if user.nil?
			raise RecordNotFound
		else
			user
		end
	end

  def self.authenticate(session_params)
  	user = User.find_by(email: session_params[:email])
  
  	if user && user.authenticate(session_params[:password])
  		user
  	else
  		false
  	end
  end

  def self.authenticate?(session_params)
  	!User.authenticate(session_params).nil?
  end
end
