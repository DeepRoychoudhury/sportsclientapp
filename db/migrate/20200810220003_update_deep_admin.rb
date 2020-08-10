class UpdateDeepAdmin < ActiveRecord::Migration[6.0]
  def change
  	@u = User.find_by( email:'deeproydrc@gmail.com')
  	# if there is no user with the email admin@email.ie
  	# in the users table the above find_by() method will return nil
  	# nil shows there is no record in the table with that email
  	if @u != nil
  		@u.update_attribute :admin, true
  	end
  end
end
