//
//  UserCell.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    fileprivate let padding: CGFloat = 15.0
    
    lazy private var titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 17)
        view.textColor = .darkText
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy private var detailLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .right
        view.font = .systemFont(ofSize: 17)
        view.textColor = .lightGray
        self.contentView.addSubview(view)
        return view
    }()
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var detail: String? {
        get {
            return detailLabel.text
        }
        set {
            detailLabel.text = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = contentView.bounds.insetBy(dx: padding, dy: 0)
        titleLabel.frame = frame
        detailLabel.frame = frame
    }
}
