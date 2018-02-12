require 'open3'

module ImgOverlay
  
  class ImageSize

    def initialize(file_path)
      @file_path = file_path
    end

    def width
      @width ||= get_image_size_hash[:width]
    end

    def height
      @height ||= get_image_size_hash[:height]
    end

    private

    def get_image_size_hash
      @result ||= execute_command
      if @result[:success]
        convert_command_line_result_into_hash
      else
        invalid_image_path_hash
      end
    end

    def convert_command_line_result_into_hash
      output = @result[:output]
      width_str = output.split("x")[0]
      height_str = output.split("x")[1]
      {
        width: width_str.to_i,
        height: height_str.to_i
      }
    end

    def invalid_image_path_hash
      {
        width: nil,
        height: nil
      }
    end

    def execute_command
      stdout, stderr, status = Open3.capture3(commmand)
      return {
        success: status.success?,
        output: stdout,
        error: stderr
      }
    end

    def commmand
      "convert #{@file_path} -format \"%wx%h\" info:"
    end

  end

end
