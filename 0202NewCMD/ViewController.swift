//
//  ViewController.swift
//  <<New>>CMD
//
//  Created by CAUADC on 2018. 2. 1..
//  Copyright © 2018년 minkyung. All rights reserved.
//
import UIKit

private let formatter = DateFormatter()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data:[MoneyData] = makeData()
    
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
    
    
    var tmpMoneyData:[MoneyData] = makeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmpMoneyData.count

    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell

        cell.whereMoneySpent.text = tmpMoneyData[indexPath.row].title
        cell.inOrOutLabel.text = tmpMoneyData[indexPath.row].isDeposit
        if cell.inOrOutLabel.text == "출금" {
            cell.inOrOutLabel.textColor = UIColor.cyan
        } else {
            cell.inOrOutLabel.textColor = UIColor.orange
        }
        
        cell.memoLabel.text = tmpMoneyData[indexPath.row].subtitle
        cell.receiptImage.image =  tmpMoneyData[indexPath.row].bills
        cell.howMuchSpent.text = tmpMoneyData[indexPath.row].money
        if cell.inOrOutLabel.text == "출금" {
            cell.howMuchSpent.textColor = UIColor.cyan
        } else {
            cell.howMuchSpent.textColor = UIColor.orange
        }
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            guard let destination = segue.destination as? DetailViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row else {
                return
            }
            destination.moneyData = data[selectedIndex]
        }
        
    }
}
    

func makeData() -> [MoneyData] {
    var depositDatas:[MoneyData] = []
    formatter.dateFormat = "yyyy/MM/dd"
    depositDatas.append(MoneyData(title: "이삭 토스트",
                                  money: -130000,
                                  subtitle: "간식사업 100명",
                                  date: formatter.date(from: "2017/03/31")!,
                                  bills: #imageLiteral(resourceName: "영수증1")
    ))
    depositDatas.append(MoneyData(title: "버스 대여",
                                  money: -900500,
                                  subtitle: "새터 버스 3대",
                                  date: formatter.date(from: "2017/03/30")!,
                                  bills: #imageLiteral(resourceName: "영수증1")))
    depositDatas.append(MoneyData(title: "숙소 나머지",
                                  money: -425000,
                                  subtitle: "새터 버스 3대",
                                  date: formatter.date(from: "2017/03/29")!,
                                  bills: #imageLiteral(resourceName: "영수증1")))
    depositDatas.append(MoneyData(title: "닭강정",
                                  money: -90000,
                                  subtitle: "새터 버스 3대",
                                  date: formatter.date(from: "2017/03/29")!,
                                  bills: #imageLiteral(resourceName: "영수증1")))
    depositDatas.append(MoneyData(title: "가람터",
                                  money: -45000,
                                  subtitle: "새터 버스 3대",
                                  date: formatter.date(from: "2017/03/29")!,
                                  bills: #imageLiteral(resourceName: "영수증1")))
    return depositDatas
}
