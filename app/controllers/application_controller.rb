class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
def index
    @taskss = tasks.all
  end
