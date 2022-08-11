//
//  SFTintedIconPickerVC.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

open class SFTintedIconPickerVC: UIViewController {
    
    private let item = SFTintedItem()
    private let style = SFTintedIconStyle()
    
    private var iconView = SFTintedIcon()
    private let iconBackgroundView = UIView()
    
    private let colorPicker = SFColorPicker()
    private let iconPicker = SFIconPicker()
    
    /// Private callbacks to SFTintedIconPicker
    public var didClose:(() -> Void)?
    public var didSelectItem: ((SFTintedItem) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        setUpIconArea()
        setUpColorPickerArea()
        setUpSymbolPickerArea()
    }
    
    private func setUpNavigation() {
        navigationItem.title = SFTintedConfig.titles.navigationTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: SFTintedConfig.titles.navigationFinishTitle, style: .done, target: self, action: #selector(done))
    }
    
    private func setUpIconArea() {
        iconBackgroundView.backgroundColor = SFTintedConfig.colors.iconAreaBackgroundColor
        iconBackgroundView.frame = CGRect(x: SFTintedConfig.layoutInfos.iconAreaHorizontalMargin, y: self.navigationController!.navigationBar.frame.height + SFTintedConfig.layoutInfos.iconAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.iconAreaHorizontalMargin, height: SFTintedConfig.layoutInfos.iconVerticalPadding * 2 + SFTintedConfig.sizes.demoIconSize.rect.height)
        iconBackgroundView.layer.cornerRadius = 10.0
        view.addSubview(iconBackgroundView)
        
        iconView.frame = CGRect(origin: CGPoint(x: (iconBackgroundView.bounds.width - SFTintedConfig.sizes.demoIconSize.rect.width) / 2.0, y: (iconBackgroundView.bounds.height - SFTintedConfig.sizes.demoIconSize.rect.height) / 2.0), size: SFTintedConfig.sizes.demoIconSize.rect)
        iconBackgroundView.addSubview(iconView)
    }
    
    private func setUpColorPickerArea() {
        colorPicker.colorPickerDelegate = self
        colorPicker.frame = CGRect(x: SFTintedConfig.layoutInfos.colorPickerAreaHorizontalMargin, y: iconBackgroundView.frame.maxY + SFTintedConfig.layoutInfos.colorPickerAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.colorPickerAreaHorizontalMargin, height: 176)
        colorPicker.layer.cornerRadius = 10.0
        view.addSubview(colorPicker)
    }
    
    private func setUpSymbolPickerArea() {
        iconPicker.iconPickerDelegate = self
        iconPicker.backgroundColor = SFTintedConfig.colors.iconPickerAreaBackgroundColor
        iconPicker.frame = CGRect(x: SFTintedConfig.layoutInfos.iconPickerAreaHorizontalMargin, y: colorPicker.frame.maxY + SFTintedConfig.layoutInfos.iconPickerAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.iconPickerAreaHorizontalMargin, height: 500)
        iconPicker.layer.cornerRadius = 10.0
        view.addSubview(iconPicker)
    }
    
    @objc func done() {
        self.didSelectItem!(item)
    }
}

extension SFTintedIconPickerVC: SFIconPickerDelegate {
    func didSelectSymbol(_ symbol: String) {
        item.iconName = symbol
        iconView.refreshWithItem(item)
    }
}


extension SFTintedIconPickerVC: SFColorPickerDelegate {
    func didSelectColor(_ color: SFTintedColor) {
        item.iconColor = color
        iconView.refreshWithItem(item)
    }
    
    func didSelectColorPicker() {
        if #available(iOS 14.0, *) {
            let vc = UIColorPickerViewController()
            vc.delegate = self
            present(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
}

extension SFTintedIconPickerVC: UIColorPickerViewControllerDelegate {
    @available(iOS 14.0, *)
    public func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = SFTintedColor(useGradientColor: false, backgroundColor: viewController.selectedColor)
        item.iconColor = color
        iconView.refreshWithItem(item)
    }
}
