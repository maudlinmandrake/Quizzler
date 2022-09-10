//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Jenny Mikac on 9/1/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    // The question text
    let text: String
    // The answer choices
    let answers: [String]
    // The correct answer
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
