//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by 지상률 on 2022/09/17.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [ //dictionary로 받았던 것을 깔끔하고 보기좋게 구조체의 배열로 받아주는 모습이다.
        //multiple choice 수정해보기~
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    var questionNumber = 0
    var questionScore = 0
    
    func checkAnswer (userAnswer : String) -> Bool{
        if userAnswer == quiz[questionNumber].answer {
            questionScore += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func getScore() -> Int{
        return questionScore
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() { //자기가 가지고있는 property를 바꿔주기 때문에 mutating을 적어준다.
        if questionNumber < quiz.count - 1 {
            questionNumber = questionNumber + 1
        } else {
            questionNumber = 0
        }
    }
    
}
