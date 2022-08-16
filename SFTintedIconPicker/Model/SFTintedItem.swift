//
//  SFTintedItem.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

public class SFTintedItem {
    
    /// The SFTintedColor item provided
    public var itemColor = SFTintedColor(backgroundColor: UIColor.red)
    
    /// The SF Symbols name provided
    public var itemSymbol = "square.and.arrow.up"
    
    // MARK: - Initializer
    
    /// Provide the struct to identify the SFTintedItem
    /// - Parameters:
    ///   - itemColor: The SFTintedColor item provided
    ///   - itemSymbol: The SF Symbols name provided
    public init(itemColor: SFTintedColor = SFTintedColor(backgroundColor: UIColor.red), itemSymbol: String = "square.and.arrow.up") {
        self.itemColor = itemColor
        self.itemSymbol = itemSymbol
    }
}
