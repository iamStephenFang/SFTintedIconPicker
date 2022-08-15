//
//  SFTintedColor.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

public struct SFTintedColor: Equatable {
    
    /// Use this property to modify the default colors provided.
    public var backgroundGradientColors: [UIColor] = []
    
    /// Use this property to modify the default colors provided.
    public var backgroundColor = UIColor.red
    
    /// Use this property to modify the default colors provided.
    public var tintColor = UIColor.white
    
    
    /// Initialzer
    /// - Parameters:
    ///   - backgroundGradientColors: <#backgroundGradientColors description#>
    ///   - backgroundColor: <#backgroundColor description#>
    ///   - tintColor: <#tintColor description#>
    public init(backgroundGradientColors: [UIColor] = [], backgroundColor: UIColor = UIColor.red, tintColor: UIColor = UIColor.white) {
        self.backgroundGradientColors = backgroundGradientColors
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
    }
    
    
    /// <#Description#>
    /// - Parameter backgroundColor: <#backgroundColor description#>
    public init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }
    
    
    /// <#Description#>
    /// - Parameter backgroundGradientColors: <#backgroundGradientColors description#>
    public init(backgroundGradientColors: [UIColor]) {
        self.backgroundGradientColors = backgroundGradientColors
    }
}
