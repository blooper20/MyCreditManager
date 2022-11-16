//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

func addStudent() {
    print(Notice.AddStudent.input)
    let name = readLine()!
    
    if name != "" {
        if studentInfo[name] == nil {
            studentInfo[name] = Array(arrayLiteral: [:])
            print("\(name) \(Notice.AddStudent.success)")
        } else {
            print("\(name) \(Notice.AddStudent.overlap)")
        }
    } else {
        print(Notice.AddStudent.error)
    }
}
