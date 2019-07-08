//
//  DetailVC.swift
//  UnitTesting
//
//  Created by IRFAN TRIHANDOKO on 02/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class DetailVC: BaseController {
    
    @IBOutlet weak var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
}

// MARK: Config View
extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func configView() {
        collectionView?.register(UINib(nibName: "DetailHeaderCell", bundle: nil), forCellWithReuseIdentifier: "DetailHeaderCell")
        collectionView?.register(UINib(nibName: "DetailSliderCell", bundle: nil), forCellWithReuseIdentifier: "DetailSliderCell")
        collectionView?.register(UINib(nibName: "DetailReviewsCell", bundle: nil), forCellWithReuseIdentifier: "DetailReviewsCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 2 ? 5 : 1
    }
    
    func headerView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailHeaderCell", for: indexPath) as! DetailHeaderCell
        cell.configView(view: view)
        return cell
    }
    
    func sliderView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailSliderCell", for: indexPath) as! DetailSliderCell
        cell.delegate = self
        cell.setupData()
        return cell
    }
    
    func reviewView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailReviewsCell", for: indexPath) as! DetailReviewsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 1:
            let cell = sliderView(collectionView, cellForItemAt: indexPath)
            return cell
        case 2:
            let cell = reviewView(collectionView, cellForItemAt: indexPath)
            return cell
        default:
            let cell = headerView(collectionView, cellForItemAt: indexPath) 
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 1:
            return CGSize(width: view.frame.width, height: 150.0)
        case 2:
            return CGSize(width: view.frame.width, height: 70.0)
        default: // HEADER
            return CGSize(width: view.frame.width, height: view.frame.height/3)
        }
    }
}

// MARK: - Write Delegate
extension DetailVC: DetailSliderDelegate {
    func write() {
        let nav = UIStoryboard(name: "WriteReview", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(nav, animated: true, completion: nil)
    }
}
