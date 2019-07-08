//
//  DetailHeaderCell.swift
//  SimpleTest
//
//  Created by IRFAN TRIHANDOKO on 03/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class DetailHeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView?
    var supView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.accessibilityIdentifier = "collectionView"
    }
    
}

extension DetailHeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func configView(view: UIView) {
        supView = view
        collectionView?.register(UINib(nibName: "DetailHeaderItemCell", bundle: nil), forCellWithReuseIdentifier: "DetailHeaderItemCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func headerView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailHeaderItemCell", for: indexPath) as! DetailHeaderItemCell
        cell.indexLbl.text = "\(indexPath.item + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = headerView(collectionView, cellForItemAt: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 10.0
        let width = (collectionView.frame.width - leftAndRightPaddings) / 1.25
        return CGSize(width: width, height: (supView?.frame.height ?? 0.0)/3)
    }
}
