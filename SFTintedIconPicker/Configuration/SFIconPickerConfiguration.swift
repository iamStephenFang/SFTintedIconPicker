//
//  SFIconPickerConfiguration.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/15.
//

import Foundation

public struct SFIconPickerConfiguration {
    
    // MARK: - Search Bar
    
    /// The size which is used for icon
    public var searchBarTopPadding = CGFloat(14)
    
    /// The size which is used for icon
    public var searchBarHorizontalPadding = CGFloat(12)
    
    /// The size which is used for icon
    public var searchBarHeight = CGFloat(33)
    
    // MARK: - Icon Picker
    
    /// The size which is used for icon
    public var areaTopMargin = CGFloat(16)
    
    /// The size which is used for icon
    public var areaBottomMargin = CGFloat(16)
    
    /// The size which is used for icon
    public var areaHorizontalMargin = CGFloat(16)
    
    /// The size which is used for icon
    public var topPadding = CGFloat(20)
    
    /// The size which is used for icon
    public var bottomPadding = CGFloat(20)
    
    /// The size which is used for icon
    public var horizontalPadding = CGFloat(14)
    
    /// The size which is used for icon
    public var minimumLineSpacing = CGFloat(22)
    
    /// The size which is used for icon
    public var minimumInteritemSpacing = CGFloat(15)
    
    /// The number of items per row in icon picker.  Defaults to 6.
    public var numberOfItemsInRow: Int = 6
}
