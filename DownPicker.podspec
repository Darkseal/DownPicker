#
# Be sure to run `pod lib lint DownPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DownPicker"
  s.version          = "0.1.34"
  s.summary          = "Lightweight class library for creating drop down list controls for iOS."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
DownPicker is an extremely light-weight class library for creating DropDownList / ComboBox controls for iOS that will behave like their HTML / Android counterparts.
You'll only need a standard UITextField and few lines of code.

DownPicker is basically a *control interface wrapper*, meaning that you won't use it as a control - it will use an existing UITextField control instead.
This is a good thing, because you'll be able to design, positioning and skin your UITextField like you always do, programmatically or inside a *Storyboard* UI, depending on how you are used to work. You won't change your style, as it will adapt to suit yours.

However, if you don't like the *control wrapper* pattern, you can just use it as a *custom control* using the included **UIDownPicker** class. It's entirely up to you (and very easy to install in both scenarios).

DownPicker is released under MIT License.
Installation instructions, examples and documentation are available in the included README.md file.
                       DESC

  s.homepage         = "https://github.com/Darkseal/DownPicker"
  s.screenshots     = "https://raw.githubusercontent.com/Darkseal/DownPicker/gh-pages/images/DownPicker/UITextField.DownPicker.png"
  s.license          = 'MIT'
  s.author           = { "Ryan" => "ryan@ryadel.com" }
  s.source           = { :git => "https://github.com/Darkseal/DownPicker.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ryadel_com'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.{h,m}'
  s.resource_bundles = {
    'DownPicker' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
