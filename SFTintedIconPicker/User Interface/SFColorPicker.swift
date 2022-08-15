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
        layout.minimumLineSpacing = SFTintedConfig.colorPickerConfig.lineSpacing
        layout.minimumInteritemSpacing = SFTintedConfig.colorPickerConfig.interitemSpacing
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: SFTintedConfig.colorPickerConfig.verticalPadding, left: SFTintedConfig.colorPickerConfig.horizontalPadding, bottom: SFTintedConfig.colorPickerConfig.verticalPadding, right: SFTintedConfig.colorPickerConfig.horizontalPadding)
        return collectionView
    } ()
    
    public weak var colorPickerDelegate: SFColorPickerDelegate?
    
    required init(color: SFTintedColor) {
        super.init(frame: CGRect.zero)
        
        addSubview(collectionView)
        collectionView.register(SFColorPickerCell.self, forCellWithReuseIdentifier: SFColorPickerCell.identifier)
        
        backgroundColor = SFTintedConfig.colors.colorPickerAreaBackgroundColor
        
        if let selectIndex = SFTintedConfig.providedColors.firstIndex(of: color) {
            collectionView.selectItem(at: IndexPath(item: selectIndex, section: 0), animated: false, scrollPosition: .top)
        } else if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            collectionView.selectItem(at: IndexPath(item: SFTintedConfig.providedColors.count, section: 0), animated: false, scrollPosition: .top)
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
        
        collectionView.frame = bounds
    }
    
    // MARK: - Public
    
    public func height() -> CGFloat {
        return collectionView.collectionViewLayout.collectionViewContentSize.height + SFTintedConfig.colorPickerConfig.verticalPadding * 2
    }
    
    // MARK: - Private
 
    private func itemSize() -> CGFloat {
        let collectionViewWidth = frame.size.width - SFTintedConfig.colorPickerConfig.horizontalPadding * 2
        let numbersPerRow = CGFloat(SFTintedConfig.colorPickerConfig.numberOfItemsInRow)
        let itemsWidth = collectionViewWidth - (numbersPerRow - 1) * SFTintedConfig.colorPickerConfig.lineSpacing
        return floor(itemsWidth / numbersPerRow)
    }
}

extension SFColorPicker: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            return SFTintedConfig.providedColors.count + 1
        } else {
            return SFTintedConfig.providedColors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SFColorPickerCell.identifier, for: indexPath) as! SFColorPickerCell
        
        if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            if indexPath.item != SFTintedConfig.providedColors.count {
                cell.setupColor(SFTintedConfig.providedColors[indexPath.item])
            } else {
                let rainbowColor : [UIColor] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
                let tintColor = SFTintedColor(backgroundGradientColors: rainbowColor)
                cell.setupColor(tintColor)
            }
        } else {
            cell.setupColor(SFTintedConfig.providedColors[indexPath.item])
        }
        
        return cell
    }
}
                            
extension SFColorPicker: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 14.0, *), SFTintedConfig.showSystemColorPicker {
            if indexPath.item == SFTintedConfig.providedColors.count {
                colorPickerDelegate?.didSelectColorPicker()
            } else {
                colorPickerDelegate?.didSelectColor(SFTintedConfig.providedColors[indexPath.item])
            }
        } else {
            colorPickerDelegate?.didSelectColor(SFTintedConfig.providedColors[indexPath.item])
        }
    }
}

extension SFColorPicker: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemSize(), height: itemSize())
    }
}
