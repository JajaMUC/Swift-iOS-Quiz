//
//  NextButton.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct NextButton: View {
    @EnvironmentObject var quizController: QuizController
    @Environment(\.managedObjectContext) var moc

    var background = Color.gray
    var imageName = "target"
    
    
    var body: some View {
        Image(systemName: imageName)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(10)
            .shadow(radius: 5)
            .onTapGesture {
                if quizController.answerAnswered {
                    quizController.goToNextQuestion()
                }
                if quizController.answerSelected {
                    quizController.logAnswer()
                }
            }
    }
}


#Preview {
    NextButton()
        .environmentObject(QuizController(name: "data.json"))
}
