class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	render html: "Sample application under construction"
  end
end
