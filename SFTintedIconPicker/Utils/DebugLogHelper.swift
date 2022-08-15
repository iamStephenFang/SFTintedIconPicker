//
//  DebugLogHelper.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/8/15.
//

import Foundation

internal func debugInfoForIconPicker(_ description: String,
                                     fileName: String = #file,
                                     lineNumber: Int = #line,
                                     functionName: String = #function) {
    guard SFTintedConfig.isDebugLogsEnabled else {
        return
    }
    
    print("SFTintedIconPicker Debug Info: \(fileName.components(separatedBy: "/").last!) -> \(functionName) -> \(description) (line: \(lineNumber))")
}
