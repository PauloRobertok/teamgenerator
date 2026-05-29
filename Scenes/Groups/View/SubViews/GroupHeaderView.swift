//
//  GroupHeaderView.swift
//  teamgenerator
//
//  Created by Ravi navarro on 28/05/26.
//

import SwiftUI

struct GroupHeaderView: View {
    var body: some View {
        HStack {
            Image(.teamDraftIcon)
                .font(.title)
            
            Text("Drafter")
                .foregroundStyle(.blue)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

#Preview {
    GroupHeaderView()
}
