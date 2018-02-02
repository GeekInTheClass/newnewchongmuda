//
//  MoneyDataProvider.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 2..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import Foundation
import UIKit


class MoneyDataProvider{
    var depositDatas:[MoneyData] = []
    private let formatter = DateFormatter()

    init () {
        formatter.dateFormat = "yyyy/MM/dd"
        depositDatas.append(MoneyData(title: "이삭 토스트",
                                      money: 130000,
                                      subtitle: "간식사업 100명",
                                      date: formatter.date(from: "2017/03/31")!,
                                      bills: "영수증1.png"
                                      ))
        depositDatas.append(MoneyData(title: "버스 대여",
                                      money: 900500,
                                      subtitle: "새터 버스 3대",
                                      date: formatter.date(from: "2017/03/30")!,
                                      bills: "영수증1.png"))
        depositDatas.append(MoneyData(title: "숙소 나머지",
                                      money: 425000,
                                      subtitle: "새터 버스 3대",
                                      date: formatter.date(from: "2017/03/29")!,
                                      bills: "영수증1.png"))
        depositDatas.append(MoneyData(title: "닭강정",
                                      money: 90000,
                                      subtitle: "새터 버스 3대",
                                      date: formatter.date(from: "2017/03/29")!,
                                      bills: "영수증1.png"))
        depositDatas.append(MoneyData(title: "가람터",
                                      money: 45000,
                                      subtitle: "새터 버스 3대",
                                      date: formatter.date(from: "2017/03/29")!, 
                                      bills: "영수증1.png"))
    }

    
}



