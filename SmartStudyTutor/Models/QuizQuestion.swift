//
//  QuizQuestion.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import Foundation
import FoundationModels

@Generable
struct QuizQuestion {
    var question: String
    var choices: [String]
    var correctAnswer: String
    var explanation: String
    
    static var example: QuizQuestion {
        QuizQuestion(
            question: "What is the capital of France?",
            choices: ["Berlin", "Madrid", "Paris", "Rome"],
            correctAnswer: "Paris",
            explanation: "Paris is the capital and largest city of France."
        )
    }
}
