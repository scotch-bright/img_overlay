require "img_overlay/version"
require "img_overlay/image_size"
require "img_overlay/image_downloader"
require "img_overlay/overylay_image"
require "img_overlay/final_image"
require "img_overlay/helper"

module ImgOverlay
  
  def make_image_with_overlay(input:, color:, output:)

    image_path = ImgOverlay::Helper.get_input_image(input)
    
    if image_path.nil?

      return false
    
    else
      
      # Get image size
      image_size = ImgOverlay::ImageSize.new(image_path)

      temp_overlay_image_path = File.join(Dir.pwd, 'overlay.png')

      # Generate overlay Image
      ImgOverlay::OverylayImage.new(
        width: image_size.width, 
        height: image_size.height, 
        color_r: color[:r],
        color_g: color[:g], 
        color_b: color[:b],
        opacity: color[:opacity],
        output_path: temp_overlay_image_path
      ).generate!

      # Make Final Image
      ImgOverlay::FinalImage.new(
        orignal_image_path: image_path, 
        overlay_image_path: temp_overlay_image_path,
        final_image_path: output[:path]
      ).generate!

      FileUtils.rm(temp_overlay_image_path)

      return true

    end
  end

end
