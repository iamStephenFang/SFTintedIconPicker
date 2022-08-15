//
//  SFIconPickerConfiguration.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/15.
//

import Foundation

public struct SFIconPickerConfiguration {
    
    /// The size which is used for icon
    public var topMargin = CGFloat(16)
    
    /// The size which is used for icon
    public var bottomMargin = CGFloat(16)
    
    /// The size which is used for icon
    public var horizontalMargin = CGFloat(16)
    
    /// The corner radius of icon picker.  Defaults to 10.
    public var cornerRadius = CGFloat(10)
    
    // MARK: - Search Bar
    
    /// The size which is used for icon
    public var searchBarTopPadding = CGFloat(14)
    
    /// The size which is used for icon
    public var searchBarHorizontalPadding = CGFloat(12)
    
    /// The size which is used for icon
    public var searchBarHeight = CGFloat(33)
    
    // MARK: - Icon Picker
    
    /// The size which is used for icon
    public var topPadding = CGFloat(20)
    
    /// The size which is used for icon
    public var bottomPadding = CGFloat(20)
    
    /// The size which is used for icon
    public var horizontalPadding = CGFloat(14)
    
    /// The size which is used for icon
    public var lineSpacing = CGFloat(22)
    
    /// The size which is used for icon
    public var interitemSpacing = CGFloat(15)
    
    /// The number of items per row in icon picker.  Defaults to 6.
    public var numberOfItemsInRow: Int = 6
    
}
