class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_filter :allow_iframe

  def index

  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
