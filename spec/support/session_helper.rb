module SessionHelper
   def sign_in(user = double_instance(:user))
     if user.nil?
       allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
       allow(controller).to receive(:current_user).and_return(nil)
     else
       allow(request.env['warden']).to receive(:authenticate!).and_return(user)
       allow(controller).to receive(:current_user).and_return(user)
     end
   end
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :controller
  config.include SessionHelper, type: :controller
end
