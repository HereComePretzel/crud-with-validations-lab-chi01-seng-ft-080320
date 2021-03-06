class SongsController < ApplicationController

    def index
        @songs = Song.all 
    end 

    def show
        @song = Song.find(params[:id])
    end 

    def new
        @song = Song.new
    end 

    def create
        @song = Song.new(song_params)
        if @song.save
        redirect_to song_path(@song)
        else
            flash[:errors] = @song.errors.full_messages
            redirect_to new_song_path
        end  
            

    end 

    private
    
    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 
end
