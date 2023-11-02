workspace 'RACObjC-UI.xcworkspace'

use_frameworks!

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'RACObjC-UI-iOS' do
  project 'UI/RACObjC-UI.xcodeproj'
  platform :ios, '12.0'
  pod 'RACObjC', '~> 3.3'
end

target 'RACObjC-UI-AppKit' do
  project 'UI/RACObjC-UI.xcodeproj'
  platform :osx, '10.15'
  pod 'RACObjC', '~> 3.3'
end

target 'RACObjC-UI-iOSTests' do
    project 'UI/RACObjC-UI.xcodeproj'
    platform :ios, '12.0'
    test_pods
end

target 'RACObjC-UI-AppKitTests' do
    project 'UI/RACObjC-UI.xcodeproj'
    platform :osx, '10.15'
    test_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '$(inherited)'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '$(inherited)'
      config.build_settings['TVOS_DEPLOYMENT_TARGET'] = '$(inherited)'
      config.build_settings['WATCHOS_DEPLOYMENT_TARGET'] = '$(inherited)'
    end
  end
end
