//
//  DemoItem.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import IGListKit

class DemoItem: NSObject {
    
    let name: String
    let controllerClass: UIViewController.Type
    let controllerIdentifier: String?
    
    init(
        name: String,
        controllerClass: UIViewController.Type,
        controllerIdentifier: String? = nil
        ) {
        self.name = name
        self.controllerClass = controllerClass
        self.controllerIdentifier = controllerIdentifier
    }

}

extension DemoItem: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? DemoItem else { return false }
        return controllerClass == object.controllerClass && controllerIdentifier == object.controllerIdentifier
    }
    
}
