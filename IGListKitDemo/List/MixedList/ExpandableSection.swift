//
//  ExpandableSection.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit

import UIKit

class ExpandableSection: ListSectionController {
    private var expanded = false
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext!.containerSize.width
        let height = expanded ? LabelCell.textHeight(object ?? "", width: width) : LabelCell.singleLineHeight
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? String
    }
    
    override func didSelectItem(at index: Int) {
        expanded = !expanded
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.6,
                       options: [],
                       animations: {
                        self.collectionContext?.invalidateLayout(for: self)
        })
    }
}
