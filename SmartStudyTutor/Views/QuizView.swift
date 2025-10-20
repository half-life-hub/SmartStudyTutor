//
//  QuizView.swift
//  SmartStudyTutor
//
//  Created by Steven Marshall on 20/10/2025.
//

import SwiftUI

struct QuizView: View {
    @State var questions: [QuizQuestion]
    @State private var current = 0
    @State private var selectedAnswer: String? = nil
    @State private var score = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Question \(current + 1) of \(questions.count)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(questions[current].question)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            ForEach(questions[current].choices, id: \.self) { choice in
                Button(choice) {
                    selectedAnswer = choice
                    if choice == questions[current].correctAnswer {
                        score += 1
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(choice == selectedAnswer
                      ? (choice == questions[current].correctAnswer ? .green : .red)
                      : .blue)
            }
            if let answer = selectedAnswer {
                HStack(spacing: 8) {
                    if answer == questions[current].correctAnswer {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.white)
                            .symbolRenderingMode(.palette)
                            .font(.title3)
                            .background(
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 28, height: 28)
                            )
                        Text("Correct! \(questions[current].explanation)")
                    } else {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .symbolRenderingMode(.palette)
                            .font(.title3)
                            .background(
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 28, height: 28)
                            )
                        Text(questions[current].explanation)
                    }
                }
                .padding()
                .animation(.easeIn, value: selectedAnswer)
                Button("Next") {
                    if current < questions.count - 1 {
                        current += 1
                        selectedAnswer = nil
                    }
                }
                .padding(.top)
            }
        }
        .padding()
        .navigationTitle("Smart Quiz")
    }
}

#Preview {
    QuizView(questions: [QuizQuestion.example])
}
