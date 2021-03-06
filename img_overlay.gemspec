# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'img_overlay/version'

Gem::Specification.new do |spec|
  spec.name          = "img_overlay"
  spec.version       = ImgOverlay::VERSION
  spec.authors       = ["Khoj Badami"]
  spec.email         = ["khoj.badami@gmail.com"]

  spec.summary       = "Simple gem to add an overlay on your image. Input: Image & Color. Output: Image with overlay!"
  spec.description   = "Given an image path/URL and a color in RGB, you get back an image with an overlay on it (with the given color)."
  spec.homepage      = "https://github.com/scotch-bright/img_overlay"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
