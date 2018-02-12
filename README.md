# ImgOverlay

This is a simple gem that gives you your image back overlay-ed with some color.

## What is the point of this gem?

Well, I originally created it because I wanted a fast way to turn image URLs into hero images to use on web-pages. Hero images, have some text on them usually. So that they text is readable, they need to be overlay-ed.

![](https://static.wixstatic.com/media/09e926b98b2149c7ba461062b8a64f47.jpg)

See how the title "The smartest way to manage your data" is on some image that is overlay-ed with a purple color that goes with the sites branding? Thats what this gem does.

## Dependencies

The gem depends on ImageMagic to be installed on your computer. It just shells out and runs ImageMagic commands.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'img_overlay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install img_overlay

## Usage

Add the gem to your gem file or install it via the command line as shown in the installation section.

To use this, you just have to specify all the info in the form of a hash. There are 3 hashes that are needed:

1. **Input Hash**: This can have the URL of the image / file path of the image
2. **Color Hash**: The RGB values of the color for the overlay & the opacity of the overlay layer
3. **Output Hash**: A location where the final output image needs to be stored

### Example

```ruby
success = make_image_with_overlay(
    input: {
      url: "http://craftypioneer.com/wp-content/uploads/2016/01/businessMeeting.jpg" 
    },
    color: {
        r: 0,
        g: 0,
        b: 0,
        opacity: 0.6
    },
    output: {
       path: '/Users/khojbadami/test.jpg'
    }
)
```

That's it. It all works, you will get a true or a false.

## Testing

This gem needs more tests and development around validating user input and giving helpful error messages. Just now, it will simply fail. It needs better feedback for users when the inputs are not right. It also needs better error messages when the inputs are funny.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

