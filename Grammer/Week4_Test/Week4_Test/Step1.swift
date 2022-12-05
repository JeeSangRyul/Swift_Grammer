//
//  Step1.swift
//  Week4_Test
//
//  Created by 지상률 on 2022/12/05.
//

import Foundation

struct BodyCondition {
    var upperBody = Int()
    var lowerBody = Int()
    var endurance = Int()
    var fatigue = Int()
}

struct Person {
    var name = String()
    var bodycondition = BodyCondition()
    
    func exercise(for set: Int, routine: Routine) throws {
        print("----------------")
        print("\(name)을 시작합니다.")
        for i in 1...set {
            for exercise in routine.exerciseArray{
                print(exercise.name)
                if ji.fatigue < goalBody.fatigue {
                    exercise.action()
                }else {
                    throw FitnessError.overFatigue
                }
                
            }
            print("\(i)세트 마무리")
        }
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

var ji: BodyCondition = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)

let sitUp: Exercise = Exercise(name: "윗몸일으키기"){
    ji.upperBody += Int.random(in: 10...20)
    ji.fatigue += Int.random(in: 10...20)
}

let sqout: Exercise = Exercise(name: "스쿼트") {
    ji.lowerBody += Int.random(in: 20...30)
    ji.fatigue += Int.random(in: 10...20)
}

let shuttleRun: Exercise = Exercise(name: "오래달리기") {
    ji.endurance += Int.random(in: 20...30)
    ji.upperBody += Int.random(in: 5...10)
    ji.lowerBody += Int.random(in: 5...10)
    ji.fatigue += Int.random(in: 20...30)
}

let activeRest: Exercise = Exercise(name: "동적휴식") {
    ji.fatigue -= Int.random(in: 5...10)
}

struct Routine {
    var name = String()
    var exerciseArray: [Exercise] = [sitUp, sqout, activeRest]
}

let firstRoutine: Routine = Routine(name: "hellRoutine", exerciseArray: [sitUp, sitUp, sitUp, sitUp])
let secondRoutine: Routine = Routine(name: "ohMyGodRoutine", exerciseArray: [sqout, sqout, sqout, sqout, sqout, sqout, sqout])


enum FitnessError: Error{
    case noName
    case bodyConditionOutOfRage
    case overFatigue
}

var goalBody: BodyCondition = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)

struct FitnessCenter {
    var goalBodyCondition = BodyCondition()
    var member = Person()
    var totalRoutine: [Routine] = [firstRoutine, secondRoutine]
    var routineNumber = Routine()
    var setNumber = Int()
    
    mutating func saveMember() throws{
        var a = readLine()
        
        if let member = a {
            self.member.name = member
        } else {
            throw FitnessError.noName
        }
    }
    
    mutating func saveGoalBodyCondition() throws{
        var a = readLine()
        
        if let goal = a {
            var array = goal.components(separatedBy: " ")
            goalBodyCondition.upperBody = Int(array[0]) ?? 0
            goalBodyCondition.lowerBody = Int(array[1]) ?? 0
            goalBodyCondition.endurance = Int(array[2]) ?? 0
            goalBodyCondition.fatigue = Int(array[3]) ?? 0
        }
        
        guard goalBodyCondition.upperBody >= 0, goalBodyCondition.lowerBody >= 0, goalBodyCondition.endurance >= 0, goalBodyCondition.fatigue >= 0
        else {
            throw FitnessError.bodyConditionOutOfRage
        }
        
        self.member.bodycondition = goalBodyCondition
        goalBody = goalBodyCondition
    }
    
    mutating func saveRoutineAndSet() {
        var a = readLine()
        
        if let routine = a {
            if routine == "1"{
                routineNumber = totalRoutine[0]
            }
            else {
                routineNumber = totalRoutine[1]
            }
        }
    }
    
    mutating func saveSetNumber() {
        var a = readLine()
        
        if let set = a {
            setNumber = Int(set) ?? 0
        }
    }
    
    mutating func saveInputDataAndWorkOut() throws{
        print("안녕하세요. 야곰 피트니스 센터입니다. 회워님의 이름은 무엇입니까?")
        try saveMember()
        print("운동 목표치를 순서대로 알려주세요")
        try saveGoalBodyCondition()
        print("몇 번째 루틴으로 운동하시겠어요?")
        print("1. hellRoutine")
        print("2. ohMyGodRoutine")
        saveRoutineAndSet()
        print("몇 세트 반복하시겠어요?")
        saveSetNumber()
        
        try self.member.exercise(for: setNumber, routine: routineNumber)
    }
    
    
    mutating func workout() throws{
        do{
            try saveInputDataAndWorkOut()
            
            print("----------------")
            print("현재의 컨디션은 다음과 같습니다.")
            print("상체근력: \(ji.upperBody)")
            print("하체근력: \(ji.lowerBody)")
            print("근지구력: \(ji.endurance)")
            print("피로도: \(ji.fatigue)")
        } catch FitnessError.noName{
            print("이름을 입력하세요")
            return
        } catch FitnessError.overFatigue{
            print("회원님이 도망갔습니다.")
            return
        } catch FitnessError.bodyConditionOutOfRage{
            print("목표치를 다시 입력하세요")
            return
        } catch {
            print(error)
        }
    }
}
