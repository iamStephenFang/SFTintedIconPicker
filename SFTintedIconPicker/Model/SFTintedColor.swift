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
    
    
    /// <#Description#>
    /// - Parameter backgroundColor: <#backgroundColor description#>
    public init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.backgroundGradientColors = []
    }


    /// <#Description#>
    /// - Parameter backgroundGradientColors: <#backgroundGradientColors description#>
    public init(backgroundGradientColors: [UIColor]) {
        self.backgroundGradientColors = backgroundGradientColors
    }
}
