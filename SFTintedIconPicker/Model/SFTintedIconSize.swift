//
//  SFTintedItemSize.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import Foundation

public enum SFTintedIconSize {
    
    /// 30 * 30
    case small
    
    /// 44 * 44
    case medium
    
    /// 56 * 56
    case large
    
    /// Custom size
    case custom(_ size: CGSize)
    
    var rect: CGSize {
        switch self {
        case .small: return CGSize(width: 30, height: 30)
        case .medium: return CGSize(width: 44, height: 44)
        case .large: return CGSize(width: 56, height: 56)
        case .custom(let size): return CGSize(width: size.width, height: size.height)
        }
    }
}
