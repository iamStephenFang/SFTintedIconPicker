//
//  SFTintedIcon.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit

public class SFTintedIcon: UIImageView {
    
    private var iconConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(33))
    private var style = SFTintedIconStyle(iconSize: CGFloat(61), symbolSize: CGFloat(31))
    
    private lazy var gradientLayer: CAGradientLayer = {
        $0.shouldRasterize = true
        return $0
    }(CAGradientLayer())
    
    public required init(item: SFTintedItem, style: SFTintedIconStyle) {
        super.init(frame: CGRect(x: 0, y: 0, width: style.iconSize, height: style.iconSize))
        
        self.style = style
        if style.useSymbolConfiguration {
            iconConfig = style.symbolConfiguration
        }
        
        layer.addSublayer(gradientLayer)
        gradientLayer.isHidden = true
        
        layer.cornerRadius = style.cornerRadius
        contentMode = .center
        
        refreshWithItem(item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func refreshWithItem(_ item: SFTintedItem) {
        image = UIImage(systemName: item.itemSymbol, withConfiguration: iconConfig)?.withTintColor(style.tintColor, renderingMode: .alwaysOriginal)
        
        if item.itemColor.backgroundGradientColors.count > 0 {
            gradientLayer.isHidden = false
            gradientLayer.colors = item.itemColor.backgroundGradientColors.map{ $0.cgColor }
        } else {
            gradientLayer.isHidden = true
            backgroundColor = item.itemColor.backgroundColor
        }
    }
}
