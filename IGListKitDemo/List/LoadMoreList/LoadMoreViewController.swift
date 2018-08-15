//
//  LoadMoreViewController.swift
//  IGListKitDemo
//
//  Created by Steven Xie on 2018/8/15.
//  Copyright © 2018年 Steven Xie. All rights reserved.
//

import IGListKit

import UIKit

class LoadMoreViewController: UIViewController {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "No more data!"
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var items = Array(0...20)
    var loading = false
    let spinToken = "spinner"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.frame
    }
    
    func spinnerSectionController() -> ListSingleSectionController {
        let configureBlock = { (item: Any, cell: UICollectionViewCell) in
            guard let cell = cell as? IndicatorCell else { return }
            cell.activityIndicator.startAnimating()
        }
        
        let sizeBlock = { (item: Any, context: ListCollectionContext?) -> CGSize in
            guard let context = context else { return .zero }
            return CGSize(width: context.containerSize.width, height: 100)
        }
        
        return ListSingleSectionController(cellClass: IndicatorCell.self,
                                           configureBlock: configureBlock,
                                           sizeBlock: sizeBlock)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoadMoreViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = items as [ListDiffable]
        
        if loading {
            objects.append(spinToken as ListDiffable)
        }
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == spinToken {
            return spinnerSectionController()
        } else {
            return LoadMoreSection()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return emptyLabel
    }
    
}

extension LoadMoreViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !loading && distance < 200 {
            loading = true
            adapter.performUpdates(animated: true, completion: nil)
            DispatchQueue.global(qos: .default).async {
                // fake background loading task
                sleep(2)
                DispatchQueue.main.async {
                    self.loading = false
                    let itemCount = self.items.count
                    self.items.append(contentsOf: Array(itemCount..<itemCount + 15))
                    self.adapter.performUpdates(animated: true, completion: nil)
                }
            }
        }
    }
}
