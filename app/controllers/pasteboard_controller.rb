class PasteboardController < ApplicationController
  after_action :allow_iframe, only: :home
  def home
  end

  def about
  end

  def contact
  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
