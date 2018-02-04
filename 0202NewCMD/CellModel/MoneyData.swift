import Foundation
import UIKit

private let formatter = DateFormatter()

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
}

class MoneyData {
    var title:String
    var money:String
    var isDeposit:String
    var bills:UIImage
    var subtitle:String
    var date:Date
    
    init(title:String, money:Int, subtitle:String, date:Date, bills:UIImage)
    {
        self.title = title
        self.money = money.withCommas()
        self.isDeposit = depositToString(isDeposit: (money >= 0) ? true : false)
        self.subtitle = subtitle
        self.bills = bills
        self.date = date
        
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}


func depositToString(isDeposit:Bool) -> String {
    let depositString:String
    if isDeposit {
        depositString = "입금"
    } else {
        depositString = "출금"
    }
    return depositString
}

