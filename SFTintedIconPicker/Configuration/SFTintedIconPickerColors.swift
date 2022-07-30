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
    public var pickerTintColor = UIColor.systemBackground
    
    /// The background color to use for picker.
    public var pickerBackgroundColor = UIColor.systemBackground
    
    /// The text color to use for picker' s title.
    public var pickerTitleColor = UIColor.label
    
    /// The background color to use for search bar.
    public var searchBarBackgroundColor = UIColor.secondarySystemBackground
    
    /// The text color to use for search bar' s placeholder.
    public var searchBarPlaceholderTextColor = UIColor.placeholderText
  
    // MARK: - Icon
    
    /// The foreground  color to use for icon.
    public var iconTintedColor: UIColor = UIColor.secondarySystemBackground
    
    /// The background color to use for icon.
    public var iconBackgroundColor: UIColor = UIColor.secondarySystemBackground
    
    /// The background color to use for selected icon..
    public var iconAreaBackgroundColor = UIColor.secondarySystemBackground
    
    // MARK: - Color Picker
    
    /// Use this property to modify the default colors provided.
    public var providedColors : [UIColor] = []
    
    /// Use this property to modify the default colors provided.
    public var providedGradientColors : [UIColor] = []
    
    /// Use this property to modify the default colors provided.
    public var colorPickerAreaBackgroundColor = UIColor.clear
    
    /// Use this property to modify the default colors provided.
    public var colorPickerSelectedCircleColor = UIColor.clear
    
    // MARK: - Icon Picker
    
    /// The background color to use for selected icon..
    public var iconPickerSelectedTintedColor = UIColor.secondarySystemBackground
    
    /// The background color to use for selected icon..
    public var iconPickerSelectedBackgroundColor = UIColor.secondarySystemBackground
    
    /// Use this property to modify the default colors provided.
    public var iconPickerAreaBackgroundColor = UIColor.clear
    
    /// Use this property to modify the default colors provided.
    public var iconPickerSectionHeaderBackgroundColor = UIColor.clear
    
    /// Use this property to modify the default colors provided.
    public var iconPickerSectionHeaderTitleColor = UIColor.label
    
}
