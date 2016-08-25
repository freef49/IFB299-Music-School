class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
    render html: "This is the first step for the website! Building to test GitHub! Mistakes will be made!"
  end
end
