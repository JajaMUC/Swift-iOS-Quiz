//
//  UbiMainView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI
import CoreData

struct QuizMainView: View {
    var quizCertificate: String = ""
    @EnvironmentObject var quizController: QuizController

    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Sprechfunkzeugnis für den Binnenschifffahrtsfunk")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    .padding([.leading, .trailing], 19)
                                
                VStack (spacing: 15) {
                    VStack (alignment: .leading, spacing: 15) {
                        NavigationLink{
                            QuizSelectView(quizCertificate: quizCertificate)
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: "Lernmodus")
                        }
                        NavigationLink{
                            QuestionnaireSelectView(quizCertificate: "SRCUBI")
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: "Prüfungsmodus")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.background)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .navigationTitle(quizCertificate)
                }
                .padding()
                Spacer()
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
    }
    }
}


#Preview {
    QuizMainView()
        .environmentObject(QuizController(name: "data.json"))
}
