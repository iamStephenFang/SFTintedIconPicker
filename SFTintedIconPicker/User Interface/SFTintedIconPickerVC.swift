//
//  SFTintedIconPickerVC.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

open class SFTintedIconPickerVC: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpPickerStyle()
        setUpIconPresentation()
        setUpColorSelection()
        setUpSymbolCollection()
    }
    
    private func setUpPickerStyle() {
        view.backgroundColor = SFTintedConfig.colors.pickerBackgroundColor
    }
    
    private func setUpIconPresentation() {
        
    }
    
    private func setUpColorSelection() {
        
    }
    
    private func setUpSymbolCollection() {
        
    }
}
