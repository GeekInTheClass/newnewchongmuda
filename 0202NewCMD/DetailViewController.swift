//
//  DetailViewController.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 3..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var moneyData:MoneyData?
    
    var valueSentFromDetailTableViewController:sentBackData?
    
    @IBAction func cancelDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveDetail(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailTableSegue" {
            let containerView = segue.destination as? DetailTableViewController
            containerView?.data = moneyData
        }
        else {
            return
        }
        
    }
    
}

