//
//  UserSection.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit

import UIKit

class UserSection: ListSectionController {
    private var user: UserInfo?
    private let isReorderable: Bool
    
    required init(isReorderable: Bool = false) {
        self.isReorderable = isReorderable
        super.init()
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: UserCell.self, for: self, at: index) as? UserCell else {
            fatalError()
        }
        cell.title = user?.name
        cell.detail = "@" + (user?.handle ?? "")
        return cell 
    }
    
    override func didUpdate(to object: Any) {
        self.user = object as? UserInfo
    }
    
    override func canMoveItem(at index: Int) -> Bool {
        return isReorderable
    }
}
