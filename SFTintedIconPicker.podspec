Pod::Spec.new do |spec|

  spec.name         = "SFTintedIconPicker"
  spec.version      = "0.0.4"
  spec.summary      = "Shortcuts-like SF Symbols picker for iOS."
  spec.description  = "A Shortcuts-like and highly customizable SFSymbols picker written in Swift."

  spec.homepage     = "https://github.com/iamStephenFang/SFTintedIconPicker"
  spec.screenshots  = "http://image.stephenfang.me/SFTintedIconPickerDemo.png"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "iamStephenFang" => "Fangxuanmiao@hotmail.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.swift_versions = ['5.0']

  spec.source       = { :git => "https://github.com/iamStephenFang/SFTintedIconPicker.git", :tag => "#{spec.version}" }
  spec.source_files = "SFTintedIconPicker/**/*.{h,m,swift}"
  spec.resources    = ['SFTintedIconPicker/Resource/*']

end
