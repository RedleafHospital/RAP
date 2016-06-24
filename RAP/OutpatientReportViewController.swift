//
//  DailyRevenueReportViewController.swift
//  RAP
//
//  Created by 刘颖奥 on 16/6/21.
//  Copyright © 2016年 Redleaf Hospital. All rights reserved.
//

import UIKit
import Charts

class OutpatientReportViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var visitsLabel: UILabel!
    @IBOutlet weak var appointmentsLabel: UILabel!
    
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
        charDataModel.getOutpatientData()
        
        let stringFormat = NSNumberFormatter()
        stringFormat.numberStyle = NSNumberFormatterStyle.DecimalStyle
        revenueLabel.text = stringFormat.stringFromNumber(NSNumber(double: charDataModel.revenues))
        
        visitsLabel.text = String(charDataModel.visits)
        appointmentsLabel.text = String(charDataModel.appointments)
    }
    
    func setupBarChart(){
        barChartView.descriptionText = " "
        barChartView.noDataTextDescription = "Need to provide data for the chart."
        barChartView.drawGridBackgroundEnabled = false
        barChartView.backgroundColor = UIColor.clearColor()
        barChartView.drawValueAboveBarEnabled = true
        
        barChartView.setScaleEnabled(false)
        barChartView.dragEnabled = false
        barChartView.pinchZoomEnabled = false
        barChartView.rightAxis.enabled = true
        barChartView.legend.textColor = UIColor.whiteColor()
        barChartView.legend.horizontalAlignment = .Right
        barChartView.legend.font = UIFont(name: ConstantValue.lightFont, size: 14.0)!
        barChartView.animate(yAxisDuration: 0.5)
        
        let xAxis = barChartView.xAxis
        xAxis.labelPosition = .Bottom
        xAxis.axisLineColor = UIColor.whiteColor()
        xAxis.gridColor = UIColor.whiteColor()
        xAxis.labelFont = UIFont(name: ConstantValue.boldFont, size: 10.0)!
        xAxis.labelTextColor = UIColor.whiteColor()
        
        let yLeftAxis = barChartView.leftAxis
        yLeftAxis.labelPosition = .OutsideChart
        yLeftAxis.axisLineColor = UIColor.whiteColor()
        yLeftAxis.gridColor = UIColor.whiteColor()
        yLeftAxis.labelFont = UIFont(name: ConstantValue.boldFont, size: 10.0)!
        yLeftAxis.labelTextColor = UIColor.whiteColor()
        yLeftAxis.axisMinValue = 0.0
        yLeftAxis.drawGridLinesEnabled = false
        
        let yRightAxis = barChartView.rightAxis
        yRightAxis.labelPosition = .OutsideChart
        yRightAxis.axisLineColor = UIColor.whiteColor()
        yRightAxis.gridColor = UIColor.whiteColor()
        yRightAxis.labelFont = UIFont(name: ConstantValue.boldFont, size: 10.0)!
        yRightAxis.labelTextColor = UIColor.whiteColor()
        yRightAxis.axisMinValue = 0.0
        
    }
    
    func processChartData(){
        var yValues = [BarChartDataEntry]()
        for i in 0..<charDataModel.outpatientNumber.count{
            yValues.append(BarChartDataEntry(value: charDataModel.outpatientNumber[i], xIndex: i))
        }
        
        let set = BarChartDataSet(yVals: yValues, label: "Patients Numbers")
        set.setColor(UIColor.darkRedColor())
        set.valueFont = UIFont(name: ConstantValue.regularFont, size: 12.0)!
        set.valueTextColor = UIColor.whiteColor()
        set.axisDependency = .Left
        
        var yValues1 = [BarChartDataEntry]()
        for i in 0..<charDataModel.outpatientRevenueAxisData.count{
            yValues1.append(BarChartDataEntry(value: charDataModel.outpatientRevenueAxisData[i], xIndex: i))
        }
        
        let set1 = BarChartDataSet(yVals: yValues1, label: "Revenues")
        set1.setColor(UIColor.moneyRedColor())
        set1.valueFont = UIFont(name: ConstantValue.regularFont, size: 12.0)!
        set1.valueTextColor = UIColor.whiteColor()
        set1.axisDependency = .Right
        
        var sets = [BarChartDataSet]()
        sets.append(set)
        sets.append(set1)
        
        barChartView.data = BarChartData(xVals: charDataModel.xAxisData, dataSets: sets)
    }
    
    
    deinit{
        print("OutpatientReportViewController deinit")
    }
}
