//
//  StatusButton.swift
//  Funkzeugnisse
//
//  Created by Janin Schroth on 19.12.24.
//

import SwiftUI

struct StatusButton: View {
    
    var color = Color.buttonBlue
    var imageName = "sailboat"
    var questionStatus: Int = 0
    
    var body: some View {
        Image(systemName: imageName)
            .foregroundColor(questionStatus == 0 ? .statusZero : (questionStatus == 1 ? .statusOne : (questionStatus == 2 ? .statusTwo : .gray)))
    }
    
}
