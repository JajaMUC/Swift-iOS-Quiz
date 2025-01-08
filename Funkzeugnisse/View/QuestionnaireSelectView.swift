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
    var certificate: String
    var categoryid = 0
    var modus: String = "questionnaire"
    
    var body: some View {
        VStack (alignment: .leading) {
            
            NavigationStack {
                ScrollView {
                    VStack (spacing: 15) {
                        ForEach (1...12, id: \.self) { questionnaireid in
                            NavigationLink {
                                QuizView(categoryid: categoryid, certificate: certificate, modus: modus, questionnaireid: questionnaireid)
                                    .environmentObject(quizController)
                                
                            } label: {
                                QuizButton(text: "Fragebogen \(questionnaireid)")
                            }
                        }
                    }
                    
                }
                .navigationTitle("Fragebögen")
            }
            .padding(.top, 20)
               
        }
        .padding()
    }
}

#Preview {
    QuestionnaireSelectView(certificate: "UBI", categoryid: 0)
        .environmentObject(QuizController(name: "data.json"))

}
