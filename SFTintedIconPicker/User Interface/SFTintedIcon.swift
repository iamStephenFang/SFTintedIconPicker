//
//  SFTintedIcon.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit

public class SFTintedIcon: UIImageView {
    
    public required init(item: SFTintedItem, style: SFTintedIconStyle) {
        super.init(frame: CGRect(x: 0, y: 0, width: style.iconSize.rect.width, height: style.iconSize.rect.height))
        
        var iconConfig = style.symbolConfiguration
        if !style.useSymbolConfiguration {
            iconConfig = UIImage.SymbolConfiguration(pointSize: style.symbolSize.pointSize, weight: style.symbolWeight)
        }
        image = UIImage(systemName: item.iconName, withConfiguration: iconConfig)
        layer.cornerRadius = style.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
