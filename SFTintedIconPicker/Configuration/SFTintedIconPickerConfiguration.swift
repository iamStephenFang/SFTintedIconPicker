//
//  SFTintedIconConfiguration.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit

internal var SFTintedConfig: SFTintedIconPickerConfiguration { return SFTintedIconPickerConfiguration.shared }

public struct SFTintedIconPickerConfiguration {
    
    public static var shared: SFTintedIconPickerConfiguration = SFTintedIconPickerConfiguration()
    
    public init() {}
    
    /// Show native color picker if needed. (iOS 14 +)
    public var showSystemColorPicker = true
    
    /// Show color selection area
    public var isColorSelectionEnabled: Bool = true
    
    /// If don't want to have logs from picker, set it to false.
    public var isDebugLogsEnabled: Bool = true
    
    /// Pre-select item if needed.
    public var selectedItem = SFTintedItem()
    
    /// Use these properties to modify the default colors provided.
    public var colors = SFTintedIconPickerColors()
    
    /// Use these properties to modify the default titles provided.
    public var titles = SFTintedIconPickerTitle()
    
    /// Use this property to modify the colors provided for color picker.
    public var providedColors : [SFTintedColor] = [SFTintedColor(backgroundColor: .red),
                                                   SFTintedColor(backgroundColor: .orange),
                                                   SFTintedColor(backgroundColor: .yellow),
                                                   SFTintedColor(backgroundColor: .green),
                                                   SFTintedColor(backgroundColor: .cyan),
                                                   SFTintedColor(backgroundColor: .blue),
                                                   SFTintedColor(backgroundColor: .purple)]
    
    /// Use these properties  to modify the configurations of demo icon.
    public var demoIconConfig = SFDemoIconConfiguration()
    
    /// Use these properties  to modify the configurations of color picker.
    public var colorPickerConfig = SFColorPickerConfiguration()
    
    /// Use these properties  to modify the configurations of icon picker.
    public var iconPickerConfig = SFIconPickerConfiguration()
    
}
