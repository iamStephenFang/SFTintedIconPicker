//
//  SFTintedItem.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public class SFTintedItem {
    
    /// Use this property to modify the default colors provided.
    public var itemColor = SFTintedColor(backgroundColor: UIColor.red)
    
    /// SFSymbols icon name
    public var itemSymbol = "square.and.arrow.up"
    
    public init(itemColor: SFTintedColor = SFTintedColor(backgroundColor: UIColor.red), itemSymbol: String = "square.and.arrow.up") {
        self.itemColor = itemColor
        self.itemSymbol = itemSymbol
    }
    
}
