//
//  SFTintedIconPickerVC.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

open class SFTintedIconPickerVC: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let demoIconView = SFDemoIconView(item: SFTintedConfig.selectedItem)
    private let colorPicker = SFColorPicker(color: SFTintedConfig.selectedItem.iconColor)
    private let iconPicker = SFIconPicker(symbol: SFTintedConfig.selectedItem.iconName)
    
    /// Private callbacks to SFTintedIconPicker
    public var didClose:(() -> Void)?
    public var didSelectItem: ((SFTintedItem) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        setUpScrollView()
        setUpIconArea()
        setUpColorPickerArea()
        setUpSymbolPickerArea()
    }
    
    private func setUpNavigation() {
        navigationItem.title = SFTintedConfig.titles.navigationTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: SFTintedConfig.titles.navigationFinishTitle, style: .done, target: self, action: #selector(done))
    }
    
    private func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = SFTintedConfig.colors.pickerBackgroundColor
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.size.width, height: contentHeight())
    }
    
    private func setUpIconArea() {
        demoIconView.frame = CGRect(x: SFTintedConfig.layoutInfos.iconAreaHorizontalMargin, y:  SFTintedConfig.layoutInfos.iconAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.iconAreaHorizontalMargin, height: SFTintedConfig.layoutInfos.iconVerticalPadding * 2 + SFTintedConfig.sizes.demoIconSize.rect.height)
        demoIconView.layer.cornerRadius = 10.0
        scrollView.addSubview(demoIconView)
    }
    
    private func setUpColorPickerArea() {
        colorPicker.colorPickerDelegate = self
        colorPicker.frame = CGRect(x: SFTintedConfig.layoutInfos.colorPickerAreaHorizontalMargin, y: demoIconView.frame.maxY + SFTintedConfig.layoutInfos.colorPickerAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.colorPickerAreaHorizontalMargin, height: colorPicker.height())
        colorPicker.layer.cornerRadius = 10.0
        scrollView.addSubview(colorPicker)
    }
    
    private func setUpSymbolPickerArea() {
        iconPicker.iconPickerDelegate = self
        iconPicker.backgroundColor = SFTintedConfig.colors.iconPickerAreaBackgroundColor
        iconPicker.frame = CGRect(x: SFTintedConfig.layoutInfos.iconPickerAreaHorizontalMargin, y: colorPicker.frame.maxY + SFTintedConfig.layoutInfos.iconPickerAreaTopMargin, width: view.bounds.width - 2 * SFTintedConfig.layoutInfos.iconPickerAreaHorizontalMargin, height: iconPicker.height())
        iconPicker.layer.cornerRadius = 10.0
        scrollView.addSubview(iconPicker)
    }
    
    @objc func done() {
        didSelectItem?(SFTintedConfig.selectedItem)
    }
    
    private func contentHeight() -> CGFloat {
        let iconAreaHeight = SFTintedConfig.layoutInfos.iconVerticalPadding * 2 + SFTintedConfig.sizes.demoIconSize.rect.height + SFTintedConfig.layoutInfos.iconAreaTopMargin
        let colorPickerAreaHeight = SFTintedConfig.layoutInfos.colorPickerAreaTopMargin + colorPicker.height()
        let iconPickerAreaHeight = SFTintedConfig.layoutInfos.iconPickerAreaTopMargin + iconPicker.height() + SFTintedConfig.layoutInfos.iconPickerAreaBottomMargin
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        let bottomInsets = keyWindow?.safeAreaInsets.bottom
        
        return iconAreaHeight + colorPickerAreaHeight + iconPickerAreaHeight + (bottomInsets ?? 0)
    }
}

extension SFTintedIconPickerVC: SFIconPickerDelegate {
    func didSelectSymbol(_ symbol: String) {
        SFTintedConfig.selectedItem.iconName = symbol
        demoIconView.refreshWithItem(SFTintedConfig.selectedItem)
    }
}


extension SFTintedIconPickerVC: SFColorPickerDelegate {
    func didSelectColor(_ color: SFTintedColor) {
        SFTintedConfig.selectedItem.iconColor = color
        demoIconView.refreshWithItem(SFTintedConfig.selectedItem)
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
        SFTintedConfig.selectedItem.iconColor = SFTintedColor(backgroundColor: viewController.selectedColor)
        demoIconView.refreshWithItem(SFTintedConfig.selectedItem)
    }
}
