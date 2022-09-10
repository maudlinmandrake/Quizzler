//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Jenny Mikac on 08/30/2022
//  for Angela Yu's iOS Dev course on Udemy
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // user answer = whatever button they push
        let userAnswer = sender.currentTitle!
        let userCorrect = quizBrain.checkAnswer(userAnswer)
        //compare user answer to correct answer within array
        if userCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        // fetch answers and update button title using setTitle method.
        let answerChoices = quizBrain.getAnswers()
        choiceA.setTitle(answerChoices[0], for: .normal)
        choiceB.setTitle(answerChoices[1], for: .normal)
        choiceC.setTitle(answerChoices[2], for: .normal)
        progressView.progress = quizBrain.getProgress()
        choiceA.backgroundColor = UIColor.clear
        choiceB.backgroundColor = UIColor.clear
        choiceC.backgroundColor = UIColor.clear
    }
    
}

