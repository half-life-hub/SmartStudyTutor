//
//  Helpers.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import Foundation
import FoundationModels

func summarize(_ text: String) async throws -> String {
    let model = SystemLanguageModel.default
    let session = LanguageModelSession(model: model, instructions: """
You are an educational assistant that summarizes text for students.
Do it in one sentence.
""")
    let response = try await session.respond(to: "Summarize this text for a student:\n\n\(text)")
    return response.content
}
