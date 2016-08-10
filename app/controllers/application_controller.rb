class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
    render html: "This is the first step for the website!"
  end
  
  def goodbye
    render html: "Goodbye AmiGo¡"
  end
end
