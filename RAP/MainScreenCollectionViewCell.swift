//
//  MainScreenCollectionViewCell.swift
//  RAP
//
//  Created by 刘颖奥 on 16/5/30.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit

class MainScreenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    
    deinit{
        print("MainScreenCollectionViewCell deinit")
    }
}
