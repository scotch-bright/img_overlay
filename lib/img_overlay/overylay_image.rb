module ImgOverlay
  
  class OverylayImage

    def initialize(width:, height:, color_r:, color_g:, color_b:, opacity:, output_path:)
      @width = width
      @height = height
      @color_r = color_r
      @color_g = color_g
      @color_b = color_b
      @opacity = opacity
      @output_path = output_path
    end

    def command
      "convert -size #{@width}x#{@height} canvas:rgba\\(#{@color_r},#{@color_g},#{@color_b},#{@opacity}\\) #{@output_path}"
    end

    def generate!
      #puts "about to run command:: #{command}"
      `#{command}`
    end

  end

end
