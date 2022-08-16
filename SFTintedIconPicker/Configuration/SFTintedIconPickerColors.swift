//
//  SFTintedIconPickerColors.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public struct SFTintedIconPickerColors {
    
    // MARK: - Picker Style
    
    /// The tint color used for done buttons in navigation bar
    public var pickerTintColor = UIColor.systemBlue
    
    /// The background color of picker.
    public var pickerBackgroundColor = UIColor.systemGroupedBackground
    
    /// The text color of picker's title.
    public var pickerTitleColor = UIColor.label
  
    // MARK: - Icon
    
    /// The background color of top icon area.
    public var iconAreaBackgroundColor = UIColor.systemBackground
    
    // MARK: - Color Picker
    
    /// The background color of color picker area.
    public var colorPickerAreaBackgroundColor = UIColor.systemBackground
    
    /// The background color of color picker cell's border when selected.
    public var colorPickerSelectedBorderColor = UIColor.systemFill
    
    // MARK: - Search Bar
    
    /// The background color to use for search bar.
    public var searchBarBackgroundColor = UIColor.clear
    
    /// The text color to use for search bar's placeholder.
    public var searchBarPlaceholderTextColor = UIColor.placeholderText
    
    // MARK: - Icon Picker
    
    /// The tinted color to use for symbol in icon picker cell.
    public var iconPickerCellTintedColor: UIColor = UIColor.gray
    
    /// The background color to use for icon picker's cell when selected.
    public var iconPickerCellSelectedBackgroundColor = UIColor.systemFill
    
    /// The background color of icon picker area.
    public var iconPickerAreaBackgroundColor = UIColor.systemBackground
    
}
