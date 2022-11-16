//
//  DeleteStudent.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

func deleteStudent() {
    print(Notice.DeleteStudent.input)
    let name = readLine()!
    
    if studentInfo[name] != nil {
        studentInfo.removeValue(forKey: name)
        print("\(name) \(Notice.DeleteStudent.success)")
    } else {
        print("\(name) \(Notice.DeleteStudent.error)")
    }
    
}
