//
//  ReadGrade.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

func readGrade() {
    print(Notice.ReadGrade.input)
    let name = readLine()!
    
    if name != "" {
        if studentInfo[name] != nil {
            var total = 0.0
            
            studentInfo[name]?.forEach({
                            $0.forEach { subject, grade in
                                print("\(subject): \(grade)")
                                total += scoring(grade: grade)
                            }
                        })
            print("평점 : \(String(format: "%.2f", total / Double(studentInfo[name]!.count-1)))")
        } else {
            print("\(name) \(Notice.ReadGrade.notFound)")
        }
    } else {
        print(Notice.ReadGrade.error)
    }
    
}
