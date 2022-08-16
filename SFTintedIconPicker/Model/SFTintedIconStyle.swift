//
//  SFTintedIconStyle.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public struct SFTintedIconStyle {
    
    /// The size which is used for icon
    public var iconSize = CGFloat(61)
    
    /// Use this property to modify the default colors provided.
    public var symbolSize = CGFloat(33)
    
    /// The corner Radius which is used for demo icon
    public var cornerRadius = CGFloat(15.0)
    
    /// Use this property to modify the default colors provided.
    public var tintColor = UIColor.white
    
    // MARK: - Use SymbolConfiguration instead
    
    /// The size which is used for symbol
    public var useSymbolConfiguration: Bool = false
    
    /// The size which is used for symbol
    public var symbolConfiguration = UIImage.SymbolConfiguration(pointSize:CGFloat(33))

    // MARK: - Initializer
    
    /// Build a SFTintedIconStyle struct using the recommended method
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


    /// Build a SFTintedIconStyle struct using the custom symbolConfiguration method
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

