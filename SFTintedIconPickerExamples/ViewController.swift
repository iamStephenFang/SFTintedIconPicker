//
//  ViewController.swift
//  SFTintedIconPickerExamples
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit
import SFTintedIconPicker

enum LayoutInfo {
    static let iconSize = CGFloat(50.0)
    static let iconMargin = CGFloat(180.0)
    static let imageSize = CGFloat(50.0)
    static let imageMargin = CGFloat(250.0)
    static let buttonHeight = CGFloat(50.0)
    static let buttonWidth = CGFloat(120.0)
    static let buttonMargin = CGFloat(380.0)
}

class ViewController: UIViewController {
    
    var currentItem = SFTintedItem()
    let iconConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(33))
    
    let iconView = SFTintedIcon(item: SFTintedItem(), style: SFTintedIconStyle(iconSize: CGFloat(61), symbolSize: CGFloat(31)))
    
    lazy var actionButton: UIButton = {
        $0.setTitle("Customize", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(showIconPicker), for: .touchUpInside)
        return $0
    } (UIButton(type: .custom))
    
    lazy var imageView: UIImageView = {
        $0.backgroundColor = UIColor.red
        $0.contentMode = .center
        $0.image = UIImage(systemName: "square.and.arrow.up", withConfiguration: iconConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return $0
    } (UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(iconView)
        iconView.frame = CGRect(x: (view.bounds.size.width - LayoutInfo.iconSize) / 2, y: LayoutInfo.iconMargin, width: LayoutInfo.iconSize, height: LayoutInfo.iconSize)
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: (view.bounds.size.width - LayoutInfo.imageSize) / 2, y: LayoutInfo.imageMargin, width: LayoutInfo.imageSize, height: LayoutInfo.imageSize)
        
        view.addSubview(actionButton)
        actionButton.frame = CGRect(x: (view.bounds.size.width - LayoutInfo.buttonWidth) / 2, y: LayoutInfo.buttonMargin, width: LayoutInfo.buttonWidth, height: LayoutInfo.buttonHeight)
    }
    
    // MARK: Actions
    
    @objc private func showIconPicker() {
        var config = SFTintedIconPickerConfiguration()
        config.selectedItem = currentItem
//        config.isColorSelectionEnabled = false
        let picker = SFTintedIconPicker(configuration:config)
        picker.didFinishPicking { [self, unowned picker] item, cancelled in
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            if let item = item {
                self.currentItem = item
                
                self.iconView.refreshWithItem(item)
                
                self.imageView.backgroundColor = item.itemColor.backgroundColor
                self.imageView.image = UIImage(systemName: item.itemSymbol, withConfiguration: iconConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
                picker.dismiss(animated: true, completion: nil)
            }
        }
        present(picker, animated: true, completion: nil)
    }
}

