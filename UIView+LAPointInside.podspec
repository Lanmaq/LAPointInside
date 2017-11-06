
Pod::Spec.new do |s|

  s.name         = "UIView+LAPointInside"
  s.version      = "1.0.0"
  s.summary      = "Expand UIView respond event area."
  s.description  = <<-DESC
  				         Expand UIView respond event area, use UIView pointInside:withEvent: method.
                   DESC

  s.homepage     = "https://github.com/Lanmaq/LAPointInside"
 
  s.license      = "MIT"

  s.author             = { "Lanmaq" => "lanmaqmay66@gmail.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/Lanmaq/LAPointInside.git", :tag => "1.0.0" }
  s.source_files  = "LAPointInside/UIView+LAPointInside", "*.{h,m}"
 
  s.public_header_files = "LAPointInside/UIView+LAPointInside/*.h"

  s.frameworks = "UIKit"

  s.requires_arc = true

end
