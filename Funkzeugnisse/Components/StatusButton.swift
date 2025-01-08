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
    var status: Int16 = 0
    
    var body: some View {
        Image(systemName: imageName)
            .foregroundColor(status == 0 ? .statuszero : (status == 1 ? .statusone : (status == 2 ? .statustwo : .gray)))
    }
    
}


#Preview {
    StatusButton()
}
