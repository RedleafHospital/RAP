//
//  SideBar.swift
//  SideBar
//
//  Created by 刘颖奥 on 16/5/20.
//  Copyright © 2016年 刘颖奥. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate{
    func didSelectedSideBarItem(index: Int)
    optional func sideBarWillOpen()
    optional func sideBarWillClose()
}

class SideBar: NSObject, SideBarTableViewContrillerDelegate {
    let barWidth: CGFloat = 150.0
    let sideBarTableViewTopInset: CGFloat = 64.0
    let sideBarContainerView: UIView = UIView()
    let sideBarTableViewController: SideBarTableViewController = SideBarTableViewController()
    
    var originView: UIView!
    var animator: UIDynamicAnimator!
    var delegate: SideBarDelegate?
    var isSideBarOpen: Bool = false
    
    private override init(){
        super.init()
    }
    
    init(sourceView: UIView, menu: [String]){
        super.init()
        
        self.originView = sourceView
        sideBarTableViewController.tableData = menu
        animator = UIDynamicAnimator(referenceView: originView)
        
        let showGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleGesture(_:)))
        showGestureRecognizer.direction = .Right
//        originView.addGestureRecognizer(showGestureRecognizer)
        
        let hideGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleGesture(_:)))
        hideGestureRecognizer.direction = .Left
        originView.addGestureRecognizer(hideGestureRecognizer)
        
        setup()
    }
    
    func setup(){
        sideBarContainerView.frame = CGRectMake(-barWidth - 1, originView.frame.origin.y, barWidth, originView.frame.size.height)
        sideBarContainerView.backgroundColor = UIColor.clearColor()
//        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = sideBarContainerView.bounds
        sideBarContainerView.addSubview(blurView)
        
        sideBarTableViewController.delegate = self
        sideBarTableViewController.tableView.frame = sideBarContainerView.bounds
//        sideBarTableViewController.tableView.clipsToBounds = false
        sideBarTableViewController.tableView.separatorStyle = .None
        sideBarTableViewController.tableView.backgroundColor = UIColor.clearColor()
        sideBarTableViewController.tableView.scrollsToTop = false
        sideBarTableViewController.tableView.contentInset = UIEdgeInsets(top: sideBarTableViewTopInset, left: 0, bottom: 0, right: 0)
        sideBarTableViewController.tableView.reloadData()
        sideBarContainerView.addSubview(sideBarTableViewController.tableView)
    }
    
    func sideBarDidSelectRow(index: NSIndexPath){
        delegate?.didSelectedSideBarItem(index.row)
    }
    
    func handleGesture(recognizer: UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.Left{
            showSideBar(false)
            self.delegate?.sideBarWillClose?()
        }else{
            showSideBar(true)
            self.delegate?.sideBarWillClose?()
        }
    }
    
    func showSideBar(shouldOpen: Bool){
        self.animator?.removeAllBehaviors()
        self.isSideBarOpen = shouldOpen
        
        let gravityX: CGFloat = isSideBarOpen ? 2.5 : -2.5
        let magnitude: CGFloat = isSideBarOpen ? 40 : -40
        let boundryX: CGFloat = isSideBarOpen ? barWidth : -barWidth - 1
        
        let gravity = UIGravityBehavior(items: [sideBarContainerView])
        gravity.gravityDirection = CGVector(dx: gravityX, dy: 0)
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [sideBarContainerView])
        collision.addBoundaryWithIdentifier("SideBarBoundry", fromPoint: CGPoint(x: boundryX, y: originView.frame.origin.y), toPoint: CGPoint(x: boundryX, y: originView.frame.size.height))
        animator.addBehavior(collision)
        
        let pushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = magnitude
        animator.addBehavior(pushBehavior)
        
        let dynamicItem = UIDynamicItemBehavior(items: [sideBarContainerView])
        dynamicItem.elasticity = 0.2
        animator.addBehavior(dynamicItem)
    }
}
