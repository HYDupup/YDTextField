Pod::Spec.new do |s|
  
  s.name         = "YDTextField"
  s.version      = "0.0.1"
  s.summary      = "A library for collection device info."
  s.homepage     = "https://github.com/HYDupup/YDTextField"
  s.license      = "MIT"
  s.author             = { "Huangupup" => "757345969@qq.com" }
  s.source       = { :git => "https://github.com/HYDupup/YDTextField.git", :tag => "0.0.1" }
  s.requires_arc = true
  s.ios.deployment_target = "7.0"
  s.source_files  = "YDTextField/*.{h,m}"
end