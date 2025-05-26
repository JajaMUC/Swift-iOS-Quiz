//
//  QuestionnaireSelectView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI
import Foundation

struct QuestionnaireSelectView: View {
    @EnvironmentObject var quizController: QuizController
    var quizCertificate: String
    var categoryId = 0
    var modus: String = "questionnaire"
    
    var body: some View {
        VStack (alignment: .leading) {
            
            NavigationStack {
                ScrollView {
                    VStack (spacing: 15) {
                        ForEach (1...12, id: \.self) { questionnaireId in
                            NavigationLink {
                                QuizView(categoryId: categoryId, quizCertificate: quizCertificate, modus: modus, questionnaireId: questionnaireId)
                                    .environmentObject(quizController)
                                
                            } label: {
                                QuizButton(text: "Fragebogen \(questionnaireId)")
                            }
                        }
                    }
                    
                }
                .navigationTitle("Fragebögen")
            }
            .padding(.top, 20)
               
        }
        .padding()
        .background(Color.background)
       
    }
}

#Preview {
    QuestionnaireSelectView(quizCertificate: "UBI", categoryId: 0)
        .environmentObject(QuizController(name: "data.json"))

}
