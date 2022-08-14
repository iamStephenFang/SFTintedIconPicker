//
//  SFTintedIconPickerColors.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public struct SFTintedIconPickerColors {
    
    // MARK: - Picker Style
    
    /// The common tint color which is used for done buttons in navigation bar
    public var pickerTintColor = UIColor.systemBlue
    
    /// The background color to use for picker.
    public var pickerBackgroundColor = UIColor.systemGroupedBackground
    
    /// The text color to use for picker' s title.
    public var pickerTitleColor = UIColor.label
  
    // MARK: - Icon
    
    /// The foreground  color to use for icon.
    public var iconTintedColor: UIColor = UIColor.gray
    
    /// The background color to use for icon.
    public var iconBackgroundColor: UIColor = UIColor.secondarySystemBackground
    
    /// The background color to use for selected icon..
    public var iconAreaBackgroundColor = UIColor.systemBackground
    
    // MARK: - Color Picker
    
    /// Use this property to modify the default colors provided.
    public var providedColors : [SFTintedColor] = [SFTintedColor(useGradientColor: false, backgroundColor: .red),
                                                   SFTintedColor(useGradientColor: false, backgroundColor: .orange),
                                                   SFTintedColor(useGradientColor: false, backgroundColor: .yellow),
                                                   SFTintedColor(useGradientColor: false, backgroundColor: .green),
                                                   SFTintedColor(useGradientColor: false, backgroundColor: .cyan),
                                                   SFTintedColor(useGradientColor: false, backgroundColor: .blue),
                                                   SFTintedColor(useGradientColor: false, backgroundColor: .purple)]
    
    /// Use this property to modify the default colors provided.
    public var colorPickerAreaBackgroundColor = UIColor.systemBackground
    
    /// Use this property to modify the default colors provided.
    public var colorPickerSelectedCircleColor = UIColor.systemFill
    
    // MARK: - Search Bar
    
    /// The background color to use for search bar.
    public var searchBarBackgroundColor = UIColor.clear
    
    /// The text color to use for search bar' s placeholder.
    public var searchBarPlaceholderTextColor = UIColor.placeholderText
    
    // MARK: - Icon Picker
    
    /// The background color to use for selected icon..
    public var iconPickerSelectedTintedColor = UIColor.secondarySystemBackground
    
    /// The background color to use for selected icon..
    public var iconPickerSelectedBackgroundColor = UIColor.systemFill
    
    /// Use this property to modify the default colors provided.
    public var iconPickerAreaBackgroundColor = UIColor.systemBackground
    
    /// Use this property to modify the default colors provided.
    public var iconPickerSectionHeaderBackgroundColor = UIColor.clear
    
    /// Use this property to modify the default colors provided.
    public var iconPickerSectionHeaderTitleColor = UIColor.label
    
}
