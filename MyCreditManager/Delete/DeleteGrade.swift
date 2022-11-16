//
//  DeleteGrade.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

func deleteGrade() {
    print(Notice.DeleteGrade.input)
    let student = readLine()!.split(separator: " ").map{$0}
    
    if student.count == 2 {
        let name = String(student[0])
        let subject = String(student[1])
        
        if studentInfo[name] == nil {
            print(Notice.DeleteGrade.notFound)
        } else {
            if let index = studentInfo[name]?.firstIndex(where: {$0.keys.contains(subject)}) {
                           studentInfo[name]?.remove(at: index)
                       }
            print("\(name) 학생의 \(subject) \(Notice.DeleteGrade.success)")
        }
    } else {
        print(Notice.DeleteGrade.error)
    }
}
