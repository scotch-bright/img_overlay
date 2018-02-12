require 'spec_helper'

describe ImgOverlay::ImageSize do

  describe "#width & #height" do

    context "given a path to a valid image" do
      it "returns width & height with correct sizes" do
        file_path = File.join(FOLDER_FOR_TESTING_FILES, "ruby.jpg")
        image_size_getter = ImgOverlay::ImageSize.new(file_path)
        expect(image_size_getter.width).to eq(800)
        expect(image_size_getter.height).to eq(736)
      end
    end

    context "given a path to an in-valid image" do
      it "returns a nil object" do
        file_path = File.join(FOLDER_FOR_TESTING_FILES, "python.jpg")
        image_size_getter = ImgOverlay::ImageSize.new(file_path)
        expect(image_size_getter.width).to be_nil
        expect(image_size_getter.height).to be_nil
      end
    end

  end

end