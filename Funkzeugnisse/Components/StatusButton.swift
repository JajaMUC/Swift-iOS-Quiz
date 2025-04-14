//
//  StatusButton.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct StatusButton: View {
    
    var color = Color.button
    var imageName = "sailboat"
    var questionstatus: Int = 0
    
    var body: some View {
        Image(systemName: imageName)
            .foregroundColor(questionstatus == 1 ? .statusone : (questionstatus == 2 ? .statustwo : (questionstatus == 3 ? .statusthree : .gray)))
    }
    
}
