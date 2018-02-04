//
//  ChartData.swift
//  
//
//  Created by CAUADC on 2018. 2. 4..
//

import Foundation

struct Sale {
    var month:String
    var value:Double
}

class DataGenerator {
    static var randomizedSale:Double {
        return Double(arc4random_uniform(10000) + 1) / 10
    }
    
    static func data() -> [Sale] {
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "sep"]
        var sales = [Sale]()
        
        for month in months {
            let sale = Sale(month: month, value: randomizedSale)
            sales.append(sale)
            
        }
    return sales
    
    }
}
