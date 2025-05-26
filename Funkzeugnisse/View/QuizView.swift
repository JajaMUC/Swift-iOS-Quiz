//
//  QuizView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import Foundation
import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizController: QuizController
    var categoryId: Int
    var quizCertificate: String
    var modus: String
    var questionnaireId: Int
    
    var body: some View {
        VStack {
            QuestionView()
                .environmentObject(quizController)
        }
        .onAppear() {
            quizController.setCurrentQuiz(categoryId: categoryId, quizCertificate: quizCertificate, modus: modus, questionnaireId: questionnaireId)
            quizController.setQuestion()
        }
        .onDisappear(){
            quizController.resetQuiz()
        }
    }
}

 #Preview {
     QuizView(categoryId: 4, quizCertificate: "UBI", modus: "quiz", questionnaireId: 4)
 .environmentObject(QuizController(name: "data.json"))
 }
 
