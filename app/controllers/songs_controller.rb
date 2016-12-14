class SongsController < ApplicationController

  before_action :set_artist, only: [:new, :create]
  
  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      @errors = @song.errors.full_messages
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end
  
  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def song_params
      params.require(:song).permit(:title)
    end
end
