//
//  MainScreenViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/28.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let functionItems = ["1", "2", "3", "4", "5"]
    
    let functionItemInset = UIEdgeInsets(top: 55, left: 20, bottom: 10, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDefaultProperty()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transitionWithView(self.view, duration: 1.5, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: { () -> Void in
            
            }, completion: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return functionItems.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return functionItemInset
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (self.view.bounds.width - functionItemInset.left - functionItemInset.right - 20) / 3
        return CGSizeMake(width, width)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Main Screen Collection Cell", forIndexPath: indexPath) as! MainScreenCollectionViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.whiteColor().CGColor
        cell.layer.cornerRadius = cell.bounds.width / 2
        return cell
    }

}
