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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSymbol(_ symbol: String) {
        iconView.image = UIImage(systemName: symbol)
    }
}
