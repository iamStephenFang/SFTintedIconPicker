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
    
    public typealias DidFinishPickingCompletion = (_ item: SFTintedItem?, _ cancelled: Bool) -> Void
    
    // MARK: - Public
    
    public func didFinishPicking(completion: @escaping DidFinishPickingCompletion) {
        _didFinishPicking = completion
    }
    
    /// Get a SFTintedIconPicker instance with the default configuration.
    public convenience init() {
        self.init(configuration: SFTintedIconPickerConfiguration.shared)
    }

    /// Get a SFTintedIconPicker with the specified configuration.
    public required init(configuration: SFTintedIconPickerConfiguration) {
        SFTintedIconPickerConfiguration.shared = configuration
        picker = SFTintedIconPickerVC()
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    // MARK: - Private
    
    private var _didFinishPicking: DidFinishPickingCompletion?
    
    private func didSelect(item: SFTintedItem) {
        _didFinishPicking?(item, false)
    }
    
    private let picker: SFTintedIconPickerVC!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [picker]
        
        picker.didClose = { [weak self] in
            self?._didFinishPicking?(nil, true)
        }
        picker.didSelectItem = { [weak self] item in
            self?.didSelect(item: item)
        }
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        } else {
            navigationBar.isTranslucent = false
        }

        navigationBar.tintColor = SFTintedConfig.colors.pickerTintColor
    }
    
    deinit {
        print("SFTintedIconPicker deinit")
    }
}


