require 'spec_helper'

describe ImgOverlay::OverylayImage do

  describe "#command" do

    let (:output_file_path) {
      File.join(FOLDER_FOR_TESTING_FILES, "test_overlay.png")
    }

    context "given proper patameters of dimentions, color, opacity" do
      
      it "generates the right ImageMagic command" do

        oi = ImgOverlay::OverylayImage.new(
          width: 100,
          height: 100,
          color_r: 23,
          color_g: 12,
          color_b: 121,
          opacity: 0.5,
          output_path: output_file_path
        )
        expect(oi.command).to eq(
          'convert -size 100x100 canvas:rgba\(23,12,121,0.5\) ' + output_file_path
        )

      end

    end

  end

end