//
//  SFIconPickerCell.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

class SFIconPickerCell: UICollectionViewCell {
    
    static let identifier = NSStringFromClass(SFIconPickerCell.self)
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(iconView)
        contentView.layer.cornerRadius = 3.0
        iconView.frame = contentView.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSymbol(_ symbol: String) {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 10, weight: .light)
        let color = SFTintedConfig.colors.iconTintedColor
        iconView.backgroundColor = SFTintedConfig.colors.iconPickerAreaBackgroundColor
        iconView.image = UIImage(systemName: symbol)?.withConfiguration(imageConfig).withTintColor(color, renderingMode: .alwaysOriginal)
    }
}
