class Friend < ActiveRecord::Base
  validates :name, presence: true
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },:storage => :s3,:bucket  => ENV['aart'],:s3_credentials => {
                    :access_key_id => ENV['AKIAJACQKU6M4E3EARAQ'],
                    :secret_access_key => ENV['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']
                },
                :s3_permissions => 'private',
                :url => "aart.s3.amazonaws.com"

  def image_stl(image_id)
  	puts "a"*100
    puts image_id
  	image_path = "public/assets/products/" + image_id + "/original/image.jpg"
    puts image_path
    stl_path = "public/assets/products/" + image_id + "/original/image.stl"
    converter_stl = Convert_STL.new(image_path, stl_path)
  	puts "a"*100
  end


end
