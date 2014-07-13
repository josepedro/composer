class Friend < ActiveRecord::Base
  validates :name, presence: true
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :url => "/assets/products/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  def image_stl
  	puts "a"*100
  	image_path = "public/assets/products/" + Friend.last.id.to_s + "/original/_.jpg"
    converter_stl = Convert_STL.new(image_path)
  	puts "a"*100
  end


end
