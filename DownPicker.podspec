#
# Be sure to run `pod lib lint DownPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DownPicker"
  s.version          = "0.1.23"
  s.summary          = "Lightweight class library for creating drop down list controls for iOS."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
DownPicker is an extremely light-weight class library for creating DropDownList / ComboBox controls for iOS that will behave like their HTML / Android counterparts.
You'll only need a standard UITextField and few lines of code.
                       DESC

  s.homepage         = "https://github.com/Darkseal/DownPicker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ryan" => "ryan@ryadel.com" }
  s.source           = { :git => "https://github.com/Darkseal/DownPicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/v2Dark'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'DownPicker/**/*.{h,m}'
  s.resource_bundles = {
    'DownPicker' => ['DownPicker/*.png']
  }

  s.public_header_files = 'DownPicker/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
