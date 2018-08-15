//
//  HorizontalCell.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
    }
    
}
