//
//  ContentView.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 08.01.25.
//

import SwiftUI
import Foundation
import CoreData

struct ContentView: View {
    
    @StateObject var quizController = QuizController(name: "data.json")
    var body: some View {
        
        NavigationStack () {
            VStack {
                VStack (alignment: .leading, spacing: 40) {
                    VStack (alignment: .leading, spacing: 20) {
                            
                        Text("Far far away, behind the word mountains, far from the countries Vokalia and Consonantia")
                        
                            NavigationLink{
                                QuizMainView(certificate: "UBI")
                                    .environmentObject(quizController)
                            } label: {
                                QuizButton(text: "UBI – UKW-Sprechfunkzeugnis für den Binnenschifffahrtsfunk")
                            }

                            NavigationLink{
                                QuizMainView(certificate: "SRC")
                                    .environmentObject(quizController)
                            } label: {
                                QuizButton(text: "SRC – Short Range Certificate")
                            }
                        }
                        Spacer()
                        Text("")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
                .navigationTitle("Funkscheine")
                .font(.title3)
        }
    }
}


#Preview {
    ContentView()
}
