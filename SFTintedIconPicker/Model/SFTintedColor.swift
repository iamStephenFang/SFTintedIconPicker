//
//  SFTintedColor.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

public struct SFTintedColor: Equatable {
    
    /// The gradient colors provided for the item's background.
    public var backgroundGradientColors: [UIColor] = []
    
    /// The solid color provided for the item's background.
    public var backgroundColor = UIColor.red
    
    // MARK: - Initializer
    
    /// Provide solid color to color the background
    /// - Parameter backgroundColor: The solid color provided for the item's background.
    public init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.backgroundGradientColors = []
    }

    /// Provide solid color to color the background
    /// - Parameter backgroundGradientColors: The gradient colors provided for the item's background.
    public init(backgroundGradientColors: [UIColor]) {
        self.backgroundGradientColors = backgroundGradientColors
    }
}
