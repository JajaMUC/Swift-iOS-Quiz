//
//  QuizSelectViewOLD.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 23.05.25.
//

//
//  QuizSelectView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 23.05.25.
//

import SwiftUI

struct QuizSelectView: View {
    @EnvironmentObject var quizController: QuizController
    @State var categories: [Category] = []
    @State var quizCertificate: String = ""
    @State var modus: String = "review"
    @State var questionnaireid = 0
    @State var name: String = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack (alignment: .leading, spacing: 15) {
                    NavigationLink {
                        QuizView(categoryId: 0, quizCertificate: quizCertificate, modus: modus, questionnaireId: questionnaireid)
                            .environmentObject(quizController)
                        
                    } label: {
                        QuizButton(text: "Alle Fragen")
                    }
                    ForEach(categories, id: \.id) { category in
                        NavigationLink {
                            QuizView(categoryId: category.id, quizCertificate: quizCertificate, modus: modus, questionnaireId: questionnaireid)
                                .environmentObject(quizController)
                            
                        } label: {
                            QuizButton(text: category.name, background: Color.buttonLightBlue, foreground: Color.buttonBlue)
                        }
                    }
                    VStack (alignment: .leading, spacing: 15){
                       
                    }
                }
                .navigationTitle(name)
                .padding()
                Spacer()
            }
        }
        .background(Color.background)
        .onAppear() {
            if quizCertificate == "UBI" || quizCertificate == "SRCUBI" {
                categories = Categories.init().ubiCategories
            } else {
                categories = Categories.init().srcCategories
            }
            name = "\(quizCertificate)-Prüfungsfragen"
        }
    }
}

#Preview {
    QuizSelectView(quizCertificate: "UBI")
        .environmentObject(QuizController(name: "data.json"))
}
