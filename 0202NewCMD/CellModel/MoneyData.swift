import Foundation
import UIKit

class MoneyData {
    
    var title:String
    var money:Int
    var isDeposit:Bool
    var bills:String
    var subtitle:String
    var date:Date
    
    
    init(title:String, money:Int, subtitle:String, date:Date, bills:String)
    {
        self.title = title
        self.money = money
        self.isDeposit = (money >= 0) ? true : false
        self.subtitle = "기타"
        self.bills = bills
        self.date = date
    }
}
