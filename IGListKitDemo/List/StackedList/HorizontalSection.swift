//
//  HorizontalSection.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit

import UIKit

class HorizontalSection: ListSectionController {
    private var number: Int?
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: HorizontalCell.self, for: self, at: index) as? HorizontalCell else {
            fatalError()
        }
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
        number = object as? Int
    }
}
extension HorizontalSection: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let number = number else { return [] }
        return (0..<number).map { $0 as ListDiffable }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return BlocksSection()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
