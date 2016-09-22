class ApplicationController < ActionController::Base
  #Functions for the application controller.
  protect_from_forgery with: :exception
  #Include SessionHelpers. Allows helpers to be executed.
  include SessionsHelper
end
