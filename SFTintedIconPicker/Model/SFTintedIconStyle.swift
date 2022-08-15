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
    
    // MARK: - Use SymbolConfiguration instead
    
    /// The size which is used for symbol
    public var useSymbolConfiguration: Bool = false
    
    /// The size which is used for symbol
    public var symbolConfiguration = UIImage.SymbolConfiguration(pointSize:CGFloat(33))
    
    public init(iconSize: CGFloat = CGFloat(61), symbolSize: CGFloat = CGFloat(33), cornerRadius: CGFloat = CGFloat(15.0)) {
        self.iconSize = iconSize
        self.symbolSize = symbolSize
        self.cornerRadius = cornerRadius
        self.useSymbolConfiguration = false
    }
    
    public init(cornerRadius: CGFloat = CGFloat(15.0), useSymbolConfiguration: Bool, symbolConfiguration: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize:CGFloat(33))) {
        self.cornerRadius = cornerRadius
        self.useSymbolConfiguration = true
        self.symbolConfiguration = symbolConfiguration
    }
}

