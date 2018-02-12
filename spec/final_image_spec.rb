require 'spec_helper'

describe ImgOverlay::FinalImage do

  describe "#command" do

    context "given the orignal image path and the overlay image path" do

      let (:orignal_image_path) {
        "orignal_image.png"
      }

      let (:overlay_image_path) {
        "overlay_image.png"
      }

      let (:final_image_path) {
        "final_image.jpg"
      }

      it "makes the final command to overlay the images" do
        fm = ImgOverlay::FinalImage.new(
          orignal_image_path: orignal_image_path, 
          overlay_image_path: overlay_image_path, 
          final_image_path: final_image_path
        )
        expect(fm.command).to eq("composite -gravity Center #{overlay_image_path} #{orignal_image_path} #{final_image_path}")
      end

    end

  end

end