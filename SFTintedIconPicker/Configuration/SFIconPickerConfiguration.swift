//
//  SFIconPickerConfiguration.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/15.
//

import Foundation

public struct SFIconPickerConfiguration {
    
    /// The top margin height of icon picker area. Defaults to 16.
    public var topMargin = CGFloat(16)
    
    /// The bottom margin height of icon picker area. Defaults to 16.
    public var bottomMargin = CGFloat(16)
    
    /// The horizontal margin width of icon picker area. Defaults to 16.
    public var horizontalMargin = CGFloat(16)
    
    /// The corner radius of icon picker area. Defaults to 10.
    public var cornerRadius = CGFloat(10)
    
    // MARK: - Search Bar
    
    /// The top padding height between icon picker area and search bar. Defaults to 14.
    public var searchBarTopPadding = CGFloat(14)
    
    /// The horizontal padding width of icon picker area. Defaults to 12.
    public var searchBarHorizontalPadding = CGFloat(12)
    
    /// The height of search bar in icon picker area. Defaults to 33.
    public var searchBarHeight = CGFloat(33)
    
    // MARK: - Icon Picker
    
    /// The top padding height between search bar and icon picker. Defaults to 20.
    public var topPadding = CGFloat(20)
    
    /// The bottom padding height between icon picker.and icon picker area. Defaults to 20.
    public var bottomPadding = CGFloat(20)
    
    /// The horizontal padding width between icon picker.and icon picker area. Defaults to 14.
    public var horizontalPadding = CGFloat(14)
    
    /// The line spacing of icon picker cell. Defaults to 22.
    public var lineSpacing = CGFloat(22)
    
    /// The interitem spacing of icon picker cell. Defaults to 15.
    public var interitemSpacing = CGFloat(15)
    
    /// The number of items per row in icon picker.  Defaults to 6.
    public var numberOfItemsInRow: Int = 6
    
    /// The corner radius of color picker cell. Defaults to 7.
    public var cellCornerRadius = CGFloat(7)
    
}
