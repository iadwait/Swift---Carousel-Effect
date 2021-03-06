//
//  ViewController.swift
//  Carousel Effect
//
//  Created by Adwait Barkale on 04/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

struct CVModel{
    
    var title: String = ""
    var image: UIImage!
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var imageBack: UIImageView!
    
    
    
    var arrData:[CVModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
            collectionView.delegate = self
            collectionView.dataSource = self
        
        cvData()
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        collectionView.collectionViewLayout = flowLayout
    }
    
    func cvData()
    {
        arrData = [
            CVModel(title: "Trees", image: UIImage(named: "aa")),
            CVModel(title: "Water", image: UIImage(named: "bb")),
            CVModel(title: "Waterfall", image: UIImage(named: "cc")),
            CVModel(title: "Buildings", image: UIImage(named: "dd")),
            CVModel(title: "Evening",image: UIImage(named: "ee")),
            CVModel(title: "SunSet", image: UIImage(named: "ff")),
            CVModel(title: "Fire", image: UIImage(named: "gg"))
        ]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("page at centre = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = arrData[indexPath.row].image
        cell.lblTitle.text = arrData[indexPath.row].title
        print(indexPath.row)
        let ch = indexPath.row - 1
        switch ch {
        case 0:
            updateData(name: "Trees", location: "India", desc: "Image Contains Trees and a Sunset", image: arrData[indexPath.row].image)
        case 1:
            updateData(name: arrData[ch].title, location: "England", desc: "Image Containg Water and Stones.", image: arrData[indexPath.row].image)
        case 2:
            updateData(name: arrData[ch].title, location: "Australia", desc: "Image Contains Waterfall which is in Australia", image: arrData[indexPath.row].image)
        case 3:
           updateData(name: arrData[ch].title, location: "Canada", desc: "This are Buildings present in Canada", image: arrData[indexPath.row].image)
        case 4:
            updateData(name: arrData[ch].title, location: "Srilanka", desc: "This Image Contains an Evening pic clicked in Srilanka", image: arrData[indexPath.row].image)
        case 5:
         updateData(name: arrData[ch].title, location: "Dubai", desc: "Clicked in Dubai", image: arrData[indexPath.row].image)
        case 6:
             updateData(name: arrData[ch].title, location: "Mexico", desc: "Fire burn in dubai", image: arrData[indexPath.row].image)
        default:
          break
            
        }
        return cell
    }
    
    func updateData(name: String,location: String,desc:String,image:UIImage)
    {
        lblName.text = "Place Name = \(name)"
        lblLocation.text = "Place Location = \(location)"
        txtDesc.text = "Description - \(desc)"
        imageBack.image = image
        
    }
    
}
