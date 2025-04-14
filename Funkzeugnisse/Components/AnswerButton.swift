//
//  AnswerButton.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct AnswerButton: View {
    @EnvironmentObject var quizController: QuizController
    var answer: Answer
    
    var body: some View {
        HStack(spacing: 20) {
            Text(answer.text)
                .font(.system(size: 14))
                .lineSpacing(0.6)
                .fixedSize(horizontal: false, vertical: true)
            
                Spacer()
                
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.button)
        .background(Color.lightBlue)
        .cornerRadius(10)
        .shadow(color: quizController.answerSelection[answer.index] ? (quizController.answerAnswered ? (answer.isCorrect ? Color.answerCorrect : Color.answerIncorrect) : Color.button) : (quizController.answerAnswered ? (answer.isCorrect ? Color.answerCorrect : .gray) : .gray), radius: 5, x: 1.0, y: 1.0)
        .onTapGesture() {
            if !quizController.answerAnswered {
                quizController.selectAnswer(answer: answer)
            }

        }
        
    }
}
