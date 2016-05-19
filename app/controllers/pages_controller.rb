class PagesController < ApplicationController

  def home
    render 'video_bar.html.erb', layout: false
  end
end
