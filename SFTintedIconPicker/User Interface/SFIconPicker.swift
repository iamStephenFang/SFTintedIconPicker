//
//  SFIconPicker.swift
//  SFTintedIconPicker
//
//  Created by StephenFang on 2022/7/30.
//

import UIKit

protocol SFIconPickerDelegate: AnyObject {
    func didSelectSymbol(_ symbol: String)
    func didSearchKeyword(_ keyword: String)
}

class SFIconPicker: UIView {
    
    fileprivate lazy var collectionView : UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = SFTintedConfig.iconPickerConfig.lineSpacing
        layout.minimumInteritemSpacing = SFTintedConfig.iconPickerConfig.interitemSpacing
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    } ()
    
    fileprivate lazy var searchBar: UISearchBar = {
        $0.searchBarStyle = .minimal
        $0.delegate = self
        $0.backgroundColor = SFTintedConfig.colors.searchBarBackgroundColor
        $0.searchTextField.textColor = SFTintedConfig.colors.searchBarPlaceholderTextColor
        $0.placeholder = SFTintedConfig.titles.searchBarPlaceHolder
        return $0
    } (UISearchBar())

    public weak var iconPickerDelegate: SFIconPickerDelegate?
    
    static let symbols: [String] = {
        guard let path = Bundle.local.path(forResource: "sfsymbols", ofType: "txt"),
              let content = try? String(contentsOfFile: path)
        else { return [] }
        return content
            .split(separator: "\n")
            .map { String($0) }
    }()
    private var filteredSymbols = [String]()
    private var isSearching = false
    
    required init(symbol: String) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = SFTintedConfig.colors.iconPickerAreaBackgroundColor
        
        addSubview(searchBar)
        searchBar.sizeToFit()
        
        addSubview(collectionView)
        
        collectionView.register(SFIconPickerCell.self, forCellWithReuseIdentifier: SFIconPickerCell.identifier)
        if let selectIndex = SFIconPicker.symbols.firstIndex(of: symbol) {
            collectionView.selectItem(at: IndexPath(item: selectIndex, section: 0), animated: false, scrollPosition: .top)
        } else {
            debugInfoForIconPicker("Cannot find symbol \(symbol)")
            collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        searchBar.sizeToFit()
        searchBar.frame = CGRect(x: SFTintedConfig.iconPickerConfig.searchBarHorizontalPadding, y: SFTintedConfig.iconPickerConfig.searchBarTopPadding, width: frame.size.width - 2 * SFTintedConfig.iconPickerConfig.searchBarHorizontalPadding, height: SFTintedConfig.iconPickerConfig.searchBarHeight)

        collectionView.frame = CGRect(x: SFTintedConfig.iconPickerConfig.horizontalPadding, y: searchBar.frame.maxY + SFTintedConfig.iconPickerConfig.topPadding, width: frame.size.width - 2 * SFTintedConfig.iconPickerConfig.horizontalPadding, height: collectionView.collectionViewLayout.collectionViewContentSize.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    public func height() -> CGFloat {
        return collectionView.collectionViewLayout.collectionViewContentSize.height + SFTintedConfig.iconPickerConfig.bottomPadding + SFTintedConfig.iconPickerConfig.topPadding + SFTintedConfig.iconPickerConfig.searchBarTopPadding + SFTintedConfig.iconPickerConfig.searchBarHeight
    }
    
    // MARK: - Private
    
    private func itemSize() -> CGFloat {
        let collectionViewWidth = frame.size.width - SFTintedConfig.iconPickerConfig.horizontalPadding * 2
        let numbersPerRow = CGFloat(SFTintedConfig.iconPickerConfig.numberOfItemsInRow)
        let itemsWidth = collectionViewWidth - (numbersPerRow - 1) * SFTintedConfig.iconPickerConfig.lineSpacing
        return floor(itemsWidth / numbersPerRow)
    }
}

extension SFIconPicker: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        iconPickerDelegate?.didSelectSymbol(SFIconPicker.symbols[indexPath.item])
    }
}

extension SFIconPicker: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filteredSymbols.count
        } else {
            return SFIconPicker.symbols.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SFIconPickerCell.identifier, for: indexPath) as! SFIconPickerCell
        if isSearching {
            cell.setupSymbol(filteredSymbols[indexPath.item])
        } else {
            cell.setupSymbol(SFIconPicker.symbols[indexPath.item])
        }
        return cell
    }
}

extension SFIconPicker: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemSize(), height: itemSize())
    }
}

extension SFIconPicker: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
        } else {
            isSearching = true
            filteredSymbols = SFIconPicker.symbols.filter({$0.contains(searchText.lowercased())})
        }
        collectionView.reloadData()
        iconPickerDelegate?.didSearchKeyword(searchText)
    }
}
