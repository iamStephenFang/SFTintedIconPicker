//
//  SFTintedIconStyle.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public struct SFTintedIconStyle {
    
    /// The size which is used for icon
    public var iconSize = SFTintedIconSize.large
    
    /// Use this property to modify the default colors provided.
    public var symbolSize = SFTintedSymbolSize.medium
    
    /// The corner Radius which is used for demo icon
    public var cornerRadius = CGFloat(15.0)
    
    // MARK: - Use SymbolConfiguration instead
    
    /// The size which is used for symbol
    public var useSymbolConfiguration: Bool = false
    
    /// The size which is used for symbol
    public var symbolConfiguration = UIImage.SymbolConfiguration(pointSize:SFTintedSymbolSize.medium.pointSize)
}

public enum SFTintedSymbolSize {
    
    /// 24
    case small
    
    /// 33
    case medium
    
    /// 42
    case large
    
    /// Custom size
    case custom(_ size: CGFloat)
    
    var pointSize: CGFloat {
        switch self {
        case .small: return CGFloat(24)
        case .medium: return CGFloat(33)
        case .large: return CGFloat(60)
        case .custom(let size): return CGFloat(size)
        }
    }
}
