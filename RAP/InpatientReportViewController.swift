//
//  InpatientReportViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/23.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit
import Charts

class InpatientReportViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    let charDataModel = DailyRevenueModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupDefaultProperty()
        setupHeaderLabel()
        setupBarChart()
        processChartData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeaderLabel(){
        charDataModel.getInpatientData()
    }
    
    func setupBarChart(){
        pieChartView.usePercentValuesEnabled = false
        pieChartView.drawSliceTextEnabled = false
        pieChartView.holeRadiusPercent = 0.5
        pieChartView.transparentCircleRadiusPercent = 0.5
        pieChartView.descriptionText = ""
        pieChartView.drawCenterTextEnabled = true
        pieChartView.setExtraOffsets(left: 5, top: 5, right: 5, bottom: 5)
        pieChartView.backgroundColor = UIColor.clearColor()
        pieChartView.drawHoleEnabled = true
        pieChartView.holeColor = UIColor.clearColor()
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = true
        pieChartView.highlightPerTapEnabled = true
        pieChartView.legend.horizontalAlignment = .Center
        pieChartView.legend.yOffset = 30.0
        pieChartView.legend.textColor = UIColor.whiteColor()
        pieChartView.legend.font = UIFont(name: ConstantValue.lightFont, size: 14.0)!
        
        let paragraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        paragraphStyle.alignment = .Center
        
        let attrString = NSMutableAttributedString(string: "Childbirth\nNumbers")
        attrString.setAttributes([
            NSForegroundColorAttributeName: NSUIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: ConstantValue.boldFont, size: 16.0)!,
            NSParagraphStyleAttributeName: paragraphStyle
            ], range: NSMakeRange(0, attrString.length))
        
        
        pieChartView.centerAttributedText = attrString
    }
    
    func processChartData(){
        var yValues = [BarChartDataEntry]()
        for i in 0..<charDataModel.childBirthNumber.count{
            yValues.append(BarChartDataEntry(value: charDataModel.childBirthNumber[i], xIndex: i))
        }
        
        let set = PieChartDataSet(yVals: yValues, label: nil)
        set.setColors([UIColor.pink1Color(), UIColor.pink2Color(), UIColor.pink3Color()], alpha: 1)
        set.sliceSpace = 10
        
        var sets = [PieChartDataSet]()
        sets.append(set)
        
        pieChartView.data = PieChartData(xVals: charDataModel.childBirthNumberXAxisData, dataSets: sets)
        pieChartView.data!.setValueFont(UIFont(name: ConstantValue.boldFont, size: 18.0)!)
        pieChartView.data!.setValueTextColor(UIColor.whiteColor())
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .NoStyle
        pieChartView.data!.setValueFormatter(numberFormatter)
    }
    
    
    deinit{
        print("OutpatientReportViewController deinit")
    }
}
