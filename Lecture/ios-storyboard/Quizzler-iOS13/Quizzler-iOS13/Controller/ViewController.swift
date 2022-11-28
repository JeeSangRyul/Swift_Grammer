//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizbrain = QuizBrain()
    
    override func viewDidLoad() { //이 부분이 변하는 것은 시작할 때 로드되고 나서 한번만 실행되는 부분이다.
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        let userGotItRight = quizbrain.checkAnswer(userAnswer: userAnswer)
        //        let actualAnswer = quiz[questionNumber].answer // True, False
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizbrain.nextQuestion()

        //초록색 버튼이나 빨간색 버튼이 나온 후에 색깔이 다시 돌아가길 원하기 때문에 delay구문이 필요하다
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
//        updateUI()// <--이부분
    }
    
    @objc func updateUI() { //viewDidLoad가 한번만 실행되니까 매번 실행되기 위해서 함수로 만들어 버튼에도 넣어주었다.(이부분)
        questionLabel.text = quizbrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizbrain.getProgress() //1을 더해줘서 시작할 때 부터 조금 차있는 모습을 보여주기위해
        scoreLabel.text = "Score: \(quizbrain.getScore())"
    }
}
