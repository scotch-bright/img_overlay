require 'tempfile'

module ImgOverlay

  class Helper

    class << self

      def get_input_image input_hash
        if is_image_url_given?(input_hash)
          get_image_path_from_url(input_hash[:url])
        else
          input_hash[:path]
        end
      end

      private

      def get_image_path_from_url(url)
        otuput = get_temp_file_path
        id = ImgOverlay::ImageDownloader.new(
          url: url,
          path: otuput  
        )
        if id.download!
          return otuput
        else
          return nil
        end
      end

      def get_temp_file_path
        temp_file = Tempfile.new('image')
        temp_file.path
      end

      def is_image_url_given? input_hash
        return false if input_hash[:url].nil?
        return true
      end

    end

  end

end