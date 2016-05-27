//
//  UnderLineView.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/27.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class UnderLineView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: rect.origin.x, y: rect.height))
        path.addLineToPoint(CGPoint(x: rect.width, y: rect.height))
        UIColor.whiteColor().setStroke()
        path.stroke()
    }
 

}
