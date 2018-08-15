//
//  GridItem.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import IGListKit

final class GridItem: NSObject {
    
    let color: UIColor
    let itemCount: Int
    
    var items: [String] = []
    
    init(color: UIColor, itemCount: Int) {
        self.color = color
        self.itemCount = itemCount
        
        super.init()
        
        self.items = computeItems()
    }
    
    private func computeItems() -> [String] {
        return [Int](1...itemCount).map {
            String(describing: $0)
        }
    }
}

extension GridItem: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self === object ? true : self.isEqual(object)
    }
    
}
