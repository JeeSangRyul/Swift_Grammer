









import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(title : sender.currentTitle!)
        sender.alpha = 0.5
        
        print("Start")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){ //delay code
            print("End")
            sender.alpha = 1.0
        }
    }
    
    func playSound(title : String) {
        let url = Bundle.main.url(forResource: title, withExtension: "wav") //우리의 음원파일의 위치
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()//play
        
        //silent 부분은 삭제
    }
}

