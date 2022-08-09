//
//  Bundle+Extensions.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/4.
//

import UIKit

extension Bundle {
    static var local: Bundle {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }
}

private class BundleToken {}
