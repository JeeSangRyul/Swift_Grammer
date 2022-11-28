//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium" : 4, "Hard" : 5]
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    //일반 지역변수는 선언해서 초기화는 가능하지만 progressView를 여기서
    //초기화해주는 것은 불가능하다.
    var timer = Timer()
    var totlaTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        //카운트다운이 되고있는 상황에 다른 버튼을 누르면 기존의 카운트다운을 멈춰주는 역할
        let hardness = sender.currentTitle!//절대 nil이 들어갈 일이 없다면 써도된다.
        totlaTime = eggTimes[hardness]!
        
        progressView.progress = 0.0
        secondsPassed = 0
        topLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        //1초마다 repeat을 허용하여 updateTimer를 반복해서 부르는 로직이다.
    }
    
    @objc func updateTimer() {
        if secondsPassed < totlaTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totlaTime)
            progressView.progress = percentageProgress
            
        } else {
            timer.invalidate()
            self.topLabel.text = "done"
            //            progressView.progress = 1.0
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
