//
//  QuizGenerator.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import Foundation
import FoundationModels

final class QuizGenerator {
    private let model = try! SystemLanguageModel.named(.foundationModel)
    func generateQuiz(from text: String) async throws -> [QuizQuestion] {
        let prompt = """
        Generate 3 multiple-choice questions based on this text.
        Include an explanation for each correct answer.
        Text: \(text)
        """
        let result = try await model.generate(prompt, as: [QuizQuestion].self)
        return result
    }
}
