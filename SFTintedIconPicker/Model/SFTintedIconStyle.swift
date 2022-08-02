//
//  SFTintedIconStyle.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public struct SFTintedIconStyle {
    
    /// The size which is used for icon
    public var iconSize = SFTintedIconSize.small
    
    /// Use this property to modify the default colors provided.
    public var iconColor = UIColor.tintColor
    
    /// Use this property to modify the default colors provided.
    public var symbolSize = SFTintedSymbolSize.small
    
    /// Use this property to modify the default colors provided.
    public var symbolWeight = UIImage.SymbolWeight.regular
    
    /// The corner Radius which is used for demo icon
    public var cornerRadius = CGFloat(5.0)
    
    // MARK: - Use SymbolConfiguration instead
    
    /// The size which is used for symbol
    public var useSymbolConfiguration: Bool = false
    
    /// The size which is used for symbol
    public var symbolConfiguration = UIImage.SymbolConfiguration(pointSize: SFTintedSymbolSize.small.pointSize)
    
}

public enum SFTintedSymbolSize {
    
    /// 24
    case small
    
    /// 30
    case medium
    
    /// 42
    case large
    
    /// Custom size
    case custom(_ size: CGFloat)
    
    var pointSize: CGFloat {
        switch self {
        case .small: return CGFloat(24)
        case .medium: return CGFloat(30)
        case .large: return CGFloat(42)
        case .custom(let size): return CGFloat(size)
        }
    }
}
