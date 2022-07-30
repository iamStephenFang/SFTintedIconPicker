//
//  SFTintedIconPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/28.
//

import UIKit


public protocol SFTintedIconPickerDelegate: AnyObject {

}

open class SFTintedIconPicker: UINavigationController {
    
    public typealias DidFinishPickingCompletion = (_ items: [SFTintedItem], _ cancelled: Bool) -> Void
    
    // MARK: - Public
    
    public func didFinishPicking(completion: @escaping DidFinishPickingCompletion) {
        _didFinishPicking = completion
    }
    
    /// Get a SFTintedIconPicker instance with the default configuration.
    public convenience init() {
        self.init(configuration: SFTintedIconPickerConfiguration())
    }

    /// Get a SFTintedIconPicker with the specified configuration.
    public required init(configuration: SFTintedIconPickerConfiguration) {
        picker = SFTintedIconPickerVC()
        super.init(nibName: nil, bundle: nil)
//        picker.pickerVCDelegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    // MARK: - Private
    
    private var _didFinishPicking: DidFinishPickingCompletion?
    
    private let picker: SFTintedIconPickerVC!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = SFTintedConfig.title
    }
    
    deinit {
        print("SFTintedIconPicker deinit")
    }
}


