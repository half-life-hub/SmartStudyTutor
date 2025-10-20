//
//  QuizGenerator.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import Foundation
import FoundationModels

final class QuizGenerator {
    private let model = SystemLanguageModel.default
    
    
    func generateQuiz(from text: String) async throws -> [QuizQuestion] {
        let session = LanguageModelSession(model: model, instructions: "You are an educational assistant that creates multiple-choice quizzes for students based on provided text.")
        let prompt = """
        Generate 3 multiple-choice questions based on this text.
        Include an explanation for each correct answer.
        Text: \(text)
        """
        let result = try await session.respond(to: prompt, generating: [QuizQuestion].self, options: GenerationOptions(temperature: 0.5))
        return result.content
    }
}
