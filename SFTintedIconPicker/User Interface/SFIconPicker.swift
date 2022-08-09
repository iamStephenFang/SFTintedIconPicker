//
//  SFIconPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

class SFIconPicker : UIView {
    
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
    
    private static let symbols: [String] = {
        guard let path = Bundle.local.path(forResource: "sfsymbols", ofType: "txt"),
              let content = try? String(contentsOfFile: path)
        else {
            return []
        }
        return content
            .split(separator: "\n")
            .map { String($0) }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(SFIconPickerCell.self, forCellWithReuseIdentifier: SFIconPickerCell.identifier)
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        collectionView.frame = CGRect(x: SFTintedConfig.layoutInfos.iconPickerHorizontalPadding, y: SFTintedConfig.layoutInfos.iconPickerVerticalPadding, width: frame.size.width - 2 * SFTintedConfig.layoutInfos.iconPickerHorizontalPadding, height: frame.size.height - 2 * SFTintedConfig.layoutInfos.iconPickerVerticalPadding)
    }
}

extension SFIconPicker : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SFIconPicker : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SFIconPicker.symbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SFIconPickerCell.identifier, for: indexPath) as! SFIconPickerCell
        cell.setupSymbol(SFIconPicker.symbols[indexPath.item])
        return cell
    }
}

extension SFIconPicker : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SFTintedConfig.sizes.pickIconSize.rect
    }
}
