//
//  InputView.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import SwiftUI

struct InputView: View {
    @StateObject private var viewModel = TutorViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $viewModel.inputText)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding()
                if viewModel.isLoading {
                    ProgressView("Generating Quiz...")
                } else {
                    Button("Generate Quiz") {
                        Task { await viewModel.generate() }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                if !viewModel.summary.isEmpty {
                    Text("Summary: \n\n\(viewModel.summary)")
                        .font(.subheadline)
                        .padding()
                }
                if !viewModel.questions.isEmpty {
                    NavigationLink("Start Quiz") {
                        QuizView(questions: viewModel.questions)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .navigationTitle("Smart Study Tutor")
        }
    }
}


#Preview {
    InputView()
}
