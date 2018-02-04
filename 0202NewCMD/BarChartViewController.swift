//
//  BarChartViewController.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 4..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    
    var howMuchSpent:[String]!

    @IBOutlet weak var barChartView: HorizontalBarChartView!
    
    var months:[String]!
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.drawBarShadowEnabled = false
        barChartView.drawValueAboveBarEnabled = true
        
        barChartView.maxVisibleCount = 800
        
        
        
        let xAxis  = barChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 10.0
        
        let leftAxis = barChartView.leftAxis;
        leftAxis.drawAxisLineEnabled = true;
        leftAxis.drawGridLinesEnabled = true;
        leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
        
        let rightAxis = barChartView.rightAxis
        rightAxis.enabled = true;
        
        rightAxis.drawAxisLineEnabled = true;
        rightAxis.drawGridLinesEnabled = false;
        rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
        
        let l = barChartView.legend
        l.enabled =  false
        
        barChartView.fitBars = true;
        
        setDataCount(count: 12, range: 50)
        
    }
    
        func setDataCount(count: Int, range: Double){
            
            let barWidth = 9.0
            let spaceForBar =  10.0;
            
            var yVals = [BarChartDataEntry]()
            
            for i in 0..<count{
                
                
                let mult = (range + 1)
                let val = (Double)(arc4random_uniform(UInt32(mult)))
                
                yVals.append(BarChartDataEntry(x: Double(i) * spaceForBar, y: val))
                
            }
            
            var set1 : BarChartDataSet!
            
            
            if let count = barChartView.data?.dataSetCount, count > 0{
                set1 = barChartView.data?.dataSets[0] as! BarChartDataSet
                set1.values = yVals
                barChartView.data?.notifyDataChanged()
                barChartView.notifyDataSetChanged()
                
            }else{
                set1 = BarChartDataSet(values: yVals, label: "DataSet")
                
                
                var dataSets = [BarChartDataSet]()
                dataSets.append(set1)
                
                let data = BarChartData(dataSets: dataSets)
                
                data.barWidth =  barWidth;
                
                barChartView.data = data
                
            }
            
            
            
    }
}
        

        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

//    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
//
//
//
//    var dataEntries: [BarChartDataEntry] = []
//
//    for i in 0..<dataPoints.count {
//    let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
//    dataEntries.append(dataEntry)
//    }
//    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
//    let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
//    barChartView.data = chartData

//    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
//    let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
//    barChartView.data = chartData
//    func updateChartData()  {
//
//        let chart = BarChartView(frame: self.view.frame)
//        // 2. generate chart data entries
//        let track = ["새터준비", "1학기 개강총회", "총 MT", "당선", "학생회비 환급"]
//        let money = [718, 230, 200.0, 64, 21]
//
//        var entries = [BarChartDataEntry]()
//        for (_, value) in money.enumerated() {
//            let entry = BarChartDataEntry()
//            entry.y = value
//            //entry.label = track[index]
//            entries.append( entry)
//        }
//
//        // 3. chart setup
//        let set = BarChartDataSet( values: entries, label: "Bar Chart")
//        // this is custom extension method. Download the code for more details.
//        var colors: [UIColor] = []
//
//        for _ in 0..<money.count {
//            let red = Double(arc4random_uniform(256))
//            let green = Double(arc4random_uniform(256))
//            let blue = Double(arc4random_uniform(256))
//            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
//            colors.append(color)
//        }
//        set.colors = colors
//        let data = BarChartData(dataSet: set)
//        chart.data = data
//        chart.noDataText = "No data available"
//        // user interaction
//        chart.isUserInteractionEnabled = true
//
//        let d = Description()
//        d.text = "iOSCharts.io"
//        chart.chartDescription = d
//        chart.centerText = "Pie Chart"
//        chart.holeRadiusPercent = 0.2
//        chart.transparentCircleColor = UIColor.clear
//        self.view.addSubview(chart)
        
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


