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
        $0.contentMode = .center
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(iconView)
        iconView.frame = contentView.frame
        
        selectedBackgroundView = UIView(frame: contentView.frame)
        selectedBackgroundView?.backgroundColor = SFTintedConfig.colors.iconPickerCellSelectedBackgroundColor
        selectedBackgroundView?.layer.cornerRadius = SFTintedConfig.iconPickerConfig.cellCornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSymbol(_ symbol: String) {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 23)
        let color = SFTintedConfig.colors.iconPickerCellTintedColor
        
        iconView.image = UIImage(systemName: symbol)?.withConfiguration(imageConfig).withTintColor(color, renderingMode: .alwaysOriginal)
    }
}
