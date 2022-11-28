
protocol CanFly {
    func fly() //protocol can't have func bodies
}


class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale{
            print("The bird makes a new bird in a shell")
        }
    }
}


class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps its wings and lifts offf into the sky")
    }
        
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    
    func flyingDemo(flyingObject : CanFly) {
        flyingObject.fly()
    }
}

struct Airplane : CanFly { //protocol can be adopted by structures and classes
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplane()
let museum = FlyingMuseum()
//museum.flyingDemo(flyingObject: myEagle) //Eagle class가 bird class를 상속받기때문에 bird에 들어갈 수 있다.
//museum.flyingDemo(flyingObject: myPenguin) -> CanFly Protocol이 없기 때문에 불가능
museum.flyingDemo(flyingObject: myPlane) //CanFly Protocol이 있기 때문에 가능
museum.flyingDemo(flyingObject: myEagle) //CanFly Protocol이 없기 때문에 가능
