//
//  SFTintedColor.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

public struct SFTintedColor: Equatable {
    
    /// Use this property to modify the default colors provided.
    public var useGradientColor: Bool = false
    
    /// Use this property to modify the default colors provided.
    public var backgroundGradientColors: [UIColor] = []
    
    /// Use this property to modify the default colors provided.
    public var backgroundColor = UIColor.red
    
    /// Use this property to modify the default colors provided.
    public var tintColor = UIColor.white
}
