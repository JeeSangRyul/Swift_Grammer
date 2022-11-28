
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate : AdvancedLifeSupport?
    
    
    // MARK: Delegate
    //EmergencyCallHandler는 AdvancedLifeSupport를 가지고 있는 delegate에게 bleep을 주고 CPR을 하도록 시킬것이다
    //EmergencyCallHandler는 bleep을 울려 trigger시키고 bleep(delegate)를 가지고 있는 사람에게 CPR을 시킬 것이다.
    //bleep이 울린 delegate는 무조건 CPR을 실행한다.
    //delegate들은 AdvancedLifeSupport이라는 protocol을 가지고있기 때문에 CPR을 다 할 수 있다는 것을 보장받는다.
    //누가 delegate이고 누가 CPR을 할건지는 관심없다. 그냥 bleep을 가지고 있는 delegate에게 CPR을 시킬 뿐이다.
    
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        //bleep으로 연결된 아무 delegate에게 연락해서 CPR을 시키는 함수이다.
        delegate?.performCPR()
    }
}

struct Paramedic : AdvancedLifeSupport {
    
    init(handler : EmergencyCallHandler) {
        // 이 과정이 delegate로 지정받는 과정이다. 위에있는 handler안에 있는 delegate 변수에 자신을 집어넣어 EmergencyCallHandler의 delegate로 init을 하는 과정이다.
        //notification을 받아서 CPR을 진행한다.
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor :AdvancedLifeSupport {
    
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor { //super class 덕분에 init을 따로 해주지 않아도 EmergencyCallHandler의 delegate로 들어가게 된다.
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGEees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}


let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)
//let louis = Paramedic(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

