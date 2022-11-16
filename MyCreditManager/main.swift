//
//  main.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

let correctArray = [1, 2, 3, 4, 5]
var studentInfo: [String : [[String:String]]] = [:]

while true {
    print(Notice.firstNotice)
    let input = readLine()!
    if input == "X" {
        print("프로그램을 종료합니다...")
        break
    }
    
    if Int(input) != nil && correctArray.contains(Int(input)!) {
        myCreditManager(input: Int(input)!)
    } else {
        print(Notice.inputError)
    }
}
