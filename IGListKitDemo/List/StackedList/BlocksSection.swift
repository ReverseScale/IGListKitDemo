//
//  BlocksSection.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit
import UIKit

class BlocksSection: ListSectionController {
    
    private var number: Int?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: height, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as? CenterLabelCell else {
            fatalError()
        }
        let value = number ?? 0
        cell.text = "\(value + 1)"
        cell.backgroundColor = UIColor(red: 237 / 255.0, green: 73 / 255.0, blue: 86 / 255.0, alpha: 1)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        number = object as? Int
    }
    
}

