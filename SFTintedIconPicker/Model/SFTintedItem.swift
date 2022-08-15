//
//  SFTintedItem.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public class SFTintedItem {
    
    /// Use this property to modify the default colors provided.
    public var iconColor = SFTintedColor()
    
    /// SFSymbols icon name
    public var iconName = "square.and.arrow.up"
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - iconColor: <#iconColor description#>
    ///   - iconName: <#iconName description#>
    public init(iconColor: SFTintedColor = SFTintedColor(), iconName: String = "square.and.arrow.up") {
        self.iconColor = iconColor
        self.iconName = iconName
    }
}
