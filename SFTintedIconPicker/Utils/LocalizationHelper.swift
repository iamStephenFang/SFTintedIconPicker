//
//  LocalizationHelper.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/11.
//

import Foundation

internal func localizedStringInSFTintedIconPicker(_ str: String) -> String {
    
    let localizedStrNotFound = "SFTintedIconPickerLocalizedStringNotFound"
    
    var localizedStr = Bundle.main.localizedString(forKey: str, value: localizedStrNotFound, table: "SFTintedIconPickerLocalizable")
    if (localizedStr == localizedStrNotFound) {
        localizedStr = Bundle.local.localizedString(forKey: str, value: "", table: "SFTintedIconPickerLocalizable")
    }
    return localizedStr
}
