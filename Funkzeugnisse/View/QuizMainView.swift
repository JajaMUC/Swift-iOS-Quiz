//
//  UbiMainView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI
import CoreData

struct QuizMainView: View {
    var certificate: String = ""
    @EnvironmentObject var quizController: QuizController

    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("UKW-Sprechfunkzeugnis für den Binnenschifffahrtsfunk")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    .padding([.leading, .trailing], 19)
                                
                VStack (spacing: 40) {
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Lernmodus")
                            .font(.system(size: 20))
                            .bold()
                        NavigationLink{
                            QuizSelectView(certificate: certificate)
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: certificate)
                        }
                        NavigationLink{
                            QuizSelectView(certificate: "SRCUBI")
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: "SRC auf UBI")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .navigationTitle(certificate)
                    
                    
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Prüfungsbögen")
                            .font(.system(size: 20))
                            .bold()
                        NavigationLink{
                            QuestionnaireSelectView(certificate: certificate)
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: "UBI")
                        }
                        NavigationLink{
                            QuestionnaireSelectView(certificate: "SRCUBI")
                                .environmentObject(quizController)
                        } label: {
                            QuizButton(text: "SRC auf UBI")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .navigationTitle(certificate)
                    .font(.title2)

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
