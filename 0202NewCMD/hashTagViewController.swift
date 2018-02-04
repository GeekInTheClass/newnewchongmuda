//
//  hashTagViewController.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 4..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import UIKit

class hashTagViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var receiptView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        func createButton () {
            let button = UIButton(type: .custom)
            
            button.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
            button.layer.cornerRadius = 10.0
            button.clipsToBounds = true
           
            button.setImage(#imageLiteral(resourceName: "영수증1"), for: .normal)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! hastagTableViewCell


        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func addHashTag(_ sender: Any) {
        let alertController = UIAlertController(title: "새로운 Hash Tag 앨범", message: "이 앨범의 새로운 이름을 입력하십시오", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
        })
        
        let cancelAction = UIAlertAction(title: "Back", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "#제목"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    }



