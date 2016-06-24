//
//  DailyRevenueModel.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/23.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import Foundation


class DailyRevenueModel{
    //门诊数据
    var revenues: Double = 0
    var visits: Int = 0
    var appointments: Int = 0
    
    var outpatientNumber: [Double] = []
    var outpatientRevenueAxisData: [Double] = []
    var xAxisData: [String] = []
    
    
    //住院数据
    var childBirthNumber: [Double] = []
    var childBirthNumberXAxisData: [String] = []
    
    func getInpatientData(){
        //如果为0就不放进数组中
        self.childBirthNumber = [1, 3, 5]
        self.childBirthNumberXAxisData = ["Natual Delivery", "C-Section", "Dead"]
    }
    
    func getOutpatientData(){
        self.outpatientNumber = [31, 27, 10]
        self.outpatientRevenueAxisData = [215498.76, 87876.5, 20003]
        self.xAxisData = ["Gyn&Obs", "Pediatrics", "Functional Med."]
        
        visits = Int(self.outpatientNumber.reduce(0, combine: +))
        revenues = self.outpatientRevenueAxisData.reduce(0, combine: +)
        appointments = 70
    }
    
    deinit{
        print("DailyRevenueModel deinit")
    }
}