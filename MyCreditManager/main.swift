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
    notice()
    let input = readLine()!
    if input == "X" {
        print("프로그램을 종료합니다...")
        break
    }
    
    if Int(input) != nil && correctArray.contains(Int(input)!) {
        myCreditManager(input: Int(input)!)
    } else {
        error()
    }

        
}
func notice() {
    print("원하는 기능을 입력해주세요. \n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
}


func error() {
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}

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

func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let name = readLine()!
    
    if name != "" {
        if studentInfo[name] == nil {
            studentInfo[name] = Array(arrayLiteral: [:])
            print("\(name) 학생을 추가했습니다.")
        } else {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요")
    }
}

func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let name = readLine()!
    
    if name != "" {
        if studentInfo[name] != nil {
            studentInfo.removeValue(forKey: name)
            print("\(name) 학생을 삭제하였습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요")
    }
}

func addGrade() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    let student = readLine()!.split(separator: " ").map{$0}
    
    if student.count == 3 {
        let name = String(student[0])
        let subject = String(student[1])
        let grade = String(student[2])
        
        if studentInfo[name] == nil {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else {
            if studentInfo[name]!.filter({$0.keys.contains(subject)}).isEmpty {
                            studentInfo[name]?.append([subject : grade])
                        } else { // 학생, 과목성적 있으면
                            if let index = studentInfo[name]?.firstIndex(where: {$0.keys.contains(name)}) {
                                studentInfo[name]?[index] = [subject : grade]
                            }
                        }
                        print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func deleteGrade() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
    let student = readLine()!.split(separator: " ").map{$0}
    
    if student.count == 2 {
        let name = String(student[0])
        let subject = String(student[1])
        
        if studentInfo[name] == nil {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } else {
            if let index = studentInfo[name]?.firstIndex(where: {$0.keys.contains(subject)}) {
                           studentInfo[name]?.remove(at: index)
                       }
                       print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func readGrade() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
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
            print("\(name) 학생을 찾지 못했습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    
}

func scoring(grade: String) -> Double {
    switch grade {
    case "A+":
        return 4.5
    case "A":
        return 4.0
    case "B+":
        return 3.5
    case "B":
        return 3.0
    case "C+":
        return 2.5
    case "C":
        return 2.0
    case "D+":
        return 1.5
    case "D":
        return 1.0
    case "F":
        return 0.0
    default:
        return 0.0
    }
}
