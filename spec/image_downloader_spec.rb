require 'spec_helper'

describe ImgOverlay::ImageDownloader do

  describe "#download!" do

    let (:test_file_path) {
      File.join(FOLDER_FOR_TESTING_FILES, 'test.jpg')
    }

    let (:google_image_url) {
      "http://via.placeholder.com/1x1"
    }

    let (:url_is_not_of_an_image) {
      "https://stackoverflow.com/questions"
    }

    let (:non_existant_image_url) {
      "http://localhost:9889/1x1"
    }

    before(:each) do
      if File.file?(test_file_path)
        FileUtils.rm(test_file_path)
      end
    end

    context "given a URL to a valid image" do
      it "returns true and saves the image to the given path" do
        id = ImgOverlay::ImageDownloader.new(
          url: google_image_url,
          path: test_file_path
        )
        expect(id.download!).to be true
        expect(File.file?(test_file_path)).to be true
      end
    end

    context "given a URL of an invalid image" do
      it "returns false" do
        id = ImgOverlay::ImageDownloader.new(
          url: non_existant_image_url, 
          path: test_file_path
        )
        expect(id.download!).to be false
        expect(File.file?(test_file_path)).to be false
      end
    end

    context "URL is valid but not an image" do
      it "returns false" do
        id = ImgOverlay::ImageDownloader.new(
          url: url_is_not_of_an_image, 
          path: test_file_path
        )
        expect(id.download!).to be false
        expect(File.file?(test_file_path)).to be false
      end
    end

  end

end