import CoreGraphics
////
////  main.swift
////  Week3_ Test
////
////  Created by 지상률 on 2022/02/21.
////
//
import Foundation
//
/*
print("Hello, World!")

/* 인스턴스 생성과 소멸 */

// 이니셜라이저와 디이니셜라이저
// init, deinit
import Swift

//MARK: - 프로퍼티 기본값
// 스위프트의 모든 인스턴스는 초기화와 동시에
// 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다
// 프로퍼티에 미리 기본값을 할당해두면
// 인스턴스가 생성됨과 동시에 초기값을 지니게 됩니다
// 만약 초기에 값을 지정해두지 않고 초기화 시킨다면 오류가 뜬다
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

//MARK: - 이니셜라이저
// 프로퍼티 기본값을 지정하기 어려운 경우에는
// 이니셜라이저를 통해
// 인스턴스가 가져야 할 초기값을 전달할 수 있습니다
class PersonB {
    var name: String
    var age: Int
    var nickName: String

    // 이니셜라이저 - 매개변수를 받아서 초기화를 시켜준다.
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")

//let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "") // nickname이 없는 경우가 꼭 있다.

//MARK: 프로퍼티의 초기값이 꼭 필요 없을 때
// 옵셔널을 사용!
class PersonC {
    var name: String
    var age: Int
    var nickName: String? //꼭 필요한 것은 아니다 라는 뜻

    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    /*
     convenience init(name: String, age: Int, nickName: String){
        self.init(name:name, age: age)
        self.nickName = nickName
     }
     init(name: String, age: Int) {
         self.name = name
         self.age = age
     }
     위의 방법과 동일하다. 아래의 방법은 initialize가 많아질수록 중복되는게 많을 경우 아래의 이미 선언된
     init을 자신의 것으로 가져와서 쓸수있다. 그럴 경우 자신의 init에는 앞에 convenience를 붙여줘야한다.
     */
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은
// 인스턴스 사용에 꼭 필요하지만
// 초기값을 할당하지 않고자 할 때 사용
class Puppy {
    var name: String
    var owner: PersonC! //property가 꼭 필요할 때 !를 찍어준다

    init(name: String) {
        self.name = name //name을 미리 선언하고 꼭 필요할 경우에 해당 property에 !를 찍어준다.
    }

    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// 강아지는 주인없이 산책하면 안돼요!
//happy.goOut() // 주인이 없는 상태라 오류 발생 , 미리 name을 initialize로 받았지만 owner를 안받았기 때문에 error를 받는다.
happy.owner = jenny //happy 옆에 !를 붙이지 않는다.
happy.goOut()
// happy가 주인 jenny와 산책을 합니다 (nil일 경우 애완견은 주인없이 산책을 못나가기 때문에 error가 난다. 그래서 꼭 받아야하는 값이 있다면 암묵적 옵셔널 !를 붙여준다.)

//MARK: 실패가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우(정상범주를 넘어갈경우)
// 인스턴스 생성에 실패할 수 있습니다
// 인스턴스 생성에 실패하면 nil을 반환합니다
// 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입입니다
class PersonD {
    var name: String
    var age: Int
    var nickName: String?

    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }

        if name.count == 0 {
            return nil
        } // 이 조건일 경우 nil을 반환하여 멈추게 한다.

        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23) // 반환하는 것이 optional이라고 했는데 왜 타입에 optional을 안 붙이냐 해서 error를 반환해준다.
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) // nil
print(batman) // nil

//MARK: - 디이니셜라이저
// deinit은 클래스의 인스턴스가
// 메모리에서 해제되는 시점에 호출됩니다
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있습니다
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC

    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }

    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy //donald옆에 ?를 꼭 붙여줘야한다.
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다
// donald가 jenny에게 happy를 인도합니다


//예시
class Aircondition{
    var name: String
    var manufactur : String
    var user : String?

    init(name: String, manufactor:String) {
        self.name = name
        self.manufactur = manufactor
    }
}

var Samsung: Aircondition = Aircondition(name: "Samsung", manufactor: "LeeJaeYong")

//구조체와 클래스
class CameraA {
    var color = "Black"
}

struct CameraB {
    var color = "Black"
}

func printCameraColor() {
    let str = """
Camera A (my: \(myCameraA.color), yours: \(yourCameraA.color))
Camera B (my: \(myCameraB.color). yours: \(yourCameraB.color))
"""
    print(str)
}

var myCameraA = CameraA()
var yourCameraA = myCameraA

var myCameraB = CameraB()
var yourCameraB = myCameraB

printCameraColor()

print("----- myCamera 색을 변경합니다. -----")

myCameraA.color = "White"
myCameraB.color = "White"

printCameraColor()


//Property
//연산 프로퍼티
struct PersonC {
    var koreanAge: Int
    var americanAge: Int {
        get {//americanAge를 꺼내가기 위해서는 자기가 koreanAge를 통해서 계산한 다음 가져간다.
            return koreanAge - 1
        }
        set(newValue) { //KoreanAge라는 것에 자기가 연산을 해서 할당을 해준다.
            koreanAge = newValue + 1
        }
    }
}

//프로퍼티 감시자 : 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있다. 프로퍼티 감시자와 연산 프로퍼티 기능은 동시에
//사용 불가능하다.
struct Money{
    //프로퍼티 감시자 사용
    var currencyRate : Double = 1100{ //currencyRate가 변경되면 willSet과 didSet이 실행될것이다.
        willSet(newRate){
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.")//매개변수가 없다면
            //암시적으로 newValue oldValue
        }
        //oldRate -> currencyRate -> newRate
        didSet(oldRate){
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.")
        }
    }
}// currencyRate = 1200이라고 하면 먼저, 환율이 1100에서 1200으로 변경될 예정입니다. 그후 1100에서 1200으로 변경되었습니다
//가 뜨게된다.

*/
/*
//Week3_Step1
class Person {
    //name, age, money라는 저장 프로퍼티를 만들어주었다.
    var name: String
    var age: Int
    var money: Int
    
    // 이니셜라이저 - 매개변수를 받아서 초기화를 시켜준다.
    init?(name: String, age: Int , money: Int) {//잘못된 값 입력을 방지하기 위해서 조건을 만들어 주었다.
        if name.count == 0 {
            return nil
        }
        if (0...120).contains(age) == false {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
    }
    func buySomeThings(things: String){
        print("\(name)이 \(things)를 구매하셨습니다.")
    }
}

enum Coffee: Int { //열거형을 통해서 메뉴판을 제작, rawValue를 이용해서 가격표를 만들어주었다.
    case Americano = 4500
    case Latte = 5000
    case Espresso = 3500
    case Juice = 5500
    case Dessert = 6000
    case Goods = 3000
}

class CoffeShop{
    var revenue: Int
    var menu: Coffee! //coffeeshop에서는 메뉴를 꼭 시켜야하니까 지금 말고 나중에 메뉴를 받는 형식으로 만들어줬다. !
    var barista : Person! //이또한 제조하는 사람이 꼭 있어야하니까 지금 말고 나중에 받는 형식으로 만들어줬다. !
    var pickUpTable : Bool
    
    init(revenue: Int, pickUpTable : Bool){ //!을 제외한 나머지 프로퍼티 이니셜라이즈해주는 모습
        self.revenue = revenue //보통은 하루 수입은 0원부터 출발한다.
        self.pickUpTable = pickUpTable
    }
    
    func showCoffeePrint(_ price : Coffee){ //메뉴를 고르면 얼마인지 보여주는 함수
        print("\(price)의 가격은 \(price.rawValue)원 입니다.")
    }
    func totalRevenue(_ income : Coffee)-> Int{ //팔때마다 금액이 누적되는 함수
        let sellRevenue : Int = income.rawValue
        revenue += sellRevenue
        return revenue
    }
    func makeCoffee(_ menu : Coffee){ //자신의 메뉴가 제조중인지 알려주는 함수
        print("\(menu)를 만드는 중입니다.")
    }
}
//Person
let misterLee : Person? = Person(name: "misterLee", age: 28, money: 10000) //Person타입에 ?를 붙여서 misterLee라는 사람을 할당했다.
let missKim : Person? = Person(name: "missKim", age: 26, money: 10000)
missKim?.buySomeThings(things: "Americano") //메소드를 실행할때 또한 init?으로 nil이 나올수있기때문에 ?를 붙여준 모습이다.

//CoffeeShop
let yagombucks : CoffeShop = CoffeShop(revenue: 0, pickUpTable: true)//오늘 수입이 0원부터 시작하고, pickUpTable이 있는 yagombucks에 coffeshop타입을 할당해주었다.
yagombucks.showCoffeePrint(.Americano)//가격출력
yagombucks.makeCoffee(.Americano)//제조중 출력
print("\(yagombucks.totalRevenue(.Americano))원 입니다.")//오늘 첫 판매 가격 출력
print("\(yagombucks.totalRevenue(.Americano))원 입니다.")//두번째 누적 판매 가격 출력
yagombucks.barista = misterLee//바리스타 할당
*/

/*상속*/

//스위프트의 상속은 클래스, 프로토콜 등에서 가능하다
//열거형, 구조체는 상속이 불가능하다
//스위프트는 다중상속을 지원하지 않는다
/*
class Person {
    var name: String = ""
    
    func selfIntroduce(){
        print("저는 \(name)입니다")
    }
    
    //final 키워드를 사용하여 재정의를 방지할 수 있습니다.
    final func sayHello(){
        print("Hello")
    }
    
    //타입 메서드
    //재정의 불가 타입 메소드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    //재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
    
    //재정의 가능한 class 메서드라도
    //final 키워드를 사용하면 재정의 할 수 없다.
    // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 한다.
    final class func finalClassMethod(){
        print("type method - final class")
    }
}
class Student:Person{
    // var name: String = "" 저장 프로포티는 overriding이 불가하다.(재정의가 불가하다.)
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    //static을 사용한 타입 메서드는 재정의 할 수 없습니다.
    //override static func typeMethod() {}
    //final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없습니다.
    //override func sayHello(){}
    //override class func finalClassMethod(){}
}

let yagom : Person = Person()
let hana: Student = Student()

yagom.name = "yagom"
hana.name = "hana"
hana.major = "Swift"

yagom.selfIntroduce()
hana.selfIntroduce()
Person.classMethod()
Person.typeMethod()
Person.finalClassMethod()
Student.classMethod()
Student.typeMethod()//재정의 불가
Student.finalClassMethod()//재정의 불가
*/


/* 옵셔널 체이닝 */

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있습니다

//MARK: - 옵셔널 체이닝
//MARK: 예제 클래스 및 인스턴스 생성
/*
 
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")//다른 프로퍼티들은 nil상태이다. 꼭 필요했던 저장 프로퍼티만 가지고 있는 상태이다.
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")


// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
// 결과 타입도 옵셔널입니다
// 만약 우리집의 경비원의 직업이 궁금하다면..?
// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}
/*
 MARK: 해석
 
 owner에 optional Person?타입을 할당해주고 만약 값이 있다면 owner에 할당해주고 owner가 Apartment가 있다면 home에 할당해주고
 그 home에 guard가 잆다면 `guard`에 할당해주고 `guard`의 직업이 있다면 guardJob에 할당해주어 optional을 바인딩한다. -> 옵셔널 체이닝을 사용하지 않을때
 
 */


guardJob(owner: yagom)

//MARK: 옵셔널 체이닝 사용
// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}
/*
 MARK: 해석
 owner에 옵셔널인 Person타입을 지정해주고 사람이 있는지 물어본다-> 있다 -> 집이 있는지 물어본다. ->....-> 경비원이 있습니까?-> 직업이 무엇입니까?
 */

guardJobWithOptionalChaining(owner: yagom)
// 우리집 경비원은 직업이 없어요


//yagom?.home?.guard?.job // nil(yagom에 home이 할당되지 않았기 때문에)
yagom?.home = apart//apart할당

yagom?.home // Optional(Apartment) - apart instance
//yagom?.home?.guard // nil
yagom?.home?.guard = superman

yagom?.home?.guard // Optional(Person) - superman instance
yagom?.home?.guard?.name // Optional(String) - "superman"
yagom?.home?.guard?.job // nil
yagom?.home?.guard?.job = "경비원"
//중간에 하나라도 값이 비어있다면 nil을 반환한다.


//MARK: - nil 병합 연산자
var guardJob: String //빈 스티링 생성한 다음에
    
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"// yagom?.home?.guard?.job -> 경비원을 할당했다.
print(guardJob) // 경비원
yagom?.home?.guard?.job = nil

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨" //yagom?.home?.guard?.job이 nil을 할당했기 때문에 "슈퍼맨"이 할당된다.
print(guardJob) // 슈퍼맨
 */
//MARK: Try it yourself
//연료와 차량이 회전할 수 있는 방향을 한정지어봅시다.
/*
enum fuel{
    case 휘발유 , 경유
}

enum turn{
    case 왼쪽 , 오른쪽
}

struct Car {
    var fuel: fuel = .경유
    var capacity: Int = 5
    var gear: String = "전진"
    var turn: turn = .왼쪽
    
    // 구조체의 메소드에서 프로퍼티 값을 변경하려면 mutating을 앞에 붙여줘야합니다
    mutating func goForward() {
        gear = "전진"
        print("전진")
    }
    
    // 구조체의 메소드에서 프로퍼티 값을 변경하려면 mutating을 앞에 붙여줘야합니다
    mutating func reverse() {
        gear = "후진"
        print("후진")
    }
//
//    func fuelSelect(what : fuel){
//        print("이 차는 \(what)차 입니다.")
//    }
    func turnLeftOrRight( to: turn) {
        print("\(to)로 회전")
    }
}

var greenCar: Car = Car()
//greenCar.fuelSelect(what: fuel.경유)
greenCar.fuel = .휘발유
greenCar.goForward()

var yellowCar = Car.init()
yellowCar.turnLeftOrRight(to: turn.왼쪽)

//열거형 구조를 변수에 할당해주는 방식이 옵셔널도 가능하지만 위의 방식대로 .경유 이런식으로 할당해주어
//인스턴스를 만들어줄때 한정적인 데이터 안에서 수정가능하게 만들수도있다.(중요!!)
*/


//Week3_Step2



enum Coffee: Int {
    case Americano
    case Latte
    case Espresso
    case Juice
    case Dessert
    case Goods
    
    func printCoffeePrice()-> Int{
        switch self{
        case .Americano:
            return 4500
        case .Latte:
            return 5000
        case .Espresso:
            return 3500
        case .Dessert:
            return 6000
        case .Juice:
            return 5500
        case .Goods:
            return 3000
        }
        
    }
}


class CoffeeShop {
    var cafeName : String
    var revenue: Int
    var menu: Coffee!
    var barista : Person!
    var customer : Person!
    
    init(){
        self.revenue = 0
        self.cafeName = "yagombucks"
    }
    
    init(revenue: Int, cafeName: String){
        self.revenue = revenue
        self.cafeName = cafeName
    }
    
    func showCoffeePrint(_ price : Coffee){ //메뉴를 고르면 얼마인지 보여주는 함수
        print("\(price)의 가격은 \(price.printCoffeePrice())원 입니다.")
    }
    func totalRevenue(_ income : Coffee)-> Int{ //팔때마다 금액이 누적되는 함수
        let sellRevenue : Int = income.printCoffeePrice()
        revenue += sellRevenue
        return revenue
    }
    func order(_ menu : Coffee){ //자신의 메뉴 주문완료 표시
        print("\(cafeName)의 오늘 매출은 \(totalRevenue(menu))원 입니다.")//주문과 동시에 오늘 수입이 올라가는 로직이 짜보았다.
    }
    func pickUpTable(ready : Bool){
        if ready == true {
            print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요") //꼭 꼭 꼭 해당 프로퍼티의 타입에서 쓰인 프로퍼티를 잘 보자 .name하나 안써서 엄청 해맸다.
        }else{
            print("아직 준비중입니다.")
        }
    }
}


class Person: CoffeeShop {
    //name, age, money라는 저장 프로퍼티를 만들어주었다.
    var name: String
    var age: Int
    var money: Int
    
    // 이니셜라이저 - 매개변수를 받아서 초기화를 시켜준다.
    
    
    init?(name: String, age: Int , money: Int) {//잘못된 값 입력을 방지하기 위해서 조건을 만들어 주었다.
        if name.count == 0 {
            return nil
        }
        if (0...120).contains(age) == false {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
        super.init(revenue: 0, cafeName: "yagombucks") //Person의 프로퍼티가 먼저 초기화된 후에 coffeeshop의 프로퍼티가 초기화되어야한다.
    }
    
    override func order(_ menu: Coffee) {
        print("\(name)이 \(menu)를 선택하셨습니다.")
        let costMoney : Int = menu.printCoffeePrice()
        money -= costMoney
        if money >= 0 {
            print("결제되셨습니다. 남은 \(name)님의 잔액은 \(money)입니다.")
            super.order(menu)
        }else{
            print("\(name)님의 잔액이 \(-money)원만큼 부족합니다.")
        }
    }
}
//Person 인스턴스
let misterLee : Person? = Person(name: "misterLee", age: 28, money: 10000) //Person타입에 ?를 붙여서 misterLee라는 사람을 할당했다.
let missKim : Person? = Person(name: "missKim", age: 26, money: 10000)

//CoffeeShop 인스턴스 및 상속
let yagombucks : CoffeeShop = CoffeeShop()//오늘 수입이 0원부터 시작하고, pickUpTable이 있는 yagombucks에 coffeshop타입을 할당해주었다.

yagombucks.showCoffeePrint(.Americano)//가격출력
yagombucks.barista = misterLee//바리스타 할당
yagombucks.customer = missKim//손님 할당



missKim?.order(.Americano) //yagombucks의 매출이 올라간 모습까지 확인가능
missKim?.order(.Americano)
yagombucks.pickUpTable(ready: true )


