include WaveFile

class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
    string_comparator = ""
    
    @friends.each do |friend|
      string_comparator = string_comparator + friend.name
    end

    puts "+"*80
            puts "Parametros são válidos"

    if params[:first] != nil && params[:second] != nil && params[:third] != nil && params[:fourth] != nil
      if string_comparator.include? params[:first]
        if string_comparator.include? params[:second]
          if string_comparator.include? params[:third]
            if string_comparator.include? params[:fourth]
              puts "+"*80
              puts "Parametros são válidos"
              
              files_to_append = ["/var/www/"+params[:first]+".wav", "/var/www/"+params[:second]+".wav", "/var/www/"+params[:third]+".wav", "/var/www/"+params[:fourth]+".wav"]
              samples_per_buffer = 4096

              Writer.new("/var/www/audio.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
                files_to_append.each do |file_name|
                  Reader.new(file_name).each_buffer(samples_per_buffer) do |buffer|
                    writer.write(buffer)
                  end
                end
              end
            end
          end
        end
      end
    end

  end

  # GET /friends/1
  # GET /friends/1.json
  def show

  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
    image_id = @friend.id.to_s

  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)
    puts "+"*100
    puts @friend.songurl
    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Imagem adicionada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @friend }
      else
        format.html { render action: 'new' }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Imagem atualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end

  helper_method :download_stl
  def download_stl
    puts "Deu certo esse carai"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:avatar, :name, :songurl)
    end
end
