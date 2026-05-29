import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/ravinavarro/Documents/MyProjects/teamGenerator/Scenes/Groups/View/SubViews/GroupCardView.swift", line: 1)
//
//  GroupCardView.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 28/05/26.
//

import SwiftUI

struct GroupCardView: View {
    let group: Group
    
    var body: some View {
        VStack(alignment: .leading, spacing: __designTimeInteger("#20127_0", fallback: 0)) {
            HStack(alignment: .center, spacing: __designTimeInteger("#20127_1", fallback: 14)) {
                ZStack {
                    RoundedRectangle(cornerRadius: __designTimeInteger("#20127_2", fallback: 12))
                        .fill(group.sport.color.opacity(__designTimeFloat("#20127_3", fallback: 0.15)))
                        .frame(width: __designTimeInteger("#20127_4", fallback: 54), height: __designTimeInteger("#20127_5", fallback: 54))
                    Image(systemName: group.sport.icon)
                        .font(.system(size: __designTimeInteger("#20127_6", fallback: 28), weight: .bold))
                        .foregroundColor(group.sport.color)
                }
                VStack(alignment: .leading, spacing: __designTimeInteger("#20127_7", fallback: 4)) {
                    Text(group.name)
                        .font(.system(size: __designTimeInteger("#20127_8", fallback: 17), weight: .semibold))
                        .foregroundColor(.black)
                    Text("Sport: \(group.sport.label)")
                        .font(.system(size: __designTimeInteger("#20127_9", fallback: 13), weight: .regular))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: __designTimeString("#20127_10", fallback: "ellipsis"))
                    .foregroundColor(.gray)
            }
            .padding(.bottom, __designTimeInteger("#20127_11", fallback: 10))

            HStack(spacing: __designTimeInteger("#20127_12", fallback: 6)) {
                Image(systemName: __designTimeString("#20127_13", fallback: "circle.fill"))
                    .resizable()
                    .foregroundColor(Color.green)
                    .frame(width: __designTimeInteger("#20127_14", fallback: 10), height: __designTimeInteger("#20127_15", fallback: 10))
                Text("\(group.players.count) Players")
                    .font(.system(size: __designTimeInteger("#20127_16", fallback: 13), weight: .semibold))
                    .foregroundColor(.black)
            }
            .padding(.leading, __designTimeInteger("#20127_17", fallback: 4))
        }
        .padding(__designTimeInteger("#20127_18", fallback: 18))
        .background(
            RoundedRectangle(cornerRadius: __designTimeInteger("#20127_19", fallback: 16))
                .fill(Color.white)
                .shadow(color: Color(.sRGBLinear, white: __designTimeInteger("#20127_20", fallback: 0), opacity: __designTimeFloat("#20127_21", fallback: 0.06)), radius: __designTimeInteger("#20127_22", fallback: 8), x: __designTimeInteger("#20127_23", fallback: 0), y: __designTimeInteger("#20127_24", fallback: 4))
        )
        .padding(.horizontal, __designTimeInteger("#20127_25", fallback: 8))
        .padding(.vertical, __designTimeInteger("#20127_26", fallback: 4))
    }
}

#Preview {
    GroupCardView(group: Group(
        name: __designTimeString("#20127_27", fallback: "Tuesday Volleyball"),
        sport: .volleyball,
        players: Array(repeating: Player(name: __designTimeString("#20127_28", fallback: "Paulo"), gender: .male, skillLevel: .advanced), count: __designTimeInteger("#20127_29", fallback: 16))
    ))
    .previewLayout(.sizeThatFits)
    GroupCardView(group: Group(
        name: __designTimeString("#20127_30", fallback: "Futsal Fridays"),
        sport: .futsal,
        players: Array(repeating: Player(name: __designTimeString("#20127_31", fallback: "Maria"), gender: .female, skillLevel: .intermediate), count: __designTimeInteger("#20127_32", fallback: 10))
    ))
    .previewLayout(.sizeThatFits)
    GroupCardView(group: Group(
        name: __designTimeString("#20127_33", fallback: "Morning Hoops"),
        sport: .basketball,
        players: Array(repeating: Player(name: __designTimeString("#20127_34", fallback: "João"), gender: .male, skillLevel: .beginner), count: __designTimeInteger("#20127_35", fallback: 12))
    ))
    .previewLayout(.sizeThatFits)
}
