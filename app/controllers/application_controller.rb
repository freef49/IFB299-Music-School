class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
    render html: "Hello, peoples of france!"
  end
  
  def goodbye
    render html: "Goodbye AmiGo¡"
  end
end
