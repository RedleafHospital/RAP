//
//  MainScreenViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/28.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SideBarDelegate {
    let functionItems = MainScreenModel().items
    let functionItemInset = UIEdgeInsets(top: 55, left: 20, bottom: 10, right: 20)
    let itemClickDuration: NSTimeInterval = 0.3
    let numberOfOneRow: CGFloat = 3
    
    var sideBar: SideBar?
    var tapGesture: UITapGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDefaultProperty()
        setupSideBar()
    }
    
    func tapHandle(tapGesture: UITapGestureRecognizer){
        sideBar?.showSideBar(false)
        self.view.removeGestureRecognizer(tapGesture)
    }
    
    func setupSideBar(){
        sideBar = SideBar(sourceView: self.parentViewController!.view, menu: ["第一项", "第二项", "第三项"])
        sideBar?.delegate = self
    }
    
    func sideBarWillClose(){
        //解决侧滑收入后，点击时间没有清除的问题
        if let gesture = tapGesture{
            self.view.removeGestureRecognizer(gesture)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let width = (self.view.bounds.width - functionItemInset.left - functionItemInset.right - 20) / numberOfOneRow
        return CGSizeMake(width, width)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Main Screen Collection Cell", forIndexPath: indexPath) as! MainScreenCollectionViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.whiteColor().CGColor
        cell.layer.cornerRadius = cell.bounds.width / 2
        cell.selectedBackgroundView = UIView(frame: cell.frame)
        cell.selectedBackgroundView!.backgroundColor = UIColor.darkPinkColor()
        
        cell.logoImageView.image = UIImage(named: functionItems[indexPath.row].logoImageURL
        )
        cell.logoLabel.text = functionItems[indexPath.row].logoLabelText
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        UIView.animateWithDuration(itemClickDuration) {
            cell?.transform = CGAffineTransformMakeScale(2, 2)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        UIView.animateWithDuration(itemClickDuration) {
            cell?.transform = CGAffineTransformMakeScale(1, 1)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let itemController = self.storyboard?.instantiateViewControllerWithIdentifier(functionItems[indexPath.row].viewControllerName)
        itemController?.navigationItem.title = functionItems[indexPath.row].logoLabelText
        self.navigationController?.pushViewController(itemController!, animated: true)
    }
    
    @IBAction func clickMenu(sender: UIBarButtonItem) {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainScreenViewController.tapHandle(_:)))
        self.view.addGestureRecognizer(tapGesture!)
        
        sideBar?.showSideBar(true)
    }
    
    func didSelectedSideBarItem(index: Int){
        print(index)
    }
    
    deinit{
        print("MainScreenViewController deinit")
    }

}
