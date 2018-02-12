require "open-uri"

module ImgOverlay
  
  class ImageDownloader

    def initialize(url:, path:)
      @image_url = url
      @full_file_path = path
    end

    def download!
      open_uri_file_object = get_file_object
      if open_uri_file_object.nil?
        return false
      else
        if file_acceptable?(open_uri_file_object)
          save_file open_uri_file_object
          return true
        else
          return false
        end
      end
    end

    private

    def save_file open_uri_file_object
      File.open(@full_file_path, 'wb') do |fo|
        fo.write open_uri_file_object.read 
      end
    end

    def get_file_object
      begin
        return open(@image_url)
      rescue
        return nil
      end
    end

    def file_acceptable?(open_uri_file_object)
      if open_uri_file_object.status[0] == "200" && accepted_mime_types.include?(open_uri_file_object.content_type)
        return true
      else
        return false
      end
    end

    def accepted_mime_types
      ['image/gif', 'image/jpeg', 'image/png']
    end

  end

end