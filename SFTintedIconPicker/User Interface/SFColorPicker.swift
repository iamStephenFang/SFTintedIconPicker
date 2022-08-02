//
//  SFColorPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

class SFColorPicker: UICollectionView {
    
    // MARK: - Public
    
    func height() -> CGFloat {
        return 200
    }
    
    // MARK: - Private
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = SFTintedConfig.colors.colorPickerAreaBackgroundColor
        register(SFColorPickerCell.self, forCellWithReuseIdentifier: SFColorPickerCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfItems(inSection section: Int) -> Int {
        return SFTintedConfig.colors.providedColors.count + 1
    }

    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = dequeueReusableCell(withReuseIdentifier: SFColorPickerCell.identifier, for: indexPath) as! SFColorPickerCell
        if indexPath.item != SFTintedConfig.colors.providedColors.count {
            cell.setupColor(SFTintedConfig.colors.providedColors[indexPath.item])
        } else {
            cell.setupPicker()
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition) {
        
    }
    
}
