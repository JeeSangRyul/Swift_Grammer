//
//  main.swift
//  Week5_Test
//
//  Created by 지상률 on 2022/03/16.
//

import Foundation
/*
// MARK: 프로토콜 정의
 - "어떠한 기능이 무조건 필요하니까 이러한 것을 가지고 있어야해" 라는 것을 강요한다고 생각하면된다.
 protocol 프로토콜 이름 {
     /* 정의부 */
 }
 
protocol Cookable {
    var license: String? { get set }
    
    func cook()//채택한 타입에서 {}정의해 준다.
    
    //채택한 타입이 구조체일 경우 구조체 안에서 수정이 일어날 경우 mutating을 적어준다.
 //프로토콜 안의 메소드 안에 mutating있고 class가 채택한다면 mutating을 제거하고 사용한다.
}


class Chef: Cookable {
    var license: String? //let을 이용하여 나타낼 수도 있다.
    
    func cook() {
    기능 구현
    }
    
    // ...
}

class Mother: Cookable {
    var license: String?
    
    func cook() {
    기능 구현
    }
    
    // ...
}
 
 
 
 //MARK: 다른예시
 protocol Talkable {
     
     // 프로퍼티 요구
     // 프로퍼티 요구는 항상 var 키워드를 사용합니다
     // get은 읽기만 가능해도 상관 없다는 뜻이며
     // get과 set을 모두 명시하면
     // 읽기 쓰기 모두 가능한 프로퍼티여야 합니다
     var topic: String { get set }
     var language: String { get }
     
     // 메서드 요구
     func talk()
     
     // 이니셜라이저 요구
     init(topic: String, language: String)
 }
 // MARK: 프로토콜 채택 및 준수
 // Person 구조체는 Talkable 프로토콜을 채택했습니다
 struct Person: Talkable {
     // 프로퍼티 요구 준수
     var topic: String
     let language: String //상수로 읽기 전용을 구현해주었다.
     
     // 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능합니다
 //    var language: String { get { return "한국어" }} //읽기전용
     
     // 물론 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있습니다
 //    var subject: String = ""
 //    var topic: String {
 //        set {
 //            self.subject = newValue
 //        }
 //        get {
 //            return self.subject
 //        }
 //    }
     
     // 메서드 요구 준수
     func talk() {
         print("\(topic)에 대해 \(language)로 말합니다")
     }

     // 이니셜라이저 요구 준수
     init(topic: String, language: String) {
         self.topic = topic
         self.language = language
     }
 }
*/


/*
//MARK: 프로토콜 vs 상속
protocol Cookable {
    var license: String? { get set }
    
    func cook()
}

protocol InfantCarable {
    func changeDiaper()
}

class Mother: Cookable, InfantCarable {
    var license: String?
    
    func cook() {
        
    }
    func changeDiaper() {
        
    }
    
    
    // ...
}

class Father: InfantCarable {
    func changeDiaper() {
        
    }

    // ...
}

struct Babysitter: InfantCarable {
    func changeDiaper() {
        
    }

    // ...
}
 
 //MARK: 다른예시
 (프로토콜에 프로토콜을 상속해준다.)-> 더 많은 요구사항을 추가할 수 있다.
 protocol Readable {
     func read()
 }
 protocol Writeable {
     func write()
 }
 protocol ReadSpeakable: Readable {
     func speak()
 }
 protocol ReadWriteSpeakable: Readable, Writeable {
     func speak()
 }

 struct SomeType: ReadWriteSpeakable {
     func read() {
         print("Read")
     }
     
     func write() {
         print("Write")
     }
     
     func speak() {
         print("Speak")
     }
 }
 */

//MARK: 프로토콜의 활용
protocol Workable {
    var tool: String? { get set }
    
    func work()
}

struct Developer: Workable {
    var tool: String? = "Mac"
    
    func work() {
        print("키보드 뚝딱뚝딱")
    }
}

struct Carpenter: Workable {
    var tool: String? = "hammer"
    
    func work() {
        print("의자를 뚝딱뚝딱")
    }
}

/*
 //MARK: 클래스 상속과 프로토콜
 : 상속과 채택을 동시에 하려면 상속받으려는 클래스를 먼저 명시하고 그 뒤에 프로토콜 작성.
 class SuperClass: Readable {
     func read() { }
 }
 class SubClass: SuperClass, Writeable, ReadSpeakable {
     func write() { }
     func speak() { }
 }
 
//MARK: 프로토콜 준수 확인
 //캐스팅
 let sup: SuperClass = SuperClass() //Readable
 let sub: SubClass = SubClass() //SuperClass, Writeable, ReadSpeakable

 var someAny: Any = sup
 someAny is Readable // true
 someAny is ReadSpeakable // false

 someAny = sub
 someAny is Readable // true
 someAny is ReadSpeakable // true

 someAny = sup
 
 
 if let someReadable: Readable = someAny as? Readable {
     someReadable.read()
 } // read

 if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
     someReadSpeakable.speak()
 } // 동작하지 않음

 someAny = sub

 if let someReadable: Readable = someAny as? Readable {
     someReadable.read()
 } // read
*/

 // MARK: 타입 캐스팅 (is, as) - 확인하는 용도
// 스위프트의 타입캐스팅은
// 인스턴스의 타입을 확인하는 용도
//--------
// 또는 클래스의 인스턴스를
// 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
// 확인하는 용도로 사용합니다
// is, as를 사용합니다


/*
// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}
//인스턴스 생성
var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()


//MARK: - 타입 확인
// is를 사용하여 타입을 확인합니다
var result: Bool

result = yagom is Person // true
result = yagom is Student // false
result = yagom is UniversityStudent // false

result = hana is Person // true
result = hana is Student // true , 학생은 사람 특성을 모두 받았기 때문에 true를 반환한다.
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

//if-else if
if yagom is UniversityStudent {
    print("yagom은 대학생입니다")
} else if yagom is Student {
    print("yagom은 학생입니다")
} else if yagom is Person {
    print("yagom은 사람입니다")
} // yagom은 사람입니다

//switch
switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 사람입니다

//switch
switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다


//MARK: - 업 캐스팅(많이 사용하지 않는다.)
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 타입정보를 전환해줍니다
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있습니다
// 암시적으로 처리되므로 생략해도 무방합니다
var mike: Person = UniversityStudent() as Person //업 캐스팅으로 Person()을 나타내지만, 실질적으로 UniversityStudent이다.
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var jina: Any = Person() // as Any 생략가능

//MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해줍니다
// MARK: **** 다운캐스팅은 항상 가능한 것이 아닌 업캐스팅한 것을 다시 다운캐스팅하는 경우에 사용하는 것 ****
//MARK: 조건부 다운 캐스팅
// as? - optional로 반환
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

//MARK: 강제 다운 캐스팅
// as! - optional로 반환 x
var forcedCasted: Student

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류

// 활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: yagom) // 숨을 쉽니다

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
} //매개변수에 Person을 두어 먼저 업케이팅 시킨후에 다운케스팅 해준다.

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: yagom) // 숨을 쉽니다
*/
//MARK: - 익스텐션

//익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에
//새로운 기능을 추가할 수 있는 기능입니다.
//기능을 추가하려는 타입의 구현된 소스 코드를
//알지 못하거나 볼 수 없다 해도,
//타입만 알고 있다면 그 타입의 기능을 확장할 수도 있습니다.
//익스텐션으로 추가할 수 있는 기능
//연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
//타입 메서드 / 인스턴스 메서드
//이니셜라이저
//서브스크립트
//중첩 타입
//특정 프로토콜을 준수할 수 있도록 기능 추가
//기존에 존재하는 기능을 재정의할 수는 없습니다
//MARK: - 정의 문법
/*
extension <#확장할 타입 이름#> {
    /* 타입에 추가될 새로운 기능 구현 */
}
 */

//익스텐션은 기존에 존재하는 타입이
//추가적으로 다른 프로토콜을 채택할 수 있도록
//확장할 수도 있습니다.
/*
extension <#확장할 타입 이름#>: <#프로토콜1#>, <#프로토콜2#>, <#프로토콜3#>... {
    /* 프로토콜 요구사항 구현 */
}
 */

//MARK: - 익스텐션 구현
//MARK: 연산 프로퍼티 추가
//extension Int {
//    var isEven: Bool {
//        return self % 2 == 0
//    }
//    var isOdd: Bool {
//        return self % 2 == 1
//    }
//}
//
//print(1.isEven) // false
//print(2.isEven) // true
//print(1.isOdd)  // true
//print(2.isOdd)  // false
//var number: Int = 3
//print(number.isEven) // false
//print(number.isOdd) // true
//number = 2
//print(number.isEven) // true
//print(number.isOdd) // false
//
//
////MARK: 메서드 추가
//extension Int {
//    func multiply(by n: Int) -> Int {
//        return self * n
//    }
//}
//print(3.multiply(by: 2))  // 6
//print(4.multiply(by: 5))  // 20
//number = 3
//print(number.multiply(by: 2))   // 6
//print(number.multiply(by: 3))   // 9
//
////MARK: 이니셜라이저 추가
//extension String {
//    init(int: Int) {
//        self = "\(int)"
//    }
//
//    init(double: Double) {
//        self = "\(double)"
//    }
//}
//
//let stringFromInt: String = String(int: 100)
//// "100"
//let stringFromDouble: String = String(double: 100.0)
//// "100.0"
//
//
/*
//MARK: -week5 step1
class Person {
    var name: String
    var height: Int

    init() {
        self.name = "지상률"
        self.height = 28
    }
    init(name: String, height: Int){
        self.name = name
        self.height = height
    }
}

enum Level {
    case A
    case B
    case C
}

protocol Talent {
    var singing: Level { get set }
    var dancing: Level { get set }
    var acting: Level { get set }
}

protocol BadPersonality {
    var frequencyOfCursing: Level { get set }
}

class TalentedPerson: Person, Talent {
    var singing: Level
    var dancing: Level
    var acting: Level

    init(singing: Level, dancing: Level, acting: Level, name: String, height: Int){
        self.singing = singing
        self.dancing =  dancing
        self.acting = acting
        super.init(name: name, height: height) //Designated Initializer에서 해당 클래스의 stored property를 모두 초기화해야
        //슈퍼클래스의 Designated Initializer를 호출할 수 있다.
    }
}

class TalentedPersonWithBadPersonality: Person, Talent, BadPersonality {
    var singing: Level
    var dancing: Level
    var acting: Level
    var frequencyOfCursing: Level

    init(singing: Level, dancing: Level, acting: Level, frequencyOfCursing: Level, name: String, height: Int){
        self.singing = singing
        self.dancing =  dancing
        self.acting = acting
        self.frequencyOfCursing = frequencyOfCursing
        super.init(name: name, height: height)
    }
}

struct AuditionManager {
    var totalApplicantsList: [Person]
    var passedApplicantsList: [Person] = []
    var failedApplicantsList: [Person] = []
    
    mutating func cast() {
        for someApplicant in totalApplicantsList {
            if let someApplicant = someApplicant as? TalentedPerson {
                if someApplicant.singing == .A || someApplicant.acting == .A || someApplicant.dancing == .A{
                    passedApplicantsList.append(someApplicant)
                }
            }else if let someApplicant = someApplicant as? TalentedPersonWithBadPersonality {
                if someApplicant.frequencyOfCursing == .A {
                    failedApplicantsList.append(someApplicant)
                }else {
                    if someApplicant.singing == .A || someApplicant.acting == .A || someApplicant.dancing == .A{
                        passedApplicantsList.append(someApplicant)
                    }
                }
            }else if let someApplicant = someApplicant as? Person {
                failedApplicantsList.append(someApplicant)
            }
        }
        print("---합격자 명단---")
        for someApplicant in passedApplicantsList {
            print("\(someApplicant.name)")
        }
        print("--------------")
        print("축하합니다!!")
    }
}

let yagom: TalentedPerson = TalentedPerson(singing: .B, dancing: .A, acting: .C, name: "yagom", height: 100)
let noroo: Person = Person(name: "noroo", height: 1000)
let summer: TalentedPerson = TalentedPerson(singing: .B, dancing: .B, acting: .B, name: "summer", height: 900)
let coda: TalentedPerson = TalentedPerson(singing: .A, dancing: .C, acting: .C, name: "coda", height: 200)
let odong: TalentedPersonWithBadPersonality = TalentedPersonWithBadPersonality(singing: .A, dancing: .A, acting: .A, frequencyOfCursing: .A, name: "odong", height: 400)

var auditionManager: AuditionManager = AuditionManager(totalApplicantsList: [yagom, noroo, summer, coda, odong])

auditionManager.cast()
*/

//MARK: - 접근 제어(Access Control)-open, public, internal, fileprivate, private (접근 수준 오름차순)

//internal이 default값이다.(swift)
public class MyClass{
    fileprivate var name: String = "Kim"
    //현재 소스 파일 내에서만 사용 가능, 다른 스위프트 파일에서는 접근할 수 없다.
    private func play() {}
    //현재 블럭 내에서만 사용가능, 이 class안에서만 접근이 가능하다.
    func display() {}
}
//public : 거의 누구나 접근이 가능하다. 다른 스위프트 파일에서도 접근이 가능하다.

//MARK: 접근 제어 예
//open class var blue : UIColor {get} -> 타입 프로퍼티
//open : 모듈 외부까지(클래스에만 사용) 접근 가능
//class : 클래스 프로퍼티
//읽기 쓰기 가능한 프로퍼티는 정의 뒤에 {get set}
//읽기만 가능한 프로퍼티는 정의 뒤에 {get}

//MARK: 접근 제어 예시 2
/*
 //첫번째 파일
  class MathDoer{
      public func perform(x: Int, y: Int) -> Int {
          return add(x: x, y: y)
      }
      
      private func add(x: Int, y: Int) -> Int {
          return x + y
      }
  
  }
  //두번째 파일
 let object = MathDoer()
 let sum = object.perform(x: 1, y: 2) //object.add는 접근할 수 없다.
 print(sum)
 */

//은닉화 : 주요 사항이 겉으로 드러나지 않도록 감추는 것 .
//캡슐화 : 중요사항을 감춘 상태에서 외부에서 그것을 사용할 수 있는 방법을 제공하고 외부와 소통을 하는 것
//즉, 운전자가 직접 자동차 하부의 전진 기어를 엔진으로 연결하도록 하는 것이 아니라, 차에게 전진 명령을 주면 자동차의 인스턴스가 전진 기어를 엔진으로 연결하게 만드는 것
/*
 MARK: 예시
 enum Fuel {
     case gasoline, diesel
 }

 enum Direction {
     case left, right
 }

 enum Gear {
     case forward, reverse
 }

 struct Car {
     let fuel: Fuel
     let capacity: Int
     private(set) var color: UIColor = .red
 //Car과 fuel,capacity라는 저장프로퍼티는 일단 아무런 접근 수준을 지정하지 않았으니 기본적으로 internal 접근 수준을 가지고있다.
 //하지만 color앞에는 특이하게 private(set)이 붙은 것을 알 수 있습니다. 이 color는
//Car구조체 코드 내에서만 설정(set)할 수 있다는 것을 의미합니다. 하지만 set만이 privated이다.
//즉 읽기는 구조체 정의 외부에서도 접근이 가능하다는 뜻이다. Car라는 구조체는 internal을 내제하고 있기 때문에 이 모듈내부 어디에서든 읽기는 가능하다 하지만 설정은 오직 Car라는 구조체 안에서만 가능하다는 뜻이다.
     private var gear: Gear = .forward
     
     init(fuel: Fuel = .gasoline, capacity: Int = 5) {
         self.fuel = fuel
         self.capacity = capacity
     }

     mutating func goForward() {
         gear = .forward
         print("전진")
     }
     
     mutating func reverse() {
         gear = .reverse
         print("후진")
     }

     func turn(to: Direction) {
         print("\(to)로 회전")
     }

     mutating func changeColor(to: UIColor) {
         color = to
     }
 }
차 인스턴스 외부의 인스턴스가 해당 프로퍼티의 값을 함부러 수정할 수 없게 되었다는 뜻입니다. 또, gear 프로퍼티가 private 으로 접근제한 되면서 인스턴스 외부에서는 아예 gear의 값을 읽지도 쓰지도 못하게 되었습니다.
 인스턴스 내부에서만 읽고 쓸 수 있다는 뜻이지요. 인스턴스 외부에서 gear 의 상태를 변경하는 방법은 goForward 또는 reverse 메소드를 호출하는 것 뿐인데, 그마저도 gear의 상태가 변경되었는지 알 길이 없습니다.
 사실 인스턴스 외부에선 기어가 변경됐는지 어쨌는지 신경쓸 필요가 없는거죠. 명령에 맞게 동작만 잘 하면 되는거니까요.

 처음 예를 들었던 집의 코드를 보면 색을 직접 외부에서 수정하도록 했는데, 이는 집 자산 중 일부인 페인트 색상을 아무나 바꿀 수 있도록 허용한 것과 다름없습니다. 그래서 집의 색상을 아무나 바꾸지 못하도록 접근할 수 없게 만든 뒤, 특정한 창구를 통해서만 색상변경을 요청하도록하여, 적절히 상황에 대비할 수 있습니다. 그 창구의 역할은 주로 메소드가 합니다.

 */

//MARK: - 모듈과 소스파일
//모듈: 코드 배포(code distribution)의 단일 유닛
//앱, Framework,외부라이브러리 등
//import Alamofire - 스위프트에서는 import 키워드를 사용해 불러온다.


//MARK: -접근수준(Access Level)
/*
 open: 개방 접근 수준(모듈 외부까지), 클래스에서만 사용
 public: 공개 접근 수준(모듈 외부까지)
 internal: 내부 접근 수준(모듈 내부)
 fileprivate: 파일 외부 비공개 접근 수준(파일 내부)
 private: 비공개 접근 수준(기능 정의 내부)
 
 
 -public 키워드로 접근 수준이 지정된 요소는 어디서든 쓰일 수 있습니다. 자신이 구현된 소스 파일은 물론, 그 소스파일이 속해 있는 모듈, 그 모듈을 가져다 쓰는 모듈 등 모든 곳에서 사용할 수 있습니다.
 공개(Public) 접근 수준은 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 쓰입니다. 우리가 사용하는 스위프트의 기본 요소는 모두 공개 접근 수준으로 구현 되어 있다고 생각하면 됩니다.
 
 -open : Public접근 이상으로 높은 접근 수준이며 클래스와 클래스 멤버에서만 사용가능 하다는 특징이 있다.
 1.개방 접근 수준을 제외한 다른 모든 접근수준의 클래스는 그 클래스가 정의된 모듈 안에서만 상속할 수 있습니다. open으로 정의된 class만 모듈 밖까지 상속할 수 있다.
 2.개방 접근 수준을 제외한 다른 모든 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 안에서만 재정의할 수 있습니다. open으로 정의된 class만 모듈 밖에서 override될 수 있다.
 3.개방 접근 수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속할 수 있습니다.  (1번 의미)
 4.개방 접근 수준의 클래스 멤버는 해당 멤버가 정의된 모듈 밖의 다른 모듈에서도 재정의(override)할 수 있습니다. (2번 의미)
 5.클래스를 개방 접근 수준으로 명시하는 것은 그 클래스를 다른 모듈에서도 부모클래스로 사용 하겠다는 목적으로 클래스를 설계하고 코드를 작성했음을 의미합니다.
 
 
 MARK: 언제 public VS open ?
 - 라이브러리 사용자(프로그래머)가 해당 모듈의 class를 상속받아 사용하고 상속 후에 재정의하고 싶다면 open으로 설정하고,
 그렇지 않고 클래스를 상속받거나 재정의 할 수 없도록 만들고싶다면 public으로 설정한다.
 
 open class NSString : NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
        open var length: Int { get }
        open func character(at index: Int) -> unichar
        public init()
        public init?(coder aDecoder: NSCoder)
 }

 
 -internal(내부 접근 수준) : 지정된 요소는 소스파일이 속해 있는 모듈 어디에서든 쓰일 수 있다. 다만 해당 모듈을 가져다 쓰는 외부 모듈에서는 접근할 수 없다.
 보통 모듈 내부에서 광역적으로 사용할 경우 내부 접근 수준을 지정한다.
 
 -fileprivate(파일 외부 비공개 접근 수준) : 소스파일 내부에서만 사용 가능하다.
 
 -private(비공개 접근 수준) : 그 기능을 정의하고 구현한 범위 내에서만 사용가능하다. 심지어 같은 소스 파일안에 구현한 다른 타입이나 기능에서도 사용할 수 없다.
 */

//MARK: -접근 제어 구현 참고사항
/*
 *** 상위 접근 수준 요소 보다 하위 요소가 더 높은 접근 수준을 가질 수 없다. ***
 
  잘못된 접근 수준 부여
 private class AClass {
     // 공개 접근 수준을 부여해도 AClass의 접근 수준이 비공개 접근 수준이므로
     // 이 메서드의 접근 수준도 비공개 접근 수준으로 취급됩니다.
     public func someMethod() { //public을 지워주게 되면 자동으로 private메소드가 된다.
         // ...
     }
 }
 // AClass의 접근 수준이 비공개 접근 수준이므로
 // 공개 접근 수준 함수의 매개변수나 반환 값 타입으로 사용할 수 없습니다.
 //함수의 매개변수로 특정 접근수준이 부여된 타입이 전달되거나 반환된다면, 그 타입의 접근 수준보다 함수의 접근 수준이 높게 설정될 수 없다.
 public func someFunction(a: AClass) -> AClass { //someFunction의 접근 수준이 private였으면 오류가 발생하지 않는다.
     // 오류 발생!
     return a
 }
 */
//MARK: -private VS fileprivate
/*
 
 -private 접근 수준으로 지정한 요소는 같은 파일 내부에 다른 타입의 코드가 있더라도 접근이 불가능하다.
 하지만 extension 코드가 같은 파일에 존재한다면 접근할 수 있다.
 
 public struct SomeType {
        private var privateVariable = 0
        fileprivate var fileprivateVariable = 0
 }
 // 같은 타입의 익스텐션에서는 private 요소에 접근 가능
 extension SomeType {
     public func publicMethod() {
         print("\(self.privateVariable), \(self.fileprivateVariable)")
     }
     private func privateMethod() {
         print("\(self.privateVariable), \(self.fileprivateVariable)")
     }
     fileprivate func fileprivateMethod() {
         print("\(self.privateVariable), \(self.fileprivateVariable)")
     }
 }
 struct AnotherType {
     var someInstance: SomeType = SomeType()
     mutating func someMethod() {
         // public 접근 수준에는 어디서든 접근 가능
         self.someInstance.publicMethod() // 0, 0
         // 같은 파일에 속해 있는 코드이므로 fileprivate 접근 수준 요소에 접근 가능
         self.someInstance.fileprivateVariable = 100
         self.someInstance.fileprivateMethod() // 0, 100
 
         // 다른 타입 내부의 코드이므로 private 요소에 접근 불가! 오류! -> extension이 아니라 다른 타입에서 접근하기 때문에 에러이다.
         // self.someInstance.privateVariable = 100
         // self.someInstance.privateMethod()
     }
 }
 var anotherInstance = AnotherType()
 anotherInstance.someMethod()

 */

//MARK: -읽기 전용 구현
/*
 public struct SomeType {
     // 비공개 접근 수준 저장 프로퍼티 count
     private var count: Int = 0
     // 공개 접근 수준 저장 프로퍼티 publicStoredProperty
     public var publicStoredProperty: Int = 0
     // 공개 접근 수준 저장 프로퍼티 publicGetOnlyStoredProperty
     // 설정자는 비공개 접근 수준
     public private(set) var publicGetOnlyStoredProperty: Int = 0
 //private(set)에 public을 붙인 이유는 외부 모듈에서도 이 class안에 있는 publicGetOnlyStoredProperty라는 변수를 읽기 위해서 이다. 만약 public을 적어주지 않는다면 internal로
 지정되어 외부 모듈에서 이 구조체 안에 publicGetOnlyStoredProperty을 읽을 수 없기때문이다.
 
     // 내부 접근 수준 연산 프로퍼티 internalComputedProperty
     internal var internalComputedProperty: Int {
         get {
             return count
         }
         set {
             count += 1
         }
     }
     // 내부 접근 수준 저장 프로퍼티 internalGetOnlyComputedProperty
     // 설정자는 비공개 접근 수준
     internal private(set) var internalGetOnlyComputedProperty: Int { //위의 내용과 반대로 이 변수는 이 모듈에 안에서만 읽어 올 것이기 때문에 internal을 적어 준 것이다.
         get {
             return count
         }
         set {
             count += 1
         }
     }
 }

 var someInstance: SomeType = SomeType()
 // 외부에서 접근자, 설정자 모두 사용 가능
 print(someInstance.publicStoredProperty)    // 0
 someInstance.publicStoredProperty = 100
 // 외부에서 접근자만 사용 가능
 print(someInstance.publicGetOnlyStoredProperty) // 0
 //someInstance.publicGetOnlyStoredProperty = 100    // 오류 발생
 // 외부에서 접근자, 설정자 모두 사용 가능
 print(someInstance.internalComputedProperty)    // 0
 someInstance.internalComputedProperty = 100
 // 외부에서 접근자만 사용 가능
 print(someInstance.internalGetOnlyComputedProperty)     // 1
 //someInstance.internalGetOnlyComputedProperty = 100    // 오류 발생

 */
class Person {
    var name: String
    var height: Int

    init() {
        self.name = "지상률"
        self.height = 28
    }
    init(name: String, height: Int){
        self.name = name
        self.height = height
    }
}

enum Level {
    case A
    case B
    case C
}

protocol Talent {
    var singing: Level { get set }
    var dancing: Level { get set }
    var acting: Level { get set }
}

protocol BadPersonality {
    var frequencyOfCursing: Level { get set }
}

class TalentedPerson: Person, Talent {
    var singing: Level
    var dancing: Level
    var acting: Level

    init(singing: Level, dancing: Level, acting: Level, name: String, height: Int){
        self.singing = singing
        self.dancing =  dancing
        self.acting = acting
        super.init(name: name, height: height) //Designated Initializer에서 해당 클래스의 stored property를 모두 초기화해야
        //슈퍼클래스의 Designated Initializer를 호출할 수 있다.
    }
}

class TalentedPersonWithBadPersonality: Person, Talent, BadPersonality {
    var singing: Level
    var dancing: Level
    var acting: Level
    var frequencyOfCursing: Level

    init(singing: Level, dancing: Level, acting: Level, frequencyOfCursing: Level, name: String, height: Int){
        self.singing = singing
        self.dancing =  dancing
        self.acting = acting
        self.frequencyOfCursing = frequencyOfCursing
        super.init(name: name, height: height)
    }
}


struct AuditionManager {
    private(set) var totalApplicantsList: [Person] = [yagom, noroo, summer, coda, odong]
    private var passedApplicantsList: [Person] = []
    var failedApplicantsList: [Person] = []
    
    mutating func cast() {
        for someApplicant in totalApplicantsList {
            if let someApplicant = someApplicant as? TalentedPerson {
                if someApplicant.singing == .A || someApplicant.acting == .A || someApplicant.dancing == .A{
                    passedApplicantsList.append(someApplicant)
                }
            }else if let someApplicant = someApplicant as? TalentedPersonWithBadPersonality {
                if someApplicant.frequencyOfCursing == .A {
                    failedApplicantsList.append(someApplicant)
                }else {
                    if someApplicant.singing == .A || someApplicant.acting == .A || someApplicant.dancing == .A{
                        passedApplicantsList.append(someApplicant)
                    }
                }
            }else if let someApplicant = someApplicant as? Person {
                failedApplicantsList.append(someApplicant)
            }
        }
    }
    
    private func printPassedApplicants(){
        print("---합격자 명단---")
        for someApplicant in passedApplicantsList {
            print("\(someApplicant.name)")
        }
        print("--------------")
        print("축하합니다!!")
    }
}

extension AuditionManager {
    func printTotalApplicants(){
        print("총 지원자 이름")
        for someApplicants in totalApplicantsList {
            print("\(someApplicants.name)")
        }
    }
}

let yagom: TalentedPerson = TalentedPerson(singing: .B, dancing: .A, acting: .C, name: "yagom", height: 100)
let noroo: Person = Person(name: "noroo", height: 1000)
let summer: TalentedPerson = TalentedPerson(singing: .B, dancing: .B, acting: .B, name: "summer", height: 900)
let coda: TalentedPerson = TalentedPerson(singing: .A, dancing: .C, acting: .C, name: "coda", height: 200)
let odong: TalentedPersonWithBadPersonality = TalentedPersonWithBadPersonality(singing: .A, dancing: .A, acting: .A, frequencyOfCursing: .A, name: "odong", height: 400)

var auditionManager: AuditionManager = AuditionManager()

//auditionManager.cast()

let mySon = Person(name: "nalgangdo", height: 10000)

struct Hacker {
    func hackPassedApplicantsList() {
//        auditionManager.passedApplicantsList.append(mySon)
    }
}

let hacker = Hacker()
hacker.hackPassedApplicantsList()
auditionManager.printTotalApplicants()//private(set)으로 접근은 가능하지만 읽기만 가능하고 설정은 불가능하다.
auditionManager.cast()
//auditionManager.printPassedApplicants() //private로 접근조차 할 수 없다.
