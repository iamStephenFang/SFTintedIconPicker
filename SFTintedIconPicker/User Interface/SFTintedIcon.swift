//
//  SFTintedIcon.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit

public class SFTintedIcon: UIImageView {
    
    public var iconConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(33))
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.shouldRasterize = true
        return layer
    }()
    
    public convenience init() {
        self.init(item: SFTintedItem(), style: SFTintedIconStyle())
    }
    
    public required init(item: SFTintedItem, style: SFTintedIconStyle) {
        super.init(frame: CGRect(x: 0, y: 0, width: style.iconSize, height: style.iconSize))
        
        if style.useSymbolConfiguration {
            iconConfig = style.symbolConfiguration
        }
        
        layer.cornerRadius = style.cornerRadius
        contentMode = .center
        
        refreshWithItem(item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func refreshWithItem(_ item: SFTintedItem) {
        image = UIImage(systemName: item.itemSymbol, withConfiguration: iconConfig)?.withTintColor(item.itemColor.tintColor, renderingMode: .alwaysOriginal)
        
        if item.itemColor.backgroundGradientColors.count > 0 {
            if gradientLayer.sublayers == nil {
                layer.addSublayer(gradientLayer)
            }
            gradientLayer.colors = item.itemColor.backgroundGradientColors.map{ $0.cgColor }
        } else {
            backgroundColor = item.itemColor.backgroundColor
        }
    }
}
