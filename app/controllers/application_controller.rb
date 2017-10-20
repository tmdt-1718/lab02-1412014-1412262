class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @activeleftmenuitem = 2
   include SessionsHelper
end
