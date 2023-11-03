Pod::Spec.new do |s|

  s.name         = "RACObjC_UI"
  s.version      = "3.3.0"
  s.summary      = "The 2.x ReactiveCocoa Objective-C API: Streams of values over time"

  s.description  = <<-DESC.strip_heredoc
                     ReactiveObjC (formally ReactiveCocoa or RAC) is an Objective-C
                     framework inspired by [Functional Reactive Programming](
                     http://en.wikipedia.org/wiki/Functional_reactive_programming).
                     It provides APIs for composing and **transforming streams of values**.
                   DESC

  s.homepage     = "https://github.com/sdkdimon/RACObjC-UI"
  s.license      = { type: "MIT", file: "LICENSE" }

  s.documentation_url  = "https://github.com/sdkdimon/RACObjC/tree/master/Documentation#readme"

  s.author             = "Dmitry Lizin"
 
  s.source = { git: "https://github.com/sdkdimon/RACObjC-UI.git", tag: s.version }
  
  s.module_map = 'UI/RACObjC-UI/RACObjC-UI.modulemap'
  
  s.ios.deployment_target  = "12.0"
  s.osx.deployment_target  = "10.13"
  s.tvos.deployment_target = "12.0"
    
  s.dependency 'RACObjC', '~> 3.3'
    
  s.source_files       = "UI/RACObjC-UI/Classes/**/*.{h,m}",
                            "UI/RACObjC-UI/RACObjC_UI.h"
    
  s.ios.exclude_files  = "UI/RACObjC-UI/Classes/**/*{AppKit,NSControl,NSText}*"

  s.osx.exclude_files  = "UI/RACObjC-UI/Classes/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,"\
                          "UIButton,UICollectionReusableView,UIControl,UIDatePicker,"\
                          "UIGestureRecognizer,UIImagePicker,UIRefreshControl,"\
                          "UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,"\
                          "UITableViewHeaderFooterView,UIText,MK}*"

  s.tvos.exclude_files  = "UI/RACObjC-UI/Classes/**/*{AppKit,NSControl,NSText,NSTable,UIActionSheet,"\
                          "UIAlertView,UIDatePicker,UIImagePicker,UIRefreshControl,UISlider,"\
                          "UIStepper,UISwitch,MK}*"
  s.requires_arc = true

  s.frameworks   = "Foundation"
end
