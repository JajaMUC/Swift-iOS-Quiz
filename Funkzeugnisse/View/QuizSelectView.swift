//
//  QuizSelectView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct QuizSelectView: View {
    @EnvironmentObject var quizController: QuizController
    @State var categories: [Category] = []
    @State var certificate: String = ""
    @State var modus: String = "review"
    @State var questionnaireid = 0
    @State var name: String = ""

    
   
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    NavigationLink {
                        QuizView(categoryid: 0, certificate: certificate, modus: modus, questionnaireid: questionnaireid)
                            .environmentObject(quizController)
                        
                    } label: {
                        QuizButton(text: "Alle Fragen")
                    }
                    VStack (alignment: .leading, spacing: 15){
                        Text("Kategorien")
                            .padding(.top, 20)
                            .font(.system(size: 20))
                            .bold()
                        ForEach(categories, id: \.id) { category in
                            NavigationLink {
                                QuizView(categoryid: category.id, certificate: certificate, modus: modus, questionnaireid: questionnaireid)
                                    .environmentObject(quizController)
                                
                            } label: {
                                QuizButton(text: category.name)
                            }
                        }
                    }
                }
                .navigationTitle(name)
                .padding()
            }
        }
        .onAppear() {
            if certificate == "UBI" || certificate == "SRCUBI" {
                categories = Categories.init().ubiCategories
            } else {
                categories = Categories.init().srcCategories
            }
            name = "\(certificate)-Prüfungsfragen"
        }
    }
}

#Preview {
    QuizSelectView(certificate: "UBI")
        .environmentObject(QuizController(name: "data.json"))
}
