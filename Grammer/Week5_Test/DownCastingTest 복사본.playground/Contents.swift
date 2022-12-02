import UIKit

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


var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

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


var mike: Person = UniversityStudent() as Person //업 캐스팅으로 Person()을 나타내지만, 실질적으로 UniversityStudent이다.
mike.breath()
// mike의 타입은 UniversityStudent타입이다. 하지만 부모 타입인 Person의 메소드인 breath에
//접근이 가능해진다.
//var jenny : Student = Person() // error
//자식 타입을 채택했지만 부모 타입으로 선언하는 것은 error이다.
var jenny: Person = Student() as Person
jenny.breath()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var jina: Any = Person() // as Any 생략가능
//업캐스팅은 V모양이 되어야한다.(?)-> 좀 더 연구가 필요해보인다.



// as? - optional로 반환
//원래 형식으로 downcasting
var optionalCasted: Person?
print(type(of: mike))
optionalCasted = mike as? UniversityStudent //업캐스팅 된 mike를 다운캐스팅한다.
//원래 형식으로 downcasting하는 것은 항상 성공한다.
print(type(of: optionalCasted))
print(type(of: mike))
//원본 클래스보다 아래쪽에 있는 서브클래스로 다운캐스팅 하는 것은 허용되지 않는다.
optionalCasted = jenny as? Student // 업캐스팅 된 jenny를 다운캐스팅한다.
optionalCasted = jina as? Student // nil


//downcating
//upcasting하지 않은 타입들도 class가 상속관계라면 downcasting하여 쓸 수 있다.
let ji : Person = Person()
let won : Person = Person()

//업캐스팅하지 않는 ji를 그냥 downcasting하려니까 nil이 나오는 것을 알 수 있다.
optionalCasted = ji as? Student
print(type(of: optionalCasted))

//업캐스팅하지 않는 ji를 그냥 downcasting하기 위해서는 if - let을 써주면 ji에서 접근이 가능하다.
if let ji = ji as? Student {
    ji.goToSchool()
}

if let won = won as? UniversityStudent{
    won.goToMT()
}

print(type(of: ji))
