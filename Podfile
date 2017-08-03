# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FireBaseDemoAplication' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FireBaseDemoAplication
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Alamofire', '~> 4.4'
  pod 'ObjectMapper', '~> 2.2'
  pod 'AlamofireObjectMapper', '~> 4.0'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

end
