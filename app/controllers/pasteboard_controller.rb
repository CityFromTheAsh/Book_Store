class PasteboardController < ApplicationController
  after_action :allow_iframe, only: :home
  def home
    @video = Yt::Video.new id:  'XC-jnqGH-sI'
    Yt.configure do |config|
      config.log_level = :debug
    end
  end

  def about
  end

  def contact
  end

  private

  def allow_iframe
    response.headers.delete "X-Frame-Options"
  end
end
