//
//  main.swift
//  Week4_Test
//
//  Created by 지상률 on 2022/02/28.
//

import Foundation

print("Hello, World!")
/*
 /*클로져*/
 //코드의 블럭
 //일급 시민(first-citizen)
 //변수, 상수 등으로 저장, 전달인자로 전달이 가능
 //함수 : 이름이 있는 클로저
 //MARK: - 정의
 //{ (<#매개변수 목록#>) -> 반환타입 in
 //    <#실행 코드#>
 //} 매개변수나 반환타입을 지울수도있다.
 // 함수를 사용한다면
 func sumFunction(a: Int, b: Int) -> Int {
 return a + b
 }
 
 var sumResult: Int = sumFunction(a: 1, b: 2)
 
 print(sumResult) // 3
 // 클로저의 사용
 var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
 return a + b
 }
 
 sumResult = sum(1, 2)
 print(sumResult) // 3
 // 함수는 클로저의 일종이므로
 // sum 변수에는 당연히 함수도 할당할 수 있습니다
 sum = sumFunction(a:b:)
 
 sumResult = sum(1, 2) //sumFunction(a:2, b:2)가 실행된다.
 print(sumResult) // 3
 
 
 //MARK: - 함수의 전달인자로서의 클로저
 //클로저는 주로 함수의 전달인자로 많이 사용된다. 함수 내부에서 원하는 코드블럭을 실행할 수 있다.
 let add: (Int, Int) -> Int
 add = { (a: Int, b: Int) -> Int in
 return a + b
 }
 /*
  var add : (Int, Int) -> Int = {(a: Int, b: Int)-> Int in
  return a + b
  } 위의 코드와 동일한 코드
  */
 
 let substract: (Int, Int) -> Int
 substract = { (a: Int, b: Int) -> Int in
 return a - b
 }
 
 let divide: (Int, Int) -> Int
 divide = { (a: Int, b: Int) -> Int in
 return a / b
 }
 
 func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
 return method(a, b)
 }
 
 var calculated: Int
 
 calculated = calculate(a: 50, b: 10, method: add)
 
 print(calculated) // 60
 calculated = calculate(a: 50, b: 10, method: substract)
 
 print(calculated) // 40
 calculated = calculate(a: 50, b: 10, method: divide)
 
 print(calculated) // 5
 calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
 return left * right
 })
 
 print(calculated) // 500
 
 /* 클로저 고급 */
 
 var result: Int
 
 //MARK: - 후행 클로저
 // 클로저가 함수의 마지막 전달인자라면
 // 마지막 매개변수 이름을 생략한 후
 // 함수 소괄호 외부에 클로저를 구현할 수 있습니다
 // 마지막 클로져를 받았던 method는 밖으로 빼줄수있다.
 result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
 return left + right
 }
 
 print(result) // 20
 
 //MARK: - 반환타입 생략
 // 주로 type이 정해져있는 변수에 할당되거나 전달인자로 들어온다
 // 위에 calculate라는 함수를 정의해서 컴파일러는 Int로 변환할 것을 알고있다.
 // calculate 함수의 method 매개변수는
 // Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에
 // 굳이 클로저에서 반환타입을 명시해 주지 않아도 됩니다
 // 대신 in 키워드는 생략할 수 없습니다
 result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
 return left + right
 })
 
 print(result) // 20
 // 후행클로저와 함께 사용할 수도 있습니다
 result = calculate(a: 10, b: 10) { (left: Int, right: Int) in
 return left + right
 }
 
 //MARK: - 단축 인자이름
 // 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있습니다
 // 단축 인자이름은 클로저의 매개변수의 순서대로 $0, $1... 처럼 표현합니다
 result = calculate(a: 10, b: 10, method: {
 return $0 + $1 //첫 번째 매개변수 두 번째 매개변수
 })
 
 print(result) // 20
 // 당연히 후행 클로저와 함께 사용할 수 있습니다
 result = calculate(a: 10, b: 10) {
 return $0 + $1
 }
 
 print(result) // 20
 
 //MARK: - 암시적 반환 표현
 // 클로저가 반환하는 값이 있다면
 // 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급합니다
 result = calculate(a: 10, b: 10) {
 $0 + $1
 }
 
 print(result) // 20
 // 간결하게 한 줄로 표현해 줄 수도 있습니다
 result = calculate(a: 10, b: 10) { $0 + $1 }
 
 print(result) // 20
 // 축약하지 않은 클로저 문법과 축약 후의 문법 비교
 result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) -> Int in
 return left + right
 })
 
 result = calculate(a: 10, b: 10) { $0 + $1 }
 
 print(result) // 20
 */
/* 고차함수 */

//전달인자로 함수를 전달받거나
//함수실행의 결과를 함수로 반환하는 함수
//스위프트 표준라이브러리에서 제공하는
//유용한 고차함수에 대해 알아봅니다

//MARK: map, filter, reduce

//컨테이너 타입(Array, Set, Dictionary 등)에 구현되어 있습니다

//MARK: map
//컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
/*
 let numbers: [Int] = [0, 1, 2, 3, 4] //각각의 요소를 변화를 주고싶을때 map을 사용한다.
 var doubledNumbers: [Int]
 var strings: [String]
 
 // for 구문 사용
 doubledNumbers = [Int]()
 strings = [String]()
 
 for number in numbers {
 doubledNumbers.append(number * 2)
 strings.append("\(number)")
 }
 
 print(doubledNumbers) // [0, 2, 4, 6, 8]
 print(strings) // ["0", "1", "2", "3", "4"]
 // map 메서드 사용
 // numbers의 각 요소를 2배하여 새로운 배열 반환
 doubledNumbers = numbers.map({ (number: Int) -> Int in
 return number * 2
 })
 
 // numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
 strings = numbers.map({ (number: Int) -> String in
 return "\(number)"
 })
 
 print(doubledNumbers) // [0, 2, 4, 6, 8]
 print(strings) // ["0", "1", "2", "3", "4"]
 
 
 // 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
 doubledNumbers = numbers.map { $0 * 2 }
 print(doubledNumbers) // [0, 2, 4, 6, 8]
 
 //MARK: filter
 //컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출
 //조건에 부합하는 내부의 값들만 거르겠다.
 
 // for 구문 사용
 // 변수 사용에 주목하세요
 var filtered: [Int] = [Int]()
 
 for number in numbers {
 if number % 2 == 0 {
 filtered.append(number)
 }
 }
 
 print(filtered) // [0, 2, 4]
 
 
 // filter 메서드 사용
 // numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
 // map은 값의 변환을 주어서 그 값을 return하지만
 // filter는 조건에 맞는 값만 추려내는 것이므로 return이 Bool값이 된다.
 // 의미로는 True인 것들만 새로운 변수 또는 상수에 추려낸다. 라는 의미이다.
 let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
 return number % 2 == 0
 }
 print(evenNumbers) // [0, 2, 4]
 // 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
 let oddNumbers: [Int] = numbers.filter {$0 % 2 != 0}
 print(oddNumbers) // [1, 3]
 
 
 //MARK:- reduce
 // 컨테이너 내부의 콘텐츠를 하나로 통합
 let someNumbers: [Int] = [2, 8, 15]
 
 // for 구문 사용
 // 변수 사용에 주목하세요
 var result: Int = 0
 
 // someNumbers의 모든 요소를 더합니다
 for number in someNumbers {
 result += number
 }
 
 print(result) // 25
 
 // reduce 메서드 사용
 // 초깃값이 0이고 someNumbers 내부의 모든 값을 더합니다.
 let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
 //print("\(first) + \(second)") //어떻게 동작하는지 확인해보세요
 return first + second
 })
 
 print(sum)  // 25
 // 초깃값이 0이고 someNumbers 내부의 모든 값을 뺍니다.
 var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
 //print("\(first) - \(second)") //어떻게 동작하는지 확인해보세요
 return first - second
 })
 
 print(subtract) // -25
 // 초깃값이 3이고 someNumbers 내부의 모든 값을 더합니다.
 let sumFromThree = someNumbers.reduce(3) { $0 + $1 }
 
 print(sumFromThree) // 28
 
 
 // 초깃값이 1이고 someNumbers 내부의 모든 값을 곱한다.
 print(someNumbers.reduce(1){$0 * $1}) //240
 /*
  더 알아보기 : flatMap , compactMap
  let someArray: [[[Int?]?]?] = [[[1, 2], nil, [3, nil, 4], nil, [5, 6]]]
  for i in someArray{
  if let constantArray = i{
  let a = constantArray.flatMap{
  $0
  }
  let b = a.flatMap{
  $0
  }
  let c = b.compactMap{
  $0
  }
  print(c.index(after: 2))
  
  }else{
  print("nil")
  }
  }
  compactMap-nil값을 제거한다는 의미
  flatMap-고차원 배열을 하나 아래의 차원으로 바꿔준다는 의미
  */
 */
/*
 //Week4 Step1
 
 class BodyCondition {
 var upperBody : Int
 var lowerBody : Int
 var endurance : Int
 var fatigue : Int
 
 init(){
 self.upperBody = 0
 self.lowerBody = 0
 self.endurance = 0
 self.fatigue = 0
 }
 
 init(upperBody: Int, lowerBody: Int, endurance: Int, fatigue: Int){
 self.upperBody = upperBody
 self.lowerBody = lowerBody
 self.endurance = endurance
 self.fatigue = fatigue
 }
 }
 
 var JeeeeSang = BodyCondition()
 
 //운동 타입
 struct Exercise {
 let name: String
 let action: () -> Void
 }
 
 //예시 운동
 //클로저라고 두가지의 변수를 받아서 각자 역할을 하는 기능을 못한다고 생각했다.
 //함수와 똑같기 때문에 변수를 두개 받아와 두개 다 각자 역할을 한다음에 각자 있는 곳에 저장되는 로직을 짜보았다.
 let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
 JeeeeSang.upperBody += Int.random(in: 10...20)
 JeeeeSang.fatigue += Int.random(in: 10...20)
 }
 let squat: Exercise = Exercise(name: "스쿼트") {
 JeeeeSang.lowerBody += Int.random(in: 20...30)
 JeeeeSang.fatigue += Int.random(in: 10...20)
 }
 let pushUp: Exercise = Exercise(name: "팔굽혀피기") {
 JeeeeSang.upperBody += Int.random(in: 10...20)
 JeeeeSang.fatigue += Int.random(in: 10...20)
 }
 let shuttleRun : Exercise = Exercise(name: "오래달리기") {
 JeeeeSang.endurance += Int.random(in: 20...30)
 JeeeeSang.upperBody += Int.random(in: 5...10)
 JeeeeSang.lowerBody += Int.random(in: 5...10)
 JeeeeSang.fatigue += Int.random(in: 20...30)
 }
 let deadLift : Exercise = Exercise(name: "데드리프트") {
 JeeeeSang.upperBody += Int.random(in: 5...10)
 JeeeeSang.fatigue += Int.random(in: 20...30)
 }
 let activeRest : Exercise = Exercise(name: "동적휴식") {
 JeeeeSang.fatigue -= Int.random(in: 5...10)
 }
 
 
 struct Routine{
 var name: String = "3분할 중 첫번째 Routine"
 var exercises : Array = [pushUp ,
 sitUp ,
 activeRest ]
 
 
 mutating func startRoutine(){
 print("--------------------")
 for exercise in exercises{
 print(exercise.name)
 exercise.action() //exercises안에 있는 클로져 실행
 }
 
 print("--------------------")
 print("현재의 컨디션은 다음과 같습니다.")
 print("상체근력: \(JeeeeSang.upperBody)")
 print("하체근력 : \(JeeeeSang.lowerBody)")
 print("근지구력 : \(JeeeeSang.endurance)")
 print("피로도 : \(JeeeeSang.fatigue)")
 }
 }
 var firstRoutine : Routine = Routine()
 firstRoutine.startRoutine()
 var secoundRoutine : Routine = Routine(name: "3분할 중 두번째 Routine", exercises: [deadLift, sitUp , activeRest] )
 secoundRoutine.startRoutine()
 var thirdRoutine : Routine = Routine(name: "3분할 중 세번째 Routine", exercises: [squat, sitUp , shuttleRun , activeRest])
 thirdRoutine.startRoutine()
 */

//input
//MARK: input -> readLine 함수의 결과값은 옵셔널입니다. 또, 사용자가 순수하게 숫자만 입력했더라도 항상 문자열로 인식하여 입력됩니다.
/*
 print("입력해주세요 : ")
 let input: String? = readLine()
 */

//print("입력해주세요 :")
//while let input : String? = readLine(){
//    if input == "x"{
//        print("종료합니다")
//        break
//
//    }else{
//        if let input = input{
//            print("입력값은 \(input)입니다.")
//            print("입력해주세요 :")
//
//        }else{
//            print("nil")
//        }
//    }
//}
/*
 //MARK: Error 처리하기
 enum VendingMachineError: Error {
 case insufficientFunds
 case outOfStock
 }
 
 class VendingMachine {
 private var itemStock: Int = 2
 private var coinsDeposited: Int = 0
 
 // Computed Property
 var isOutOfStock: Bool {
 return itemStock < 1
 }
 
 var price: Int {
 return 100
 }
 
 func insertCoin(amount: Int) {
 coinsDeposited += amount
 }
 
 func vend(amount: Int = 1) throws -> String {
 guard isOutOfStock == false else {
 throw VendingMachineError.outOfStock
 }
 
 guard coinsDeposited >= price * amount else {
 throw VendingMachineError.insufficientFunds
 }
 
 coinsDeposited = coinsDeposited - (amount * price)
 
 return "상품"
 }
 }
 
 //func orderSoda(amount: Int = 1, machine: VendingMachine) throws {
 //    let item: String = try machine.vend(amount: amount)
 //    print("\(item) 받았음")
 //}
 
 //let machine: VendingMachine = VendingMachine()
 //try orderSoda(amount: 3, machine: machine)
 
 //do {
 //    try orderSoda(amount: 3, machine: machine)
 //} catch VendingMachineError.insufficientFunds {
 //    print("돈 모자람")
 //} catch VendingMachineError.outOfStock {
 //    print("재고 부족")
 //}
 func orderSoda(amount: Int = 1, machine: VendingMachine) {
 
 do {
 let item: String = try machine.vend(amount: amount)
 print("\(item) 받았음")
 } catch VendingMachineError.insufficientFunds {
 print("돈 모자람")
 } catch VendingMachineError.outOfStock {
 print("재고 부족")
 } catch {
 print(error)
 }
 }
 //위의 방식대로 따로 뺀 다음에 do-catch를 사용해주는 것도 좋은 방식이지만
 //func안에서 do-catch를 사용하여 막힘없이 진행하는 것도 더 좋은 방식이다.
 
 
 let machine: VendingMachine = VendingMachine()
 orderSoda(amount: 3, machine: machine)
 
 
 */


//MARK: Week4 Step2

/*
enum FitnessProcessError: Error{
    case overFatigue
    case noMembers
    case needMoreExercies
    case goalConditionOutOfRange
}



class BodyCondition {
    var upperBody : Int
    var lowerBody : Int
    var endurance : Int
    var fatigue : Int
    
    init(){
        self.upperBody = 0
        self.lowerBody = 0
        self.endurance = 0
        self.fatigue = 0
    }
    
    init(upperBody: Int, lowerBody: Int, endurance: Int, fatigue: Int){
        self.upperBody = upperBody
        self.lowerBody = lowerBody
        self.endurance = endurance
        self.fatigue = fatigue
    }
    
    func showBodyCondition(){
        print("상체근력 :\(upperBody)")
        print("하체근력 :\(lowerBody)")
        print("근지구력 :\(endurance)")
        print("피로도 :\(fatigue)")
    }
}

//기존에 Body만 있었을 때에는 FitnessCenter라는 class가 두번을 참조해서 Body값이 변하면 참조된 값이 모두 바뀌었다.
//그래서 참조되는 값을 분리하여서 두개로 만들어주었다.
var Body = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)
var targetBodyCondition = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)

//운동 타입
struct Exercise {
    let name: String
    let action: () -> Void
}

struct Routine{
    var name: String = "3분할 중 첫번째 Routine"
    var exercises : Array = [pushUp ,
                             sitUp ,
                             activeRest ]
}

class Person{
    var name : String
    var bodyCondition : BodyCondition = Body
    
    init(){
        self.name = "JeeSangRyul"
    }
    init(name:String){
        self.name = name
    }
    
    func exercise (set: Int, routine: Routine) {
        for setNumber in 1...set{
            print("------------------------")
            print("\(routine.name) \(setNumber)Set를 시작하겠습니다.")
            for exercises in routine.exercises{
                print(exercises.name)
                exercises.action() //exercises안에 있는 클로져 실행
            }
        }
    }
}
var someOne : Person = Person(name: "JeeSangRyul")
someOne.bodyCondition = Body


//예시 운동
//클로저라고 두가지의 변수를 받아서 각자 역할을 하는 기능을 못한다고 생각했다.
//함수와 똑같기 때문에 변수를 두개 받아와 두개 다 각자 역할을 한다음에 각자 있는 곳에 저장되는 로직을 짜보았다.
let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    someOne.bodyCondition.upperBody += Int.random(in: 10...20)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let squat: Exercise = Exercise(name: "스쿼트") {
    someOne.bodyCondition.lowerBody += Int.random(in: 20...30)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let pushUp: Exercise = Exercise(name: "팔굽혀피기") {
    someOne.bodyCondition.upperBody += Int.random(in: 10...20)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let shuttleRun : Exercise = Exercise(name: "오래달리기") {
    someOne.bodyCondition.endurance += Int.random(in: 20...30)
    someOne.bodyCondition.upperBody += Int.random(in: 5...10)
    someOne.bodyCondition.lowerBody += Int.random(in: 5...10)
    someOne.bodyCondition.fatigue += Int.random(in: 15...20)
}
let deadLift : Exercise = Exercise(name: "데드리프트") {
    someOne.bodyCondition.upperBody += Int.random(in: 5...10)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let activeRest : Exercise = Exercise(name: "동적휴식") {
    someOne.bodyCondition.fatigue -= Int.random(in: 5...10)
}

var firstRoutine : Routine = Routine(name: "3분할 중 첫번째 Routine", exercises: [pushUp ,sitUp ,activeRest])

var secoundRoutine : Routine = Routine(name: "3분할 중 두번째 Routine", exercises: [deadLift, sitUp , activeRest] )

var thirdRoutine : Routine = Routine(name: "3분할 중 세번째 Routine", exercises: [squat, sitUp , shuttleRun , activeRest])

var routineArray : [Routine] = [firstRoutine, secoundRoutine, thirdRoutine]



class FitnessCenter{
    var member : String?
    var goalBodyCondition : BodyCondition = targetBodyCondition
    var totalRoutine : [Routine] = routineArray
    
    
    //이름을 입력받아 저장하는 매소드
    // member에 입력값을 받아서 nil일 경우 아래로 타지않고 거기서 멈추는 로직이다.
    func inputMemberName() {
        self.member = readLine()
        guard let memberName = self.member else{ return }
        someOne.name = memberName
    }
    
    //저장받은 member가 nil인 경우 error를 반환해주는 메소드
    //inputMemberName이라는 함수를 실행하고 someOne.name이 빈 값이라면 error를 던져주는 구문이다.
    func saveMemeberName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        inputMemberName()
        
        // != nil은 아예 값이 없어야하기 때문에 다루기 어려웠다. 그래서 아무것도 없는 Empty를 한다면 보다 보편적인 상황을 막을수있다고 생각했다.
        guard someOne.name.isEmpty == false else{
            throw FitnessProcessError.noMembers
        }
    }

    
    //회원의 오늘 goalbodycondition을 입력받는다.
    //입력값을 연속으로 세개를 받아서 array로 만들어준다음 goalBodyCondition에 각각 Int로 할당해주는 로직이다.
    //목적치가 -일 경우 error를 던져준다.
    func inputGoalBodyCondition() throws{
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력: 130, 하체근력: 120, 근지구력: 150")
        let inputBodycondition =  readLine()
        if let inputBodycondition = inputBodycondition {
            let array = inputBodycondition.components(separatedBy: " ")
            if let goalUpperBody = Int(array[0]),
               let goalLowerBody = Int(array[1]),
               let goalEndurance = Int(array[2]) {
                goalBodyCondition.upperBody = goalUpperBody
                goalBodyCondition.lowerBody = goalLowerBody
                goalBodyCondition.endurance = goalEndurance
                guard goalBodyCondition.upperBody >= 0
                        && goalBodyCondition.lowerBody >= 0
                        && goalBodyCondition.endurance >= 0 else {
                            throw FitnessProcessError.goalConditionOutOfRange
                        }
            }
        }
    }

    
    func showTotalRoutine(){
        print("몇 번째 루틴으로 운동하시겠어요?")
        var index :Int = 0
        for (routineName) in totalRoutine {
            index += 1
            print("\(index): \(routineName.name)")
            
        }
    }
    //회원이 운동을 실행한다.
    //입력값을 옵셔널을 벗겨준다음 int로 바꿔준다.
    //조건에 맞게 루틴과 세트를 실행한다.
    //만약 피로도가 100을 넘거나 목표치를 못채웠다면 error가 던져진다.
    func inputRoutineAndSet() throws {
        showTotalRoutine()
        let routineNumber: String? = readLine()
        if let routinenumber = Int(routineNumber ?? "0"){
            if routinenumber == 1{
                print("몇 세트 반복하시겠어요?")
                let routineSet: String? = readLine()
                if let routineSet = Int(routineSet ?? "0") {
                    someOne.exercise(set: routineSet, routine: firstRoutine)
                    
                    guard someOne.bodyCondition.fatigue <= 100 else{
                        throw FitnessProcessError.overFatigue
                    }
                }
            }else if routinenumber == 2{
                print("몇 세트 반복하시겠어요?")
                let routineSet: String? = readLine()
                if let routineSet = Int(routineSet ?? "0") {
                    someOne.exercise(set: routineSet, routine: secoundRoutine)
                    
                    guard someOne.bodyCondition.fatigue <= 100 else{
                        throw FitnessProcessError.overFatigue
                    }
                }
            }else if routinenumber == 3{
                print("몇 세트 반복하시겠어요?")
                let routineSet: String? = readLine()
                if let routineSet = Int(routineSet ?? "0") {
                    someOne.exercise(set: routineSet, routine: thirdRoutine)
                    
                    guard someOne.bodyCondition.fatigue <= 100 else{
                        throw FitnessProcessError.overFatigue
                    }
                }
            }
            guard goalBodyCondition.upperBody <= someOne.bodyCondition.upperBody else{
                throw FitnessProcessError.needMoreExercies
            }
            guard goalBodyCondition.lowerBody <= someOne.bodyCondition.lowerBody else{
                throw FitnessProcessError.needMoreExercies
            }
            guard goalBodyCondition.endurance <= someOne.bodyCondition.endurance else{
                throw FitnessProcessError.needMoreExercies
            }
        }
    }
    
    //위에서 던진 모든 error를 해결해주는 함수이다.
    //함수에서 직접 error를 처러해주는 형식이 좀더 좋아보인다.
    func membersExercies() throws {
        do{
            try saveMemeberName()
            print("현재 \(someOne.name)님의 \(someOne.bodyCondition.showBodyCondition())컨디션입니다.")
            try inputGoalBodyCondition()
            print("\(someOne.name)님이 입력하신 목표치는 상체근력: \(goalBodyCondition.upperBody), 하체근력: \(goalBodyCondition.lowerBody) , 근지구력: \(goalBodyCondition.endurance)입니다.")
            try inputRoutineAndSet()
            
            print("------------------------")
            print("성공입니다! 현재 \(someOne.name)님의 컨디션은 다음과 같습니다.")
            someOne.bodyCondition.showBodyCondition()
        } catch FitnessProcessError.noMembers{
            print("회원의 이름이 없습니다. 처음부터 다시 진행해주세요.")
            return
        } catch FitnessProcessError.goalConditionOutOfRange{
            print("목표치를 0보다 작게 입력할 수 없습니다. 처음부터 다시 진행해주세요.")
            return
        } catch FitnessProcessError.overFatigue{
            print("------------------------")
            print("\(someOne.name)님의 피로도가 \(someOne.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
            return
        } catch FitnessProcessError.needMoreExercies{
            print("------------------------")
            print("목표치에 도달하지 못했습니다. 현재 \(someOne.name)님의 컨디션은 다음과 같습니다.")
            someOne.bodyCondition.showBodyCondition()
            print("------------------------")
            try inputRoutineAndSet()
        } catch{
            print(error)
        }
    }
}//class
var yagom : FitnessCenter = FitnessCenter()
try yagom.membersExercies()


*/
