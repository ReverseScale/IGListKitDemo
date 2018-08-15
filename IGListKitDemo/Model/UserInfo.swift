//
//  UserInfo.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//
import IGListKit

final class UserInfo: ListDiffable {
    
    let pk: Int
    let name: String
    let handle: String
    
    init(pk: Int, name: String, handle: String) {
        self.pk = pk
        self.name = name
        self.handle = handle
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return pk as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? UserInfo else { return false }
        return name == object.name && handle == object.handle
    }
    
}
