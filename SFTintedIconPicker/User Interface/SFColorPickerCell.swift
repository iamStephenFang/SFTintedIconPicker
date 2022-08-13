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
        $0.shouldRasterize = true
        return $0
    } (CAGradientLayer())
    
    private lazy var selectedLayer: CAShapeLayer = {
        return $0
    } (CAShapeLayer())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = CGFloat(SFTintedConfig.sizes.colorIconSize) / 2.0
        contentView.layer.masksToBounds = true
        
        selectedBackgroundView = SFColorPickerCellCircleView()
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
}

class SFColorPickerCellCircleView: UIView {
    let circleLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard circleLayer.superlayer == nil else { return }
        let size = CGFloat(SFTintedConfig.sizes.colorIconSize + 14.0)
        let radius = size / 2.0
        circleLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size, height: size), cornerRadius: radius).cgPath
        circleLayer.position = CGPoint(x: self.frame.midX - radius, y: self.frame.midY - radius)
        circleLayer.fillColor = SFTintedConfig.colors.colorPickerSelectedCircleColor.cgColor
        circleLayer.lineWidth = 3.0
//        circleLayer.strokeColor = SFTintedConfig.colors.colorPickerSelectedCircleColor.cgColor
        self.layer.addSublayer(circleLayer)
    }
}
