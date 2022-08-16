//
//  SFTintedIconStyle.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public struct SFTintedIconStyle {
    
    /// The width and height of icon.  Defaults to 61.
    public var iconSize = CGFloat(61)
    
    /// The point size of symbol.  Defaults to 33.
    public var symbolSize = CGFloat(33)
    
    /// The corner radius which is used for icon.  Defaults to 15.
    public var cornerRadius = CGFloat(15.0)
    
    /// The tint color of symbol.
    public var tintColor = UIColor.white
    
    /// Use SymbolConfiguration for symbol customization or not
    public var useSymbolConfiguration: Bool = false
    
    /// Custom symbol configuration
    public var symbolConfiguration = UIImage.SymbolConfiguration(pointSize:CGFloat(33))

    // MARK: - Initializer
    
    /// Provide a SFTintedIconStyle struct using the recommended method
    /// - Parameters:
    ///   - iconSize: The size of icon
    ///   - symbolSize: The point size of symbol
    ///   - cornerRadius: The corner radius of icon
    ///   - tintColor: The tint color of symbol
    public init(iconSize: CGFloat, symbolSize: CGFloat, cornerRadius: CGFloat = CGFloat(15.0), tintColor: UIColor = UIColor.white) {
        self.iconSize = iconSize
        self.symbolSize = symbolSize
        self.cornerRadius = cornerRadius
        self.tintColor = tintColor
        self.useSymbolConfiguration = false
    }


    /// Provide a SFTintedIconStyle struct using the custom symbolConfiguration method
    /// - Parameters:
    ///   - iconSize: The size of icon
    ///   - cornerRadius: The corner radius of icon
    ///   - tintColor: The tint color of symbol
    ///   - symbolConfiguration: Custom symbol configuration
    public init(iconSize: CGFloat, cornerRadius: CGFloat = CGFloat(15.0), tintColor: UIColor = UIColor.white, symbolConfiguration: UIImage.SymbolConfiguration) {
        self.iconSize = iconSize
        self.cornerRadius = cornerRadius
        self.tintColor = tintColor
        self.useSymbolConfiguration = true
        self.symbolConfiguration = symbolConfiguration
    }
}

