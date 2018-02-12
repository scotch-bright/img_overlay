module ImgOverlay
  
  class FinalImage

    def initialize(orignal_image_path:, overlay_image_path:, final_image_path:)
      @orignal_image_path = orignal_image_path
      @overlay_image_path = overlay_image_path
      @final_image_path = final_image_path
    end

    def command
      "composite -gravity Center #{@overlay_image_path} #{@orignal_image_path} #{@final_image_path}"
    end

    def generate!
      #puts "about to run command:: #{command}"
      `#{command}`
    end

  end

end
