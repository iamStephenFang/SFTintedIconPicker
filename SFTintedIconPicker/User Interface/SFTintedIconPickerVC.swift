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
    private let colorPicker = SFColorPicker(color: SFTintedConfig.selectedItem.itemColor)
    private let iconPicker = SFIconPicker(symbol: SFTintedConfig.selectedItem.itemSymbol)
    
    /// Private callbacks to SFTintedIconPicker
    public var didClose:(() -> Void)?
    public var didSelectItem: ((SFTintedItem) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        setUpScrollView()
        setUpIconArea()
        
        if SFTintedConfig.isColorSelectionEnabled {
            setUpColorPickerArea()
        }
        
        setUpSymbolPickerArea()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        demoIconView.frame = CGRect(x: SFTintedConfig.demoIconConfig.horizontalMargin, y:  SFTintedConfig.demoIconConfig.topMargin, width: view.bounds.width - 2 * SFTintedConfig.demoIconConfig.horizontalMargin, height: SFTintedConfig.demoIconConfig.verticalPadding * 2 + SFTintedConfig.demoIconConfig.iconSize)
        
        var iconPickerOriginY = demoIconView.frame.maxY + SFTintedConfig.iconPickerConfig.topMargin
        if SFTintedConfig.isColorSelectionEnabled {
            colorPicker.frame = CGRect(x: SFTintedConfig.colorPickerConfig.horizontalMargin, y: demoIconView.frame.maxY + SFTintedConfig.colorPickerConfig.topMargin, width: view.bounds.width - 2 * SFTintedConfig.colorPickerConfig.horizontalMargin, height: colorPicker.height())
            iconPickerOriginY = colorPicker.frame.maxY + SFTintedConfig.iconPickerConfig.topMargin
        }
        iconPicker.frame = CGRect(x: SFTintedConfig.iconPickerConfig.horizontalMargin, y: iconPickerOriginY, width: view.bounds.width - 2 * SFTintedConfig.iconPickerConfig.horizontalMargin, height: iconPicker.height())
        
        scrollView.contentSize = CGSize(width: view.bounds.size.width, height: contentHeight())
    }
    
    private func setUpNavigation() {
        navigationItem.title = SFTintedConfig.titles.navigationTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: SFTintedConfig.titles.navigationFinishTitle, style: .done, target: self, action: #selector(done))
    }
    
    private func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = SFTintedConfig.colors.pickerBackgroundColor
        scrollView.frame = view.bounds
    }
    
    private func setUpIconArea() {
        demoIconView.layer.cornerRadius = SFTintedConfig.demoIconConfig.cornerRadius
        scrollView.addSubview(demoIconView)
    }
    
    private func setUpColorPickerArea() {
        colorPicker.colorPickerDelegate = self
        colorPicker.layer.cornerRadius = SFTintedConfig.colorPickerConfig.cornerRadius
        scrollView.addSubview(colorPicker)
    }
    
    private func setUpSymbolPickerArea() {
        iconPicker.iconPickerDelegate = self
        iconPicker.layer.cornerRadius = SFTintedConfig.iconPickerConfig.cornerRadius
        scrollView.addSubview(iconPicker)
    }
    
    @objc func done() {
        didSelectItem?(SFTintedConfig.selectedItem)
    }
    
    private func contentHeight() -> CGFloat {
        let iconAreaHeight = SFTintedConfig.demoIconConfig.verticalPadding * 2 + SFTintedConfig.demoIconConfig.iconSize + SFTintedConfig.demoIconConfig.topMargin
        let colorPickerAreaHeight = SFTintedConfig.isColorSelectionEnabled ? SFTintedConfig.colorPickerConfig.topMargin + colorPicker.height() : CGFloat(0)
        let iconPickerAreaHeight = SFTintedConfig.iconPickerConfig.topMargin + iconPicker.height() + SFTintedConfig.iconPickerConfig.bottomMargin
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        let bottomInsets = keyWindow?.safeAreaInsets.bottom
        
        return iconAreaHeight + colorPickerAreaHeight + iconPickerAreaHeight + (bottomInsets ?? 16.0)
    }
}

extension SFTintedIconPickerVC: SFIconPickerDelegate {
    func didSearchKeyword(_ keyword: String) {
        viewDidLayoutSubviews()
    }
    
    func didSelectSymbol(_ symbol: String) {
        SFTintedConfig.selectedItem.itemSymbol = symbol
        demoIconView.refreshWithItem(SFTintedConfig.selectedItem)
    }
}


extension SFTintedIconPickerVC: SFColorPickerDelegate {
    func didSelectColor(_ color: SFTintedColor) {
        SFTintedConfig.selectedItem.itemColor = color
        demoIconView.refreshWithItem(SFTintedConfig.selectedItem)
    }
    
    func didSelectColorPicker() {
        if #available(iOS 14.0, *) {
            let vc = UIColorPickerViewController()
            vc.selectedColor = SFTintedConfig.selectedItem.itemColor.backgroundColor
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
        SFTintedConfig.selectedItem.itemColor = SFTintedColor(backgroundColor: viewController.selectedColor)
        demoIconView.refreshWithItem(SFTintedConfig.selectedItem)
    }
}
