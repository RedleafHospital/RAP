//
//  ContactsTableViewCell.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/6.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pohotViewBoundry: UIView!{
        didSet{
            pohotViewBoundry.backgroundColor = UIColor.clearColor()
            
            pohotViewBoundry.layer.borderWidth = 1
            pohotViewBoundry.layer.borderColor = UIColor.whiteColor().CGColor
            pohotViewBoundry.layer.cornerRadius = pohotViewBoundry.bounds.width / 2
        }
    }
    
    @IBOutlet weak var photoView: UIImageView!{
        didSet{
            photoView.layer.cornerRadius = photoView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
