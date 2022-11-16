//
//  MyCreditManager.swift
//  MyCreditManager
//
//  Created by MacBook Air on 2022/11/16.
//

import Foundation

func myCreditManager(input: Int) {
    switch input {
    case 1:
        addStudent()
        break
    case 2:
        deleteStudent()
        break
    case 3:
        addGrade()
        break
    case 4:
        deleteGrade()
        break
    case 5:
        readGrade()
        break
    default:
        break
    }
}
