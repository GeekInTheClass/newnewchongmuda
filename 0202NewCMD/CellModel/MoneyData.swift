import Foundation
import UIKit

class FirstCustomCell: UITableViewCell {
    
    @IBOutlet weak var whereMoneySpent: UILabel!
    @IBOutlet weak var inOrOutLabel: UILabel!
    @IBOutlet weak var howMuchSpent: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var receiptImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // INitialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func customInit(whereMoneySpent:String, memo:String, howMuch:String, inOrOut:String, receiptImage:UIImage? ) {
        self.whereMoneySpent.text = whereMoneySpent
        self.memoLabel.text = memo
        self.howMuchSpent.text = howMuch
        self.inOrOutLabel.text = inOrOut
        
        self.memoLabel.textColor = UIColor.gray
    }
}



//
//class MoneyData {
//    var title:String
//    var money:Int
//    var isDeposit:Bool
//    var bills:String
//    var subtitle:String
//    var date:Date
//
//
//    init(title:String, money:Int, subtitle:String, date:Date, bills:String)
//    {
//        self.title = title
//        self.money = money
//        self.isDeposit = (money >= 0) ? true : false
//        self.subtitle = "기타"
//        self.bills = bills
//        self.date = date
//    }
//
//
//}

