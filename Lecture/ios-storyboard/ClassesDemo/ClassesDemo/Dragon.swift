
class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech : String) {
        print("Says : \(speech)")
    }
    
    override func move() {
        print("Fly forwards")
    }
    
    override func attack() {
        super.attack() //원래 superclass의 attack을 실행한 다음 새로 customized된 attack()을 실행한다.
        print("Spits fire, does 10 damage")
    }
}
