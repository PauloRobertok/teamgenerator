import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/ravinavarro/Documents/MyProjects/teamGenerator/Scenes/Groups/View/SubViews/GroupHeaderView.swift", line: 1)
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
            
            Text(__designTimeString("#20080_0", fallback: "Drafter"))
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
