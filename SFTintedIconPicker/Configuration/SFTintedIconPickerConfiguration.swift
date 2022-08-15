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
    
    /// iOS 14 +
    public var showSystemColorPicker = true
    
    /// iOS 14 +
    public var selectedItem = SFTintedItem()
    
    /// Use this property to modify the default colors provided.
    public var colors = SFTintedIconPickerColors()
    
    /// Use this property to modify the default sizes provided.
    public var sizes = SFTintedIconPickerSizes()
    
    /// Use this property to modify the default sizes provided.
    public var layoutInfos = SFTintedIconPickerLayoutInfo()
    
    /// Use this property to modify the default sizes provided.
    public var titles = SFTintedIconPickerTitle()
}
