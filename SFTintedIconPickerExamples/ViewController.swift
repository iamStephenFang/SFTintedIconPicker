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
    static let buttonHeight = CGFloat(50.0)
    static let buttonWidth = CGFloat(120.0)
    static let buttonMargin = CGFloat(350.0)
}

class ViewController: UIViewController {
    
    fileprivate lazy var actionButton: UIButton = {
        $0.setTitle("Customize", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(showIconPicker), for: .touchUpInside)
        return $0
    } (UIButton(type: .custom))
    
    private lazy var iconView: UIImageView = {
        $0.backgroundColor = UIColor.red
        $0.contentMode = .center
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(iconView)
        iconView.frame = CGRect(x: (view.bounds.size.width - LayoutInfo.iconSize) / 2, y: LayoutInfo.iconMargin, width: LayoutInfo.iconSize, height: LayoutInfo.iconSize)
        
        view.addSubview(actionButton)
        actionButton.frame = CGRect(x: (view.bounds.size.width - LayoutInfo.buttonWidth) / 2, y: LayoutInfo.buttonMargin, width: LayoutInfo.buttonWidth, height: LayoutInfo.buttonHeight)
    }
    
    // MARK: Actions
    
    @objc private func showIconPicker() {
        let config = SFTintedIconPickerConfiguration()
        let picker = SFTintedIconPicker(configuration:config)
        picker.didFinishPicking { [self, unowned picker] item, cancelled in
            if let item = item {
                self.iconView.backgroundColor = item.iconColor.backgroundColor
                self.iconView.image = UIImage(systemName: item.iconName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
            }
            if cancelled {
                print("Picker was canceled")
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}

