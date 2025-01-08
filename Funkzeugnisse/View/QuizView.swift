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
    var categoryid: Int
    var certificate: String
    var modus: String
    var questionnaireid: Int
    
    var body: some View {
        VStack {
            QuestionView()
                .environmentObject(quizController)
        }
        .onAppear() {
            quizController.setCurrentQuiz(categoryid: categoryid, certificate: certificate, modus: modus, questionnaireid: questionnaireid)
            quizController.setQuestion()
        }
        .onDisappear(){
            quizController.resetQuiz()
        }
    }
}

 #Preview {
     QuizView(categoryid: 4, certificate: "UBI", modus: "quiz", questionnaireid: 4)
 .environmentObject(QuizController(name: "data.json"))
 }
 
