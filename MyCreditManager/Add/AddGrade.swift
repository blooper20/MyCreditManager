//
//  AddGrade.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

func addGrade() {
    print(Notice.AddGrade.input)
    let student = readLine()!.split(separator: " ").map{$0}
    
    if student.count == 3 {
        let name = String(student[0])
        let subject = String(student[1])
        let grade = String(student[2])
        
        if studentInfo[name] == nil {
            print(Notice.AddGrade.error)
        } else {
            if studentInfo[name]!.filter({$0.keys.contains(subject)}).isEmpty {
                            studentInfo[name]?.append([subject : grade])
                        } else { // 학생, 과목성적 있으면
                            if let index = studentInfo[name]?.firstIndex(where: {$0.keys.contains(name)}) {
                                studentInfo[name]?[index] = [subject : grade]
                            }
                        }
            print("\(name) 학생의 \(subject) 과목이 \(grade)로 \(Notice.AddGrade.success)")
        }
    } else {
        print(Notice.AddGrade.error)
    }
}
