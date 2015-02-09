include WaveFile

class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all

    puts "+"*80
    puts "Parametros são válidos"
    puts params[:"Heitor_6a"]
    formation_audio = params
    puts formation_audio.key("4")

    if params[:"Heitor_6a"] != nil
    files_to_append = ["/var/www/html/"+formation_audio.key("1")+".wav", 
      "/var/www/html/"+formation_audio.key("2")+".wav", "/var/www/html/"+
      formation_audio.key("3")+".wav", "/var/www/html/"+formation_audio.key("4")+".wav"]
    samples_per_buffer = 4096
    
    File.open('/var/www/html/report.txt', 'a+') { |file| file.write("\n"+Time.now.day.to_s+'-'+Time.now.month.to_s+'-'+Time.now.year.to_s+'_'+Time.now.hour.to_s+':'+Time.now.min.to_s+':'+Time.now.sec.to_s+" - \t"+formation_audio.key("1")+', '+formation_audio.key("2")+', '+formation_audio.key("3")+', '+formation_audio.key("4")) }    

    Writer.new("/var/www/html/audioHeitor.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
      files_to_append.each do |file_name|
        Reader.new(file_name).each_buffer(samples_per_buffer) do |buffer|
          writer.write(buffer)
        end
      end
    end
    end

    puts params[:"Cseko_1a"]
    if formation_audio[:"Cseko_1a"] != nil
      files_to_append = ["/var/www/html/"+formation_audio.key("1")+".wav", 
        "/var/www/html/"+formation_audio.key("2")+".wav", "/var/www/html/"+
        formation_audio.key("3")+".wav", "/var/www/html/"+formation_audio.key("4")+".wav"]
      samples_per_buffer = 4096

       File.open('/var/www/html/report.txt', 'a+') { |file| file.write("\n"+Time.now.day.to_s+'-'+Time.now.month.to_s+'-'+Time.now.year.to_s+'_'+Time.now.hour.to_s+':'+Time.now.min.to_s+':'+Time.now.sec.to_s+" - \t"+formation_audio.key("1")+', '+formation_audio.key("2")+', '+formation_audio.key("3")+', '+formation_audio.key("4")) }
      puts files_to_append

      Writer.new("/var/www/html/audioCseko.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
        files_to_append.each do |file_name|
          Reader.new(file_name).each_buffer(samples_per_buffer) do |buffer|
            writer.write(buffer)
          end
        end
      end
    end

    puts params[:"Seincman_4a"]
    if formation_audio[:"Seincman_4a"] != nil
      files_to_append = ["/var/www/html/"+formation_audio.key("1")+".wav", 
        "/var/www/html/"+formation_audio.key("2")+".wav", "/var/www/html/"+
        formation_audio.key("3")+".wav", "/var/www/html/"+formation_audio.key("4")+".wav"]
      samples_per_buffer = 4096

       File.open('/var/www/html/report.txt', 'a+') { |file| file.write("\n"+Time.now.day.to_s+'-'+Time.now.month.to_s+'-'+Time.now.year.to_s+'_'+Time.now.hour.to_s+':'+Time.now.min.to_s+':'+Time.now.sec.to_s+" - \t"+formation_audio.key("1")+', '+formation_audio.key("2")+', '+formation_audio.key("3")+', '+formation_audio.key("4")) }
      puts files_to_append

      Writer.new("/var/www/html/audioSeincman.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
        files_to_append.each do |file_name|
          Reader.new(file_name).each_buffer(samples_per_buffer) do |buffer|
            writer.write(buffer)
          end
        end
      end
    end

    puts params[:"Zampronha_5a"]
    if formation_audio[:"Zampronha_5a"] != nil
      files_to_append = ["/var/www/html/"+formation_audio.key("1")+".wav", 
        "/var/www/html/"+formation_audio.key("2")+".wav", "/var/www/html/"+
        formation_audio.key("3")+".wav", "/var/www/html/"+formation_audio.key("4")+".wav"]
      samples_per_buffer = 4096

       File.open('/var/www/html/report.txt', 'a+') { |file| file.write("\n"+Time.now.day.to_s+'-'+Time.now.month.to_s+'-'+Time.now.year.to_s+'_'+Time.now.hour.to_s+':'+Time.now.min.to_s+':'+Time.now.sec.to_s+" - \t"+formation_audio.key("1")+', '+formation_audio.key("2")+', '+formation_audio.key("3")+', '+formation_audio.key("4")) }
      puts files_to_append

      Writer.new("/var/www/html/audioZampronha.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
        files_to_append.each do |file_name|
          Reader.new(file_name).each_buffer(samples_per_buffer) do |buffer|
            writer.write(buffer)
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
    if @friend == Friend.all[0]
      send_file '/var/www/html/audioHeitor.wav', :type=>"application/wav", :x_sendfile=>true  
    end
    if @friend == Friend.all[4]
      send_file '/var/www/html/audioCseko.wav', :type=>"application/wav", :x_sendfile=>true  
    end
    if @friend == Friend.all[8]
      send_file '/var/www/html/audioSeincman.wav', :type=>"application/wav", :x_sendfile=>true  
    end
    if @friend == Friend.all[12]
      send_file '/var/www/html/audioZampronha.wav', :type=>"application/wav", :x_sendfile=>true  
    end
    
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

  helper_method :download
  def download

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
