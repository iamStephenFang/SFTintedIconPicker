## SFTintedIconPicker

SFTintedIconPicker is a Shortcuts-like and highly customizable SFSymbol picker written in Swift.


## Features
- Native Appearance
- Search Symbols
- Gradient Color Support
- Native Color Picker (iOS 14+)
And so much more...

## Installation

#### Using [CocoaPods](http://cocoapods.org/)

Add `pod 'SFTintedIconPicker'` to your `Podfile` and run `pod install`. Also add `use_frameworks!` to the `Podfile`.

```
target 'MyApp'
pod 'SFTintedIconPicker'
use_frameworks!
```

#### Using [Swift Package Manager](https://swift.org/package-manager/)

Open SPM dependency manager through `File > Swift Pakcages > Add Package Dependency...`.

and insert repository URL:

``https://github.com/iamStephenFang/SFTintedIconPicker.git``

To add dependency in your own package, just specify a package in dependencies of your `Package.swift`:
```swift
.package(
name: "SFTintedIconPicker",
url: "https://github.com/iamStephenFang/SFTintedIconPicker.git",
.upToNextMajor(from: "1.0.0")
)
```

Note: This has a minimum target iOS version of `13.0`.

## Configuration

All the configuration endpoints are in the ``SFTintedIconPickerConfiguration`` struct.

```swift
var config = SFTintedIconPickerConfiguration()
// [Edit configuration here ...]
// Build a picker with your configuration
let picker = SFTintedIconPicker(configuration: config)
```

### Colors
```swift
config.colors.pickerTintColor = UIColor.systemBlue
```

### Sizes
```swift
config.colors.pickerTintColor = UIColor.systemBlue
```

### LayoutInfos
```swift
config.colors.pickerTintColor = UIColor.systemBlue
```

### Titles 
```swift
config.colors.pickerTintColor = UIColor.systemBlue
```


## Usage

First things first `import SFTintedIconPicker`.  

The picker only has one callback `didFinishPicking` enabling you to handle all the cases. Let's see some typical use cases 🤓

### Single Photo
```swift
let picker = SFTintedIconPicker()
```


## Objective-C support
Objective-C support is on the roadmap.

## License
SFTintedIconPicker is released under the MIT license.  
See [LICENSE](LICENSE) for details.