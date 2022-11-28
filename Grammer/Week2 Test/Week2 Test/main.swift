//
//  main.swift
//  Week2 Test
//
//  Created by 지상률 on 2022/02/15.
//

import Foundation

print("Hello, World!")

//컬렉션 타입

/*
 Array-순서가 있는 리스트 컬렉션
 Dictionary-키와 값의 쌍으로 이루어진 컬렉션
 Set-순서가 없고, 멤버가 유일한 컬렉션(중복허용x)
 */

/*
 //Array
 //빈 Int Array생성
 var integers: Array<Int> = Array<Int>()
 integers.append(1)
 integers.append(100)
 //integers.append(100.1) // Int이기 때문에 에러
 
 integers.contains(100) //100이 있는가?
 integers.contains(99)
 
 integers.remove(at: 0)
 integers.removeLast()
 integers.removeAll()
 
 //Array<Double> 와 [Double]은 동일한 표현
 //빈 Double Array 생성
 var doubles: Array<Double> = [Double]()
 
 //빈 String Array 생성
 var strings: [String]=[String]()
 
 //빈 Character Array 생성
 var characters : [Character] = [] //추천
 
 //let을 사용하여 Arrary를 선언하면 불변한다.
 let immutableArray = [1,2,3] // remove, append등 사용불가
 
 //Dictionary
 var anyDictionary: Dictionary<String, Any> = [String: Any]() key: String, value: Any
 anyDictionary["someKey"]="value"
 anyDictionary["anotherKey"]=10000
 print(anyDictionary)  순서가 있지 않다.
 
 anyDictionary["someKey"]="dicTionary!"
 anyDictionary.removeValue(forKey: "anotherkey")
 anyDictionary["someKey"]=nil
 print(anyDictionary)
 
 let emptyDictionary: [String:String] = [:] //축약문법
 let initializedDictionary:[String:String] = ["name":"yagom","gender":"male"]
 
 //let someValue: String = initializedDictionary["name"] //String이지만 할당하지 못하는 이유는 불확실성때문이다. "name"에 해당하는 값이 있을 수도 있고 없을 수도 있어서 에러를 반환한다.
 
 //MARK: Set
 var integerSet: Set<Int> = Set<Int>() //축약문법 없음, 축약시킬경우 array로 인지하기 때문에 주의해서 사용하자;
 integerSet.insert(1)
 integerSet.insert(1)
 integerSet.insert(1) // 1만 저장됨, 중복값은 저장 안됨
 let setA: Set<Int> = [1,2,3,4,5]
 let setB: Set<Int> = [3,4,5,6,7]
 
 var lottoNumber: Set<Int> = [5,4,5,3,2,1,10]
 let setC: Set<Int> = lottoNumber
 print(setC)
 
 
 
 let union: Set<Int> = setA.union(setB) //union, array x, {}으로 표현됨
 
 let sortedUnion: [Int] = union.sorted() //[]으로 표현됨-> array
 
 let intersection: Set<Int> = setA.intersection(setB) //교집합
 
 let subtracting : Set<Int> = setA.subtracting(setB)//차집합
 
 
 //반복문
 var integers2 = [1, 2, 3]
 let people = ["yagom": 10, "eric": 15, "mike": 12]
 
 for integer in integers2 {
 print(integer)
 } //반복적으로 실행한다.
 
 // Dictionary의 item은 key와 value로 구성된 튜플 타입입니다.tuple은 compound type으로, named type뿐만아니라, compound type도 담을 수 있습니다.
 //즉, tuple은 Int, String, Bool과 같은 named type을 담을 수 있지만,
 //compound type인 tuple type이나, function type을 담을 수 있답니다.
 //튜플은 루프를 돌릴수없기때문에 배열에 넣어서 loop를 돌려준다.
 
 for (name, age) in people {
 print("\(name): \(age)")
 }
 //-> 튜플 형태로 들어간다.
 //while 조건 {
 //    /* 실행 구문 */
 //}
 
 while integers.count > 1 { //조건부분은 bool값이 무조건 들어와야한다.
 integers.removeLast()
 }
 
 //repeat {
 //    /* 실행 구문 */
 //} while 조건
 
 
 //repeat {
 //    integers.removeLast()
 //} while integers.count > 0
 
 //repeat while구문의 경우 while구문과 다르게 일단 code를 실행하고나서 조건을 따진다. 그래서 코드 최초 1회는 무조건 실행되는 것이 특징이고, while은 처음부터 조건을 따지고 맞을 경우 loop를 허락합니다.
 
 
 //MARK: 함수고급
 //매개변수 기본값
 //기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋습니다.
 
 //func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값 ...) -> 반환타입 {
 //    /* 함수 구현부 */
 //    return 반환값
 //}
 
 func greeting(friend: String, me: String = "yagom") {
 print("Hello \(friend)! I'm \(me)")
 } // 매개변수 기본값이 없는 friend와 매개변수 기본값을 가지는 me
 
 
 // 매개변수 기본값을 가지는 매개변수는 호출시 생략할 수 있습니다
 greeting(friend: "hana") // Hello hana! I'm yagom
 greeting(friend: "john", me: "eric") // Hello john! I'm eric
 //따로 me에 값을 할당가능하다.
 
 //전달인자 레이블
 //전달인자 레이블은 함수를 호출할 때 매개변수의 역할을 좀 더 명확하게 하거나 함수 사용자의 입장에서 표현하고자 할 때 사용합니다.
 
 //func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
 //    /* 함수 구현부 */
 //    return
 //}
 
 //전달인자 레이블을 할경우 중복함수 가능하다.
 
 // 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용합니다
 func greeting(to friend: String, from me: String) {
 print("Hello \(friend)! I'm \(me)")
 }
 
 // 함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다
 greeting(to: "hana", from: "yagom") // Hello hana! I'm yagom
 //함수 외부에서는 to를 전달인자로 사용하고 내부에서는 friend를 전달인자로 사용한다.
 
 
 //가변매개변수
 
 //전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다.
 //가변 매개변수는 함수당 하나만 가질 수 있습니다.(swift 5.4이상부터는 여러개를 가질 수 있다.)
 //맨뒤에 위치하는게 좋다
 
 //func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
 //    /* 함수 구현부 */
 //    return
 //}
 
 func sayHelloToFriends(me: String, friends: String...) -> String {
 return "Hello \(friends)! I'm \(me)!"
 }
 print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))
 // Hello ["hana", "eric", "wing"]! I'm yagom!
 
 print(sayHelloToFriends(me: "yagom"))
 // Hello []! I'm yagom!
 
 /*
  위에 설명한 함수의 다양한 모양은 모두 섞어서 사용 가능하다.
  */
 
 //데이터 타입으로서의 함수
 
 //swift는 함수형 프로그래밍 페러다임이라서 함수를 변수, 상수 등에 저장이 가능하고 매개변수를 통해 전달할 수도 있다.
 
 //함수의 타입표현
 //반환타입을 생략할 수 없다.
 //(매개변수1타입, 매개변수2타입 ...) -> 반환타입
 
 var someFunction: (String, String) -> Void = greeting(to:from:)
 //(String, String) -> Void 함수가 들어올것이라는 뜻
 //두개의 String타입인 매개변수가 들어오고 반환값이 없는 함수가 들어온다는 뜻이다.
 //그리고나서 아까전에 만들었던 greeting이라는 함수를 할당해주었다.
 
 
 someFunction("eric", "yagom") // Hello eric! I'm yagom
 
 someFunction = greeting(friend:me:)
 someFunction("eric", "yagom") // Hello eric! I'm yagom
 
 
 // 타입이 다른 함수는 할당할 수 없습니다 - 컴파일 오류 발생
 //someFunction = sayHelloToFriends(me: friends:) //friends라는 매개변수가 가변매개변수이기 때문에 error를 반환
 
 
 func runAnother(function: (String, String) -> Void) {
 function("jenny", "mike")
 }
 //(String, String) -> Void이런 함수가 -> function이라는 매개변수의 탑이다.
 
 // Hello jenny! I'm mike
 runAnother(function: greeting(friend:me:))
 
 // Hello jenny! I'm mike
 runAnother(function: someFunction)
 
 // 참고 : 스위프트의 전반적인 문법에서 띄어쓰기는 신경써야할 때가 많습니다
 func makeIncrementer() -> ((Int) -> Int) {
 func addOne(number: Int) -> Int {
 return 1 + number
 }
 return addOne
 }
 var increment = makeIncrementer()
 print(increment(7)) //8
 
 func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
 for item in list {
 if condition(item) {
 return true
 }
 }
 return false
 }
 
 func lessThanTen(number: Int)->Bool{
 return number < 10
 }
 var numbers = [20,19,7,12]
 
 print(hasAnyMatches(list : numbers, condition : lessThanTen))
 
 
 
 
 //MARK: - 1. func 을 변수에 넣을 수 있다.
 
 //  () -> String
 func function1() -> String {
 return "정답은?!"
 }
 
 //  () -> String
 let function2:() -> String = function1
 
 print(function2)
 //
 func result() -> () -> String{
 return function2
 }
 //
 func function4(value: Int) -> Int {
 return value
 }
 //
 //func result() -> (Int) -> Int{
 //    return function4
 //}
 
 
 func result() -> (Int) -> Int {
 func function(value: Int) -> Int {
 return value + 1
 }
 return function
 }
 
 //
 //let function = result()
 
 //
 //print(function(1))
 //
 //func makeIncrementer() -> ((Int) -> Int) {
 //    func addOne(number: Int) -> Int {
 //        return 1 + number
 //    }
 //    return addOne
 //}
 //var increment = makeIncrementer()
 //print(increment(7))
 
 //MARK: 1. func 을 변수에 넣을 수 있다.
 //MARK: 2. func 아무것도 받지않고, Int를 리턴하는 함수를 나타내는 타입은? : () -> Int
 //MARK: 3. () -> Int == (() -> Int) // String == (String) 가독성
 
 //MARK: 1. func 을 변수에 넣을 수 있다.
 //MARK: 2. func Int 변수를 받아서, 그 받은 Int 변수를 리턴하는 함수를 나타내는 타입은? : (Int) -> Int
 //MARK: 3. () -> Int == (() -> Int) // String == (String)
 //
 //addVAT(source: Double) → Double {
 //return source * 1.1
 //}
 //
 //func finalPrice(source: Double, additional: (Double)→ Double)→ Double{
 //let price = additional(source)
 //return price
 //}
 //
 //let transaction1 = finalPrice(source: 38.5, additional : addVAT)
 //
 //
 // →(Korean)
 // 1. finalPrice함수는 double을 받는 source매개변수와 double을 받아서 double을 반환하는 함수를 가지는 additional매개변수가 있다.
 // 2.이 finalPrice함수는 double을 반환하는 return값을 가진다.(price는 double이다.)
 // 3. transaction1이라는 상수에 할당된 finalPrice함수는 source에 38.5, additional에 addVAT라는 double을 받아 doubled을 반환하는 함수를 갖는다.
 // 4.finalPrice함수로 들어가서 additional(38.5)실행하면 price값이 나온다.
 // 5. 이를 반환한다.
 //
 // Another Example)
 //
 // 1. func makeIncrementer() - ((Int) - Int) {
 //
 // 2.     func addOne(number: Int) - Int {
 //
 // 3.         return 1 + number
 //
 // 4.     }
 //
 // 5.     return addOne
 //
 // 6. }
 //
 // 7. var increment = makeIncrementer()
 //
 // 8. increment(7)
 //
 //
 //Currying
 //
 // func makeADDer(x:Int) → (Int)→Int{
 //func adder(a:Int)→Int{
 //return x + a
 //}
 //return adder
 //}
 //
 //let add5 = makeAdder(x:5)
 //let add10 = makeAdder(x:10)
 //
 //print(add5(2))
 //print(add10(2))
 //
 //→(Korean)
 //
 //1. makeADDer를 실행하는데 이 함수는 x라는 정수를 받아 (Int)→ Int라는 함수를 반환한다.
 //2.반환값을 보니 adder가 (Int)→ Int 함수인가보다
 //3. makeADDer함수 내에 adder함수를 보니 a라는 인자를 받아서 x+a를 반환하는 함수이다.
 //4. add5라는 상수에 makeADDer(x:5)를 할당해준다.
 //5.그리고 나서 add5라는 상수에 2를 주면 add5(2) x값 5, a값 2가 된다.
 //6. 이를 더해서 반환하게 된다.
 //MARK: Closure
 MARK: Closure: Blocks of code that can be called later
 func sumFunction(a: Int, b: Int) -> Int {
 return a + b
 }
 
 var sumResult: Int = sumFunction(a: 1, b: 2)
 
 print(sumResult)
 
 //위의 식과 같은 식이다.
 //1. func이름과 func을 지운다.
 //2. 지워진 func을 {}로 감싸준다.
 //3. return 부분과 argument부분을 "in"으로 구별한다.
 //4. 그리고 변수에 할당한다음 호출가능하다.
 var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
 return a + b
 }
 
 sumResult = sum(1, 2)
 print(sumResult)
 
 
 //논리연산자 (주의: 비교해야 할 항목이 늘어서 1 < x < 10 이런식으로는 표현하지 못한다.)
 // &&: 둘 중 하나라도 거짓이면 거짓 , ||: 둘 중 하나라도 참이라면 참
 
 //true && false == false
 //true && true == true
 //true || false == true
 //true || true == true
 
 let isGoodDay = true
 let imGoodMood = true
 
 print(isGoodDay == true && imGoodMood == true) // true
 // 날도 좋고 기분도 좋고
 
 print(isGoodDay && imGoodMood) // true
 // 위와 같은 표현입니다
 
 print(isGoodDay == true || imGoodMood == true) // true
 // 날이 좋거나 기분이 좋거나
 
 print(isGoodDay || imGoodMood ) // true
 // 위와 같은 표현입니다
 
 //& 와 | 는 비트연산자이다.
 //  1&2 -> 0001 & 0010 = 0000이 된다. 반대로 1|2 -> 0001 | 0010 = 0011이 된다
 
 
 //열거형(Enumeration): 연관된 항목을 열거해 놓았다고 해서 열거형이라고 한다.
 //enum Dish {
 //    case rice, noodle, soup
 //} //함수처럼 사용자의 필요에 의해 만들어지는 타입일 수도 있다.
 //// 1. 제한된 선택지를 주고싶거나, 2. 정해진 값 외에는 입력받고 싶지 않을 때
 ////위에서는 열거한 rice, noodle, soup 중에서 골라야 하는 상황이다. Dish에 정의한 선택지 외에는 dish 매개변수의 인자로 전달 불가능
 ////애초에 잘못된 입력값을 배제할 수 있다.
 //
 //
 //func choose(dish: Dish) {
 //    print("\(dish)을 골랐군요!")
 //}
 //매개변수 dish는 Dish중에서 고를 수 있다.
 
 choose(dish: Dish.rice) // Dish.rice을 골랐군요!
 //잘못된 입력값이 들어올수 없으니 Dish를 지워줘도 된다. 이것을 타입추론이라고 하지만 지양해야한다.
 choose(dish: .rice) // 위와 같은 표현입니다
 
 enum Dish: String {
 case rice = "밥", noodle = "면", soup = "수프"
 }
 //열거형의 rawValue의 타입을 지정해주기 위해서는 Dish 뒤에 :를 추가해주면 된다.
 func choose(dish: Dish) {
 print("\(dish.rawValue)을 골랐군요!")
 }
 // case별로 고유한 값을 지정해 주고 싶다면 rawValue를 지정하면 된다.
 choose(dish: Dish.rice) // 밥을 골랐군요!
 
 
 
 /*
  MARK: 성별을 표현하는 열거형을 정의해보세요
  MARK: 방위를 표현하는 열거형을 정의해보세요
  MARK: 무선 통신방식(3G,4G,5G,LTE 등)
  MARK: 맥북 시리즈를 표현하는 열거형
  */
 
 enum Gender{
 case Men , Women
 }
 func genderChoose(gender: Gender){
 print("당신의 성별은 \(gender)입니다.")
 }
 genderChoose(gender: Gender.Men)
 
 enum Direction: String{
 case east = "동", west = "서" , north = "북" , south = "남"
 }
 func directionChoose(direction: Direction){
 print("당신이 선택한 방위는 \(direction)입니다.")
 }
 directionChoose(direction: Direction.east)
 
 
 //조건문
 let someInteger = 100
 
 if someInteger < 100 {
 print("100 미만")
 } else if someInteger > 100 {
 print("100 초과")
 } else {
 print("100")
 } // 100
 
 // 스위프트의 조건에는 항상 Bool 타입이 들어와야한다.
 
 
 //switch
 //매우 한정적인 값(enum의 case)이 아닌 경우 default 구문을 반드시 작성해야한다.
 //,를 이용하여 하나의 case에 여러 패턴을 명시할 수 있다.
 //자동으로 break되지만, fallthrough를 하면 break를 무시할수 있다.
 
 // 범위 연산자를 활용하면 더욱 쉽고 유용합니다
 switch someInteger {
 case 0:
 print("zero")
 case 1..<100: // 1을 포함해서 99까지
 print("1~99")
 case 100:
 print("100")
 case 101...Int.max://양쪽값을 포함한다.
 print("over 100")
 default:
 print("unknown")
 } // 100
 
 // 정수 외의 대부분의 기본 타입을 사용할 수 있습니다
 switch "yagom" {
 case "jake":
 print("jake")
 case "mina":
 print("mina")
 case "yagom":
 print("yagom!!")
 default:
 print("unknown")
 } // yagom!!
 
 
 /* 옵셔널 */ //매우 중요
 /*
  뜻: 값이 있을 수도 있고, 없을 수도 있다. 라는 뜻
  optional이 왜 중요한가?
  nil의 가능성을 명시적으로 표현 가능하기 때문이다.
  nil의 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능하기 때문이다.
  전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용 가능하기 때문이다.- 안전한 코딩 가능하다.
  
  주의사항: optional할 때는 ?를 꼭 타입옆에 붙여서 써야한다.
  
  ! -> 암시적 추출 옵셔널
  ? -> 일반적인 옵셔널 : 옵셔널과 일반 값은 다른 타입으로 간주하기 때문에 연산이 불가하다.
  */
 
 
 import Swift
 
 //MARK: 암시적 추출 옵셔널
 // Implicitly Unwrapped Optional
 var implicitlyUnwrappedOptionalValue: Int! = 100
 
 switch implicitlyUnwrappedOptionalValue {
 case .none:
 print("This Optional variable is nil")
 case .some(let value):
 print("Value is \(value)")
 }
 
 // 기존 변수처럼 사용 가능
 implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1
 
 // nil 할당 가능
 implicitlyUnwrappedOptionalValue = nil
 
 // 잘못된 접근으로 인한 런타임 오류 발생
 //implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1
 
 /* 다른 예시(암묵적 추출 옵셔널)
  let x : Int? = 1(그냥 optional)
  let y : Int = x!(x에 !로 optional을 박살냈다.)
  let z = x(그냥 optional)
  print(x,y,z)//Optional(1) 1 Optional(1)
  print(type(of:x),type(of:y),type(of:z))//Optional<Int> Int Optional<Int> -> 타입 추출 가능
  
  
  let a : Int! = 1(암묵적 optional)
  let b : Int a // Optional로 사용되지 않으면 자동으로 unwrapped , 이 부분이 그냥 optional과 차이점... 위에서는 !로 optional을 부쉈지만, 여기서는 그냥 유하게 넘어갔다.
  let c : Int = a!//물론 !로 박살내줄수있다.
  let d = a // Optional로 사용될 수 있으므로 Optional형
  let e = a + 1//b와 같은 경우로 유하게 받아들여줘서 자동으로 unwrapped해준뒤 계산해주었다.
  print(a,b,c,d,e) // Optional(1) 1 1 Optional(1) 2
  print(type(of:a),type(of:b),type(of:c),type(of:d),type(of:e))
  //Optional<Int> Int Int Optional<Int> Int
  
  */
 
 
 //MARK: 옵셔널
 // Optional
 var optionalValue: Int? = 100
 
 switch optionalValue {
 case .none:
 print("This Optional variable is nil")
 case .some(let value):
 print("Value is \(value)")
 }
 
 // nil 할당 가능
 optionalValue = nil
 
 // 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
 //optionalValue = optionalValue + 1
 
 
 /* 옵셔널 추출 */ //매우 중요
 /*
  옵셔널 바인딩
  -> 옵셔널 값을 꺼내오는 방법이다 nil체크 + 안전한 값 추출
  옵셔널을 쉽게 이해하기 위해서 42(Int)가 저장되어 있는 주소공간이 있다고 가정하면, 옵셔널(! + ?)은 그 주소공간 안에 42이라는 숫자를 한번더 상자로 감싸는 과정이다.
  여기서 옵셔널 바인딩은 상자를 두드리고 값이 있다고 하면 값을 가져오고, 없다면 가져오지 않는 과정을 optional binding이라고 한다.
  
  더 자세한 설명,
  if let constantname = optionalName{
  }
  -> 옵셔널 변수가 값이 있다면 언래핑(옵셔널은 부숴서) 일반 상수(일반 값으로 바뀐다.)constantname에 대입하고 if문을 실행한다.
  만약 값이 nil이라면 조건이 거짓이 되어 if문을 실행하지 않는다.
  
  if var variablename = optionalName{
  }
  -> 옵셔널 변수가 값이 있다면 언래핑(옵셔널은 부숴서) 일반 변수(일반 값으로 바뀐다.) variablename에 대입하고 if문을 실행한다.
  만약 값이 nil이라면 조건이 거짓이 되어 if문을 실행하지 않는다.
  
  
  예제 (매우 중요한 예제)
  var x : Int?
  x = 10 //그냥 10(x), optional 10
  if let xx = x{ //xx는 일반 상수로 바뀜(일반 10)
  print(xx)
  }else{
  print("nil")
  }
  
  var x1 : Int? //x1값은 nil(어떠한 값도 적어놓지 않았기 때문에)
  if let xx = x1{
  print(xx)
  }else{
  print("nil")
  }
  
  */
 
 // 강제 추출
 
 
 import Swift
 
 //MARK:- Optional Binding
 func printName(_ name: String) {
 print(name)
 }
 
 var myName: String? = nil
 
 //printName(myName)
 // 옵셔널 타입은 일반 타입과 다르기 때문에 컴파일 오류발생
 
 // if - let 방식
 if let name: String = myName {
 printName(name)
 } else {
 print("myName == nil")
 }
 
 
 var yourName: String! = nil
 
 if let name: String = yourName {
 printName(name)
 } else {
 print("yourName == nil")
 }
 
 // name 상수는 if-let 구문 내에서만 사용가능합니다
 // 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
 //printName(name)
 // ,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있습니다
 // 모든 옵셔널에 값이 있을 때만 동작합니다
 myName = "yagom"
 yourName = nil
 
 if let name = myName, let friend = yourName {
 print("\(name) and \(friend)")
 }
 // yourName이 nil이기 때문에 실행되지 않습니다, 둘다 만족을 해야 조건문이 돌아간다.
 yourName = "hana"
 
 if let name = myName, let friend = yourName {
 print("\(name) and \(friend)")
 }
 // yagom and hana
 
 //MARK:- Force Unwrapping : 옵셔널의 상자를 강제로 부순다음 꺼내온다.(비추천)
 printName(myName!) // yagom
 myName = nil
 
 //print(myName!)
 // 강제추출시 값이 없으므로 런타임 오류 발생
 yourName = nil
 
 //printName(yourName) !를 붙여주지 않았지만 var yourName: String! = nil이기 때문에 알아서 !를 붙여준다.
 // nil 값이 전달되기 때문에 런타임 오류발생
 
 
 //초보자라면 !(암묵적 추출 옵셔널 또는 강제추출)은 쓸일이 없다.
 /*
  아래 코드가 문제없이 실행될 수 있도록 코드의 단 한 곳만 수정해야 한다면 코드의 어떤 부분을 수정하는 것이 좋을까요?
  */
 var fixedNumbers: [Int?] = [0, 1, nil, 2, 5]
 fixedNumbers.append(nil)
 print(fixedNumbers)
 
 
 /*
  아래 코드에서 3을 꺼내 그 값을 출력하는 가장 안전한 코드를 작성해보세요.(flatMap, compactMap)
  */
 
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
 for i in someArray{
 if let constantArray = i{
 for a in constantArray{
 if let constantArray2 = a{
 for b in constantArray2{
 if let constantArray3 = b{
 print(constantArray3)
 let noNillConstantArray3 = constantArray3.compactMap{$0}
 
 }else{
 print("nil이라고")
 }
 }
 }else{
 print("nil이라구요")
 }
 }
 }else{
 print("nil이에요")
 }
 }
 /*
  코드를 실행하는 실제 날짜에 따라서 딕셔너리에 들어가는 키와 값이 쌍이 달라집니다. 컴파일러는 “날씨” 키에 해당하는 값이 항상 있을수 없다고 생각할 수 밖에 없습니다.
  더불어 딕셔너리는 언제든 키와 값을 수정할 수 있기 때문에 컴파일하는 시점에는 딕셔너리 내부의 키와 값의 쌍이 어떻게 변화할지 모릅니다.
  그래서 딕셔너리에서 값을 꺼내올 때는 항상 값이 없을수 있음에 대비해야합니다.
  */
 
 ////
 //var someDictionary: [String: String] = [:]
 ////let day: Int = day(of: today)
 //
 //if day == 1 || day == 30 {
 //    someDictionary["날씨"] = "맑음"
 //} else {
 //    someDictionary["풍향"] = "남동풍"
 //}
 
 
 /*
  안전하게 dictionary값을 출력하는 방법
  예시)))
  let httpResponseCodes = [200,403,301]
  let responseMessages: [Int: String] = [200: "OK", 403: "Access Forbidden"]
  
  for code in httpResponseCodes{
  if let message = responseMessages[code]{
  print("Response\(code):\(message)")
  }else{
  print("Unknown response \(code)")
  }
  }
  */
 
 // 이 시점에 "날씨" 키에 해당하는 값이 항상 존재한다고 장담할 수 있을까요?
 
 */

//func makeLottoNumbers()-> Set<Int>{
//    var emptyLotto : Set<Int> = Set<Int>()
//    while emptyLotto.count < 6{
//        let number = Int.random(in: 1...45)
//        emptyLotto.insert(number)
//    }
//    return emptyLotto
//}
//
//func makeLottoNumbers()-> Set<Int>{
//    var emptyLotto: Set<Int> = Set<Int>()
//    while emptyLotto.count < 6{
//        let number = Int.random(in: 1...45)
//        emptyLotto.insert(number)
//    }
//    return emptyLotto
//}
//
//func makeTotalWeek(totalWeek : Int)-> [String]{
//    var emptyArray : [String] = []
//    for week in 1...totalWeek{
//        emptyArray.append("\(week)회차")
//    }
//    return emptyArray
//}
//
//func makeLottoDictionary(totalWeek : Int)-> [String : Set<Int>]{
//    var emptyDictionary : [String : Set<Int>] = [:]
//    let fullArray : [String] = makeTotalWeek(totalWeek: totalWeek)
//    for totalWeek in fullArray{
//        emptyDictionary[totalWeek] = makeLottoNumbers() //Array값이 하나씩 들어가면서 makeLottoNumbers 함수를 실행하여 나온 return값을 dictionary에 저장한다.
//    }
//    return emptyDictionary
//}
//
//func callLottoInformation(callWeek : String, totalWeek : Int){
//    let fullDictionary : [String : Set<Int>] = makeLottoDictionary(totalWeek: totalWeek)
//    guard let fullDictionary = fullDictionary[callWeek] else{
//        return
//    }
//    print("\(callWeek)의 로또 당첨 번호는 \(fullDictionary)")
//}
//
//func saveAndCallLottoInformation(totalWeek : Int, callWeek : String){
//    callLottoInformation(callWeek: callWeek, totalWeek: totalWeek)
//}
//
//saveAndCallLottoInformation(totalWeek: 5, callWeek: "5회차")
//

//step2
//checkLotto()


var fixedNumbers: [Int?] = [0, 1, nil, 2, 5]
fixedNumbers.append(nil)
print(fixedNumbers)


let someArray: [[[Int?]?]?] = [[[1, 2], nil, [3, nil, 4], nil, [5, 6]]]
for i in someArray{
    if let constantArray = i{
        let a = constantArray.flatMap{$0}
        let b = a.flatMap{$0}
        let c = b.compactMap{$0}
        print(c.index(after: 2))
    }else{
        print("nil")
    }
}

var array2 = someArray.flatMap{$0}.flatMap{$0}.compactMap{$0}.flatMap{$0}
if let x = array2[2]{
    print(x)
}else{
    print("nil")
}



//1차원배열에서 nil을 제거하고 옵셔널 바인딩을 하고싶다면 compactMap사용
//2차원 배열을 1차원 배열로 flatten하게 만들때 flatmap을 사용

//
//for i in someArray{
//    if let constantArray = i{
//        for a in constantArray{
//            if let constantArray2 = a{
//                for b in constantArray2{
//                    if let constantArray3 = b{
//                        print(constantArray3)
//                        let noNillConstantArray3 = constantArray3.compactMap{$0}
//
//                    }else{
//                        print("nil이라고")
//                    }
//                }
//            }else{
//                print("nil이라구요")
//            }
//        }
//    }else{
//        print("nil이에요")
//    }
//}

//makeLottoHistory(x: 5)
printDictionary(num: 2, someDictionary: makeLottoHistory(x: 5))
