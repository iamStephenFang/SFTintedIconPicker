//
//  SFColorPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/29.
//

import UIKit

protocol SFColorPickerDelegate: AnyObject {
    func didSelectColor(_ color: SFTintedColor)
    func didSelectColorPicker()
}

class SFColorPicker: UIView {
    
    fileprivate lazy var collectionView : UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = SFTintedConfig.layoutInfos.colorPickerMinimumLineSpacing
        layout.minimumInteritemSpacing = SFTintedConfig.layoutInfos.colorPickerMinimumInteritemSpacing
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    } ()
    
    public weak var colorPickerDelegate: SFColorPickerDelegate?
    
    required init(color: SFTintedColor) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = SFTintedConfig.colors.colorPickerAreaBackgroundColor
        
        addSubview(collectionView)
        collectionView.register(SFColorPickerCell.self, forCellWithReuseIdentifier: SFColorPickerCell.identifier)
        
        if let selectIndex = SFTintedConfig.colors.providedColors.firstIndex(of: color) {
            collectionView.selectItem(at: IndexPath(item: selectIndex, section: 0), animated: false, scrollPosition: .top)
        } else if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            collectionView.selectItem(at: IndexPath(item: SFTintedConfig.colors.providedColors.count, section: 0), animated: false, scrollPosition: .top)
        } else {
            debugInfoForIconPicker("Cannot find color \(color)")
            collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = CGRect(x: SFTintedConfig.layoutInfos.colorPickerHorizontalPadding, y: SFTintedConfig.layoutInfos.colorPickerVerticalPadding, width: frame.size.width - 2 * SFTintedConfig.layoutInfos.colorPickerHorizontalPadding, height: collectionViewHeight())
    }
    
    private func collectionViewHeight() -> CGFloat {
        let columnCount = CGFloat(6)
        let colorCount = CGFloat(SFTintedConfig.colors.providedColors.count)
        let rowCount = CGFloat(ceil(colorCount / columnCount))
        return rowCount * SFTintedConfig.sizes.colorIconSize + (rowCount - 1) * SFTintedConfig.layoutInfos.colorPickerMinimumLineSpacing
    }
    
    public func height() -> CGFloat {
        return collectionViewHeight() + SFTintedConfig.layoutInfos.colorPickerVerticalPadding * 2
    }
}

extension SFColorPicker: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            return SFTintedConfig.colors.providedColors.count + 1
        } else {
            return SFTintedConfig.colors.providedColors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SFColorPickerCell.identifier, for: indexPath) as! SFColorPickerCell
        
        if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            if indexPath.item != SFTintedConfig.colors.providedColors.count {
                cell.setupColor(SFTintedConfig.colors.providedColors[indexPath.item])
            } else {
                let rainbowColor : [UIColor] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
                let tintColor = SFTintedColor(backgroundGradientColors: rainbowColor)
                cell.setupColor(tintColor)
            }
        } else {
            cell.setupColor(SFTintedConfig.colors.providedColors[indexPath.item])
        }
        
        return cell
    }
}
                            
extension SFColorPicker: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            if indexPath.item == SFTintedConfig.colors.providedColors.count {
                colorPickerDelegate?.didSelectColorPicker()
            } else {
                colorPickerDelegate?.didSelectColor(SFTintedConfig.colors.providedColors[indexPath.item])
            }
        } else {
            colorPickerDelegate?.didSelectColor(SFTintedConfig.colors.providedColors[indexPath.item])
        }
    }
}

extension SFColorPicker: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SFTintedConfig.sizes.colorIconSize, height: SFTintedConfig.sizes.colorIconSize)
    }
}
