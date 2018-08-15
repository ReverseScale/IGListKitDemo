//
//  DemoSectionView.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import IGListKit

import UIKit

class DemoSection: ListSectionController {
    
    private var object: DemoItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = object?.name
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? DemoItem
    }
    
    override func didSelectItem(at index: Int) {
        if let identifier = object?.controllerIdentifier {
            let storyboard = UIStoryboard(name: "Demo", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: identifier)
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        } else if let controller = object?.controllerClass.init() {
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
