//
//  ViewController.swift
//  SFTintedIconPickerExamples
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit
import SFTintedIconPicker

enum LayoutInfo {
    static let buttonHeight = CGFloat(50.0)
    static let buttonWidth = CGFloat(120.0)
    static let buttonMargin = CGFloat(300.0)
}

class ViewController: UIViewController {

    fileprivate lazy var actionButton : UIButton = {
        $0.setTitle("Customize", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(showIconPicker), for: .touchUpInside)
        return $0
    } (UIButton(type: .system))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(actionButton)
        actionButton.frame = CGRect(x: (view.bounds.size.width - LayoutInfo.buttonWidth) / 2, y: LayoutInfo.buttonMargin, width: LayoutInfo.buttonWidth, height: LayoutInfo.buttonHeight)
    }
    
    // MARK: Actions
    
    @objc private func showIconPicker() {
        let config = SFTintedIconPickerConfiguration()
        let picker = SFTintedIconPicker(configuration:config)
        present(picker, animated: true, completion: nil)
    }
}

