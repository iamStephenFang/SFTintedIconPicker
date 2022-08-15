//
//  SFDemoIconView.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/15.
//

import UIKit

class SFDemoIconView: UIView {
    
    fileprivate let iconView = SFTintedIcon()
    
    required init(item: SFTintedItem) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = SFTintedConfig.colors.iconAreaBackgroundColor
        
        addSubview(iconView)
        refreshWithItem(SFTintedConfig.selectedItem)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView.frame = CGRect(origin: CGPoint(x: (bounds.width - SFTintedConfig.sizes.demoIconSize.rect.width) / 2.0, y: (bounds.height - SFTintedConfig.sizes.demoIconSize.rect.height) / 2.0), size: SFTintedConfig.sizes.demoIconSize.rect)
    }
    
    public func refreshWithItem(_ item: SFTintedItem) {
        iconView.refreshWithItem(item)
    }
}
