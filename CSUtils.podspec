#
# Be sure to run `pod lib lint CSUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CSUtils'
  s.version          = '1.1.5'
  s.summary          = 'Utils framework for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/salllgado@hotmail.com.br/CSUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'salllgado@hotmail.com.br' => 'Chrystian Salgado' }
  s.source           = { :git => 'https://github.com/salllgado@hotmail.com.br/CSUtils.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/salllgadin'

  s.ios.deployment_target = '10.0'

  s.source_files = 'CSUtils/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CSUtils' => ['CSUtils/Assets/*.png']
  # }

  s.dependency 'TPKeyboardAvoiding'
  s.dependency 'IBLocalizable'
end
