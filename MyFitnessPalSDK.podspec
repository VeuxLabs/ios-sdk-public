#
# Be sure to run `pod lib lint MyFitnessPalSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MyFitnessPalSDK"
  s.version          = "1.4.0"
  s.summary          = "The MyFitnessPal SDK for iOS."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       The MyFitnessPalSDK for iOS allows partners to authenticate
                       with MyFitnessPal and access MyFitnessPal APIs.
                       DESC

  s.homepage         = "https://github.com/myfitnesspal/ios-sdk-public"
  s.license          = 'Apache Version 2.0'
  s.author           = { "MyFitnessPal" => "api-group@myfitnesspal.com" }
  s.source           = { :git => "https://github.com/myfitnesspal/ios-sdk-public.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MyFitnessPalSDK/**/*'
  s.resource_bundles = {
    'MyFitnessPalSDK' => ['MyFitnessPalSDK/Assets/*.png']
  }

  s.public_header_files = 'MyFitnessPalSDK/**/*.h'

end