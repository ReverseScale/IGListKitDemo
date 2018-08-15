//
//  DemosViewController.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import IGListKit
import UIKit

class DemosViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let demos: [DemoItem] = [
        DemoItem(name: "Tail Loading",
                 controllerClass: LoadMoreViewController.self),
        DemoItem(name: "Image Info",
                 controllerClass: ImageInfoViewController.self),
        DemoItem(name: "Stacked List",
                 controllerClass: StackedViewController.self),
        DemoItem(name: "Mixed Data",
                 controllerClass: MixedDataViewController.self),
    ]
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Demos"
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DemosViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return demos
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DemoSection()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
