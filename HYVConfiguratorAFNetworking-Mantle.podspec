#
# Be sure to run `pod lib lint HYVConfiguratorAFNetworking-Mantle.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HYVConfiguratorAFNetworking-Mantle"
  s.version          = "0.4.1"
  s.summary          = "Configurator for using AFNetworking with Mantle"
  s.description      = <<-DESC
                       Configurator for using AFNetworking with Mantle

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/LilushFess/HYVConfiguratorAFNetworking-Mantle.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Gerasymenko Yevgen" => "fess2036@ya.ru" }
  s.source           = { :git => "https://github.com/LilushFess/HYVConfiguratorAFNetworking-Mantle.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
#  s.resource_bundles = {
#    'HYVConfiguratorAFNetworking-Mantle' => ['Pod/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'Mantle', '~> 1.5.3'
    s.dependency 'AFNetworking', '~> 2.5.0'
end
