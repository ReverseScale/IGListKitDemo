//
//  LoadMoreSectionView.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit
import UIKit

class LoadMoreSection: ListSectionController {
    
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 75)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
}
