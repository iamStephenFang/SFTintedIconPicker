//
//  SFColorPickerConfiguration.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/15.
//

import Foundation

public struct SFColorPickerConfiguration {
    
    /// The top margin height of color picker area. Defaults to 16.
    public var topMargin = CGFloat(16)
    
    /// The horizontal margin width of color picker area. Defaults to 16.
    public var horizontalMargin = CGFloat(16)
    
    /// The vertical padding height between color picker cell and color picker area. Defaults to 13.
    public var verticalPadding = CGFloat(13)
    
    /// The horizontal padding height between color picker cell and color picker area. Defaults to 7.
    public var horizontalPadding = CGFloat(7)
    
    /// The line spacing of color picker cell. Defaults to 7.
    public var lineSpacing = CGFloat(7)

    /// The interitem spacing of color picker cell. Defaults to 2.
    public var interitemSpacing = CGFloat(2)
    
    /// The number of items per row in color picker. Defaults to 6.
    public var numberOfItemsInRow: Int = 6
    
    /// The line width of selected color picker cell. Defaults to 2.
    public var selectedBorderWidth = CGFloat(2)
    
    /// The size ratio of inner size of total size. Defaults to 0.7.
    public var innerColorSizeRatio = CGFloat(0.7)
    
    /// The corner radius of color picker area. Defaults to 10.
    public var cornerRadius = CGFloat(10)
    
}
