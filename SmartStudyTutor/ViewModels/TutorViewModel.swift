//
//  TutorViewModel.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class TutorViewModel: ObservableObject {
    @Published var inputText = ""
    @Published var questions: [QuizQuestion] = []
    @Published var summary: String = ""
    @Published var isLoading = false
    private let generator = QuizGenerator()
    
    func generate() async {
        guard !inputText.isEmpty else { return }
        isLoading = true
        do {
            summary = try await summarize(inputText)
            questions = try await generator.generateQuiz(from: inputText)
        } catch {
            print("Error generating quiz: \(error)")
        }
        isLoading = false
    }
}
