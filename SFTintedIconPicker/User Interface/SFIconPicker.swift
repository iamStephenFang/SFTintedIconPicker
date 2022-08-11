//
//  SFIconPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

protocol SFIconPickerDelegate: AnyObject {
    func didSelectSymbol(_ symbol: String)
}

class SFIconPicker : UIView {
    
    fileprivate lazy var collectionView : UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = SFTintedConfig.layoutInfos.iconPickerMinimumLineSpacing
        layout.minimumInteritemSpacing = SFTintedConfig.layoutInfos.iconPickerMinimumInteritemSpacing
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    } ()
    
    fileprivate lazy var searchBar: UISearchBar = {
        $0.backgroundColor = SFTintedConfig.colors.searchBarBackgroundColor
        $0.searchTextField.textColor = SFTintedConfig.colors.searchBarPlaceholderTextColor
        $0.placeholder = SFTintedConfig.titles.searchBarPlaceHolder
        return $0
    }(UISearchBar())

    public weak var iconPickerDelegate: SFIconPickerDelegate?
    
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
        
        addSubview(searchBar)
        
        addSubview(collectionView)
        collectionView.register(SFIconPickerCell.self, forCellWithReuseIdentifier: SFIconPickerCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        searchBar.frame = CGRect(x: SFTintedConfig.layoutInfos.searchBarHorizontalPadding, y: SFTintedConfig.layoutInfos.searchBarTopPadding, width: frame.size.width - 2 * SFTintedConfig.layoutInfos.searchBarHorizontalPadding, height: SFTintedConfig.layoutInfos.searchBarHeight)
        
        collectionView.frame = CGRect(x: SFTintedConfig.layoutInfos.iconPickerHorizontalPadding, y: searchBar.frame.maxY + SFTintedConfig.layoutInfos.iconPickerTopPadding, width: frame.size.width - 2 * SFTintedConfig.layoutInfos.iconPickerHorizontalPadding, height: collectionViewHeight())
    }
    
    private func collectionViewHeight() -> CGFloat {
        let columnCount = CGFloat(6)
        let symbolCount = CGFloat(SFIconPicker.symbols.count)
        let rowCount = CGFloat(ceil(symbolCount / columnCount))
        return rowCount * SFTintedConfig.sizes.pickIconSize + (rowCount - 1) * SFTintedConfig.layoutInfos.iconPickerMinimumLineSpacing
    }
    
    public func height() -> CGFloat {
        return collectionViewHeight() + SFTintedConfig.layoutInfos.iconPickerBottomPadding + SFTintedConfig.layoutInfos.iconPickerTopPadding + SFTintedConfig.layoutInfos.searchBarTopPadding + SFTintedConfig.layoutInfos.searchBarHeight
    }
}

extension SFIconPicker : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        iconPickerDelegate?.didSelectSymbol(SFIconPicker.symbols[indexPath.item])
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
        return CGSize(width: SFTintedConfig.sizes.pickIconSize, height: SFTintedConfig.sizes.pickIconSize)
    }
}
