//
//  SFColorPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

class SFColorPicker: UIView {
    
    fileprivate lazy var collectionView : UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.backgroundColor = SFTintedConfig.colors.colorPickerAreaBackgroundColor
        collectionView.register(SFColorPickerCell.self, forCellWithReuseIdentifier: SFColorPickerCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func height() -> CGFloat {
        return 200
    }
    
}

extension SFColorPicker: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if #available(iOS 14.0, *) {
            return SFTintedConfig.colors.providedColors.count + 1
        } else {
            return SFTintedConfig.colors.providedColors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SFColorPickerCell.identifier, for: indexPath) as! SFColorPickerCell
        
        if #available(iOS 14.0, *) {
            if indexPath.item != SFTintedConfig.colors.providedColors.count {
                cell.setupColor(SFTintedConfig.colors.providedColors[indexPath.item])
            } else {
                cell.setupPicker()
            }
        } else {
            cell.setupColor(SFTintedConfig.colors.providedColors[indexPath.item])
        }
        
        return cell
    }
}
                            
extension SFColorPicker: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 14.0, *) {
            if indexPath.item != SFTintedConfig.colors.providedColors.count {

            } else {
//                present(UIColorPickerViewController(), animated: true)
            }
        } else {

        }
    }
}

extension SFColorPicker: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SFTintedConfig.sizes.pickIconSize.rect.width, height: SFTintedConfig.sizes.pickIconSize.rect.height)
    }
}
