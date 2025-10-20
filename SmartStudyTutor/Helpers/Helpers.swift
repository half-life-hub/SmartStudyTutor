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
    let response = try await model.generate("Summarize this text for a student:\n\n\(text)")
    return response.text
}
