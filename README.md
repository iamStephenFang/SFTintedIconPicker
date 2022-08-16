## SFTintedIconPicker

SFTintedIconPicker is a Shortcuts-like and highly customizable SFSymbol picker written in Swift.

<img src="http://image.stephenfang.me/SFTintedIconPickerDemo.png" width="30%">

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

<!-- #### Using [Swift Package Manager](https://swift.org/package-manager/)

Open SPM dependency manager through `File > Swift Pakcages > Add Package Dependency...`.

and insert repository URL:

`https://github.com/iamStephenFang/SFTintedIconPicker.git`

To add dependency in your own package, just specify a package in dependencies of your `Package.swift`:

```swift
.package(
name: "SFTintedIconPicker",
url: "https://github.com/iamStephenFang/SFTintedIconPicker.git",
.upToNextMajor(from: "1.0.0")
)
``` -->

Note: This has a minimum target iOS version of `13.0`.

## Configuration

All the configuration endpoints are in the `SFTintedIconPickerConfiguration` struct.

```swift
var config = SFTintedIconPickerConfiguration()
// [Edit configuration here ...]
// Build a picker with your configuration
let picker = SFTintedIconPicker(configuration: config)
```

### Colors

```swift
config.colors.pickerTintColor = UIColor.systemBlue
config.colors.pickerBackgroundColor = UIColor.systemGroupedBackground
config.colors.pickerTitleColor = UIColor.label

config.colors.iconAreaBackgroundColor = UIColor.systemBackground

config.colors.colorPickerAreaBackgroundColor = UIColor.systemBackground
config.colors.colorPickerSelectedBorderColor = UIColor.systemFill

config.colors.searchBarBackgroundColor = UIColor.clear
config.colors.searchBarPlaceholderTextColor = UIColor.placeholderText

config.colors.iconPickerCellTintedColor = UIColor.gray
config.colors.iconPickerCellSelectedBackgroundColor = UIColor.systemFill
config.colors.iconPickerAreaBackgroundColor = UIColor.systemBackground
```

### Titles

Rewrite the key value of the strings in the `Bundle.main` localization file can override the translation provided.

```swift
config.titles.navigationTitle = localizedStringInSFTintedIconPicker("SFTintedIconPickerNavigationTitle")
config.titles.navigationFinishTitle = localizedStringInSFTintedIconPicker("SFTintedIconPickerDone")
config.titles.searchBarPlaceHolder = localizedStringInSFTintedIconPicker("SFTintedIconPickerSearchBarPlaceHolder")
```

### Provided Colors

Both solid color and gradient colours are supported.

```swift
config.demoIconConfig = [SFTintedColor(backgroundColor: .red),
                        SFTintedColor(backgroundColor: .orange),
                        SFTintedColor(backgroundColor: .yellow),
                        SFTintedColor(backgroundColor: .green),
                        SFTintedColor(backgroundColor: .cyan),
                        SFTintedColor(backgroundColor: .blue),
                        SFTintedColor(backgroundGradientColors: [.black, .purple])]
```

### Component Configuration

```swift
config.demoIconConfig.topMargin = CGFloat(16)
config.demoIconConfig.horizontalMargin = CGFloat(16)
config.demoIconConfig.verticalPadding = CGFloat(17)
config.demoIconConfig.iconSize = CGFloat(61)
config.demoIconConfig.cornerRadius = CGFloat(10)

config.colorPickerConfig.topMargin = CGFloat(16)
config.colorPickerConfig.horizontalMargin = CGFloat(16)
config.colorPickerConfig.verticalPadding = CGFloat(16)
config.colorPickerConfig.horizontalPadding = CGFloat(16)
config.colorPickerConfig.lineSpacing = CGFloat(7)
config.colorPickerConfig.interitemSpacing = CGFloat(2)
config.colorPickerConfig.numberOfItemsInRow = Int(6)
config.colorPickerConfig.selectedBorderWidth = CGFloat(2)
config.colorPickerConfig.innerColorSizeRatio = CGFloat(0.7)
config.colorPickerConfig.cornerRadius = CGFloat(10)

config.iconPickerConfig.topMargin = CGFloat(16)
config.iconPickerConfig.bottomMargin = CGFloat(16)
config.iconPickerConfig.horizontalMargin = CGFloat(16)
config.iconPickerConfig.cornerRadius = CGFloat(10)
config.iconPickerConfig.searchBarTopPadding = CGFloat(14)
config.iconPickerConfig.searchBarHorizontalPadding = CGFloat(12)
config.iconPickerConfig.searchBarHeight = CGFloat(33)
config.iconPickerConfig.topPadding = CGFloat(20)
config.iconPickerConfig.bottomPadding = CGFloat(20)
config.iconPickerConfig.horizontalPadding = CGFloat(14)
config.iconPickerConfig.lineSpacing = CGFloat(22)
config.iconPickerConfig.interitemSpacing = CGFloat(15)
config.iconPickerConfig.numberOfItemsInRow = Int(6)
config.iconPickerConfig.cellCornerRadius = CGFloat(7)
```

## Usage

1. `import SFTintedIconPicker`.
2. Set up `didFinishPicking` callback to handle the `SFTintedItem` struct.
3. Present the picker

### UIImageView with UIColor & SFSymbols

```swift
let config = SFTintedIconPickerConfiguration()
let picker = SFTintedIconPicker(configuration:config)
picker.didFinishPicking { [self, unowned picker] item, cancelled in
    if cancelled {
        picker.dismiss(animated: true, completion: nil)
        return
    }

    if let item = item {
        self.imageView.backgroundColor = item.itemColor.backgroundColor
        self.imageView.image = UIImage(systemName: item.itemSymbol, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        picker.dismiss(animated: true, completion: nil)
    }
}
present(picker, animated: true, completion: nil)
```

### SFTintedIcon with SFTintedItem

```swift
var currentItem = SFTintedItem()

var config = SFTintedIconPickerConfiguration()
config.selectedItem = currentItem

let picker = SFTintedIconPicker(configuration:config)
picker.didFinishPicking { [self, unowned picker] item, cancelled in
    if cancelled {
        picker.dismiss(animated: true, completion: nil)
        return
    }

    if let item = item {
        self.currentItem = item
        self.iconView.refreshWithItem(item)
        picker.dismiss(animated: true, completion: nil)
    }
}
present(picker, animated: true, completion: nil)
```

## Roadmap

- Swift Package Manager
- SF Symbols Categories
- SF Symbols Localization
- Objective-C Support
- Cross-platform

## License

SFTintedIconPicker is released under the MIT license.  
See [LICENSE](LICENSE) for details.
