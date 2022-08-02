//
//  SFTintedIconPickerVC.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

open class SFTintedIconPickerVC: UIViewController {
    
    private lazy var iconView: SFTintedIcon = {
        var item = SFTintedItem()
        var style = SFTintedIconStyle()
        return SFTintedIcon(item: item, style: style)
    }()
    
    private lazy var iconBackgroundView: UIView = {
        $0.backgroundColor = SFTintedConfig.colors.iconAreaBackgroundColor
        return $0
    }(UIView())
    
    private lazy var colorPicker: SFColorPicker = {
        let collectionViewLayout = UICollectionViewLayout()
        return SFColorPicker(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    }()
    
    private lazy var iconPicker: SFIconPicker = {
        return SFIconPicker()
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = SFTintedConfig.title
        
        setUpIconArea()
        setUpColorPickerArea()
        setUpSymbolPickerArea()
    }
    
    private func setUpIconArea() {
        iconBackgroundView.frame = CGRect(x: SFTintedConfig.layoutInfos.iconAreaHorizontalMargin, y: SFTintedConfig.layoutInfos.iconAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.iconAreaHorizontalMargin, height: SFTintedConfig.layoutInfos.iconVerticalPadding * 2 + SFTintedConfig.sizes.demoIconSize.rect.height)
        view.addSubview(iconBackgroundView)
        
        iconView.frame = CGRect(origin: CGPoint(x: (iconBackgroundView.bounds.width - SFTintedConfig.sizes.demoIconSize.rect.width) / 2.0, y: (iconBackgroundView.bounds.height - SFTintedConfig.sizes.demoIconSize.rect.height) / 2.0), size: SFTintedConfig.sizes.demoIconSize.rect)
        iconBackgroundView.addSubview(iconView)
    }
    
    private func setUpColorPickerArea() {
        colorPicker.frame = CGRect(x: SFTintedConfig.layoutInfos.colorPickerAreaHorizontalMargin, y: iconBackgroundView.frame.maxY + SFTintedConfig.layoutInfos.colorPickerAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.colorPickerAreaHorizontalMargin, height: colorPicker.height())
        view.addSubview(colorPicker)
    }
    
    private func setUpSymbolPickerArea() {
        iconPicker.backgroundColor = SFTintedConfig.colors.iconPickerAreaBackgroundColor
        iconPicker.frame = CGRect(x: SFTintedConfig.layoutInfos.iconPickerAreaHorizontalMargin, y: colorPicker.frame.maxY + SFTintedConfig.layoutInfos.iconPickerAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.iconPickerAreaHorizontalMargin, height: 300)
        view.addSubview(iconPicker)
    }
}
