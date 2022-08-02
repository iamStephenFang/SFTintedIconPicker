//
//  SFColorPickerCell.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

class SFColorPickerCell: UICollectionViewCell {
    
    static let identifier = NSStringFromClass(SFColorPickerCell.self)
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.shouldRasterize = true
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = SFTintedConfig.sizes.pickIconSize.rect.width / 2.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = contentView.bounds
    }
    
    func setupColor(_ color: SFTintedColor) {
        if color.useGradientColor {
            gradientLayer.colors = color.backgroundGradientColors.map{ $0.cgColor }
            contentView.layer.addSublayer(gradientLayer)
        } else {
            contentView.backgroundColor = color.backgroundColor
        }
    }
    
    func setupPicker() {
        
    }
}

