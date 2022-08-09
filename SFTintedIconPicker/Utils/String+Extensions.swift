//
//  String+Extensions.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/9.
//

import Foundation

extension String {
    
    func localizedInPicker(key: String, withComment comment: String = "") -> String {
        return NSLocalizedString(key,
                                 tableName: "SFTintedIconPickerLocalizable",
                                 bundle: Bundle.local,
                                 value: "",
                                 comment: comment)
    }
}
