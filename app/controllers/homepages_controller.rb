class HomepagesController < ApplicationController

  def home
    @pictures = Picture.last(25)
  end

end