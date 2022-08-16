//
//  SFColorPickerCell.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

class SFColorPickerCell: UICollectionViewCell {
    
    static let identifier = NSStringFromClass(SFColorPickerCell.self)
    
    private lazy var gradientColorLayer: CAGradientLayer = {
        $0.shouldRasterize = true
        return $0
    } (CAGradientLayer())
    
    private lazy var selectedLayer: CAShapeLayer = {
        $0.lineWidth = SFTintedConfig.colorPickerConfig.selectedBorderWidth
        $0.strokeColor = SFTintedConfig.colors.colorPickerSelectedBorderColor.cgColor
        $0.fillColor = UIColor.clear.cgColor
        return $0
    } (CAShapeLayer())
    
    private lazy var colorLayer: CAShapeLayer = {
        return $0
    } (CAShapeLayer())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.addSublayer(selectedLayer)
        selectedLayer.frame = contentView.bounds
        selectedLayer.path = UIBezierPath(ovalIn: CGRect(x: SFTintedConfig.colorPickerConfig.selectedBorderWidth, y: SFTintedConfig.colorPickerConfig.selectedBorderWidth, width: selectedLayer.frame.size.width - 2 * SFTintedConfig.colorPickerConfig.selectedBorderWidth, height: selectedLayer.frame.size.height - 2 * SFTintedConfig.colorPickerConfig.selectedBorderWidth)).cgPath
        selectedLayer.isHidden = true
        
        let innerSize = frame.size.width * SFTintedConfig.colorPickerConfig.innerColorSizeRatio
        let offset = (frame.size.height - innerSize) / 2.0
        contentView.layer.addSublayer(gradientColorLayer)
        gradientColorLayer.cornerRadius = innerSize / 2.0
        gradientColorLayer.frame = CGRect(x: offset, y: offset, width: innerSize, height: innerSize)
        
        contentView.layer.addSublayer(colorLayer)
        colorLayer.frame = CGRect(x: offset, y: offset, width: innerSize, height: innerSize)
        colorLayer.cornerRadius = innerSize / 2.0
        colorLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: innerSize, height: innerSize), cornerRadius: innerSize / 2.0).cgPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupColor(_ color: SFTintedColor) {
        if color.backgroundGradientColors.count > 0 {
            colorLayer.isHidden = true
            gradientColorLayer.isHidden = false
            gradientColorLayer.colors = color.backgroundGradientColors.map{ $0.cgColor }
        } else {
            colorLayer.isHidden = false
            gradientColorLayer.isHidden = true
            colorLayer.fillColor = color.backgroundColor.cgColor
        }
    }
    
    override var isSelected: Bool {
        didSet {
            selectedLayer.isHidden = !isSelected
        }
    }
}

