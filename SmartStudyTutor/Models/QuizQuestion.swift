//
//  QuizQuestion.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import Foundation
import FoundationModels

@Guide
struct QuizQuestion: Generable {
    var question: String
    var choices: [String]
    var correctAnswer: String
    var explanation: String
}
