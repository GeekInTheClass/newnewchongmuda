//
//  ChartViewController.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 4..
//  Copyright © 2018년 minkyung. All rights reserved.
//

//import UIKit
//import Charts
//
//class ChartViewController: UIViewController {
//
//    @IBOutlet weak var barChart: BarChartView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let sales = DataGenerator.data()
//
//        var salesEntries = [ChartDataEntry]()
//
//        var salesMonths = [String]()
//
//        var i = 0
//
//        for sale in sales {
//
//            let saleEntry = BarChartDataEntry(value: sale.value, xIndex: i)
//            salesEntries.append(saleEntry)
//
//            salesMonths.append(sale.month)
//
//            i += 1
//        }
//
//        // Create bar chart data set containing salesEntries
//        let chartDataSet = BarChartDataSet(values: salesEntries, label: "Profit")
//
//        // Create bar chart data with data set and array with values for x axis
//        let chartData = BarChartData(xVals: salesMonths, dataSets: [chartDataSet])
//
//        // Set bar chart data to previously created data
//        barChart.data = chartData
//
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
