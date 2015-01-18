require 'wavefile'
include WaveFile

FILES_TO_APPEND = ["/var/www/C.wav", "/var/www/C.wav", "/var/www/C.wav"]
SAMPLES_PER_BUFFER = 4096

Writer.new("append.wav", Format.new(:stereo, :pcm_16, 44100)) do |writer|
  FILES_TO_APPEND.each do |file_name|
    Reader.new(file_name).each_buffer(SAMPLES_PER_BUFFER) do |buffer|
      writer.write(buffer)
    end
  end
end