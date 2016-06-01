//
//  ResizeNavigationBar.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/24.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class ResizeNavigationBar: UINavigationBar {
    //navigation bar的高度,建议最小88
    private var extraHeight: CGFloat = 88
    //中心偏移量，最小为statusbar的height
    private var titlePositionInset: CGFloat = 20{
        didSet{
            titlePositionInset = titlePositionInset > statusBarFrame.height ?titlePositionInset :statusBarFrame.height
        }
    }
    //状态栏大小
    private var statusBarFrame: CGRect{
        return UIApplication.sharedApplication().statusBarFrame
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize(){
        self.transform = CGAffineTransformMakeTranslation(0, -titlePositionInset)
    }

    override func sizeThatFits(size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        return CGSizeMake((self.superview?.bounds.size.width)!, self.extraHeight)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()

        let classNamesToReposition: NSArray = [NSClassFromString("_UINavigationBarBackground")!]

        for view in self.subviews{
            if classNamesToReposition.containsObject(view.classForCoder){
                view.frame.origin.y = self.bounds.origin.y
                view.frame.size.height = self.bounds.size.height + titlePositionInset
            }
        }
    }
    
    deinit{
        print("ResizeNavigationBar deinit")
    }
}
