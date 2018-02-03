//
//  ViewController.swift
//  <<New>>CMD
//
//  Created by CAUADC on 2018. 2. 1..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var receiptView: UIView!
    @IBOutlet var calenderView: UIView!
    @IBOutlet var dailyView: UIView!
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch(sender.selectedSegmentIndex) {
            // 일
            case 0 :
                self.dailyView.isHidden = false
                self.calenderView.isHidden = true
                self.receiptView.isHidden = true
                break
            // 달력
            case 1 :
                self.dailyView.isHidden = true
                self.calenderView.isHidden = false
                self.receiptView.isHidden = true
                break
            // 영수증 앨범
            case 2 :
                self.dailyView.isHidden = true
                self.calenderView.isHidden = true
                self.receiptView.isHidden = false
                break
            default:
                break;
            
            
        }
    }
    
    var data1 = [
        ["일., 이삭토스트., 간식사업 100명., 130,000원" , "출금., 이삭토스트., 간식사업 100명., 130,000원","출금., 이삭토스트., 간식사업 100명., 130,000원","출금., 이삭토스트., 간식사업 100명., 130,000원"]
    ]

    let images = ["영수증1-4","영수증1-4","영수증1-4","통계 - 월별"]
    
    var p: Int!

    
    
//    var tmpMoneyData = MoneyDataProvider().depositDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        p = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1[p].count

    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomCell") as! FirstCustomCell
        let str = data1[p][indexPath.row].components(separatedBy: ".,")
        
        cell.customInit(whereMoneySpent: str[1], memo: str[2], howMuch: str[3], inOrOut: str[0], receiptImage: UIImage.init())
        cell.receiptImage.image = UIImage(named: images[indexPath.row])

        return cell
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
//
//        cell.whereMoneySpent.text = tmpMoneyData[indexPath.row].title
//        cell.inOrOutLabel.text = String(tmpMoneyData[indexPath.row].isDeposit)
//        cell.memoLabel.text = tmpMoneyData[indexPath.row].subtitle
//        cell.receiptImage.image = UIImage(named: tmpMoneyData[indexPath.row].bills)
//        cell.howMuchSpent.text = String(tmpMoneyData[indexPath.row].money)
//        return cell
        
    }

}
    


