//
//  GridController.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit
import UIKit

class GridSection: ListSectionController {
    private var object: GridItem?
    private let isReorderable: Bool
    
    required init(isReorderable: Bool = false) {
        self.isReorderable = isReorderable
        super.init()
        self.minimumInteritemSpacing = 1
        self.minimumLineSpacing = 1
    }
    
    override func numberOfItems() -> Int {
        return object?.itemCount ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = floor(width / 4)
        return CGSize(width: itemSize, height: itemSize)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as? CenterLabelCell else {
            fatalError()
        }
        cell.text = object?.items[index] ?? "undefined"
        cell.backgroundColor = object?.color
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? GridItem
    }
    
    override func canMoveItem(at index: Int) -> Bool {
        return isReorderable
    }
    
    override func moveObject(from sourceIndex: Int, to destinationIndex: Int) {
        guard let object = object else { return }
        let item = object.items.remove(at: sourceIndex)
        object.items.insert(item, at: destinationIndex)
    }
}
