import func SwiftUI.__designTimeSelection

import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/ravinavarro/Documents/MyProjects/teamGenerator/teamgenerator/Features/Groups/GroupCardView.swift", line: 1)
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
        __designTimeSelection(VStack(alignment: .leading, spacing: __designTimeInteger("#7702_0", fallback: 0)) {
            __designTimeSelection(HStack(alignment: .center, spacing: __designTimeInteger("#7702_1", fallback: 14)) {
                __designTimeSelection(ZStack {
                    __designTimeSelection(RoundedRectangle(cornerRadius: __designTimeInteger("#7702_2", fallback: 12))
                        .fill(__designTimeSelection(group.sport.color.opacity(__designTimeFloat("#7702_3", fallback: 0.15)), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.[0].modifier[0].arg[0].value"))
                        .frame(width: __designTimeInteger("#7702_4", fallback: 54), height: __designTimeInteger("#7702_5", fallback: 54)), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.[0]")
                    __designTimeSelection(Image(systemName: __designTimeSelection(group.sport.icon, "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.[1].arg[0].value"))
                        .font(__designTimeSelection(.system(size: __designTimeInteger("#7702_6", fallback: 28), weight: .bold), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[0]"))
                        .foregroundColor(__designTimeSelection(group.sport.color, "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.[1].modifier[1].arg[0].value")), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.[1]")
                }, "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[0]")
                __designTimeSelection(VStack(alignment: .leading, spacing: __designTimeInteger("#7702_7", fallback: 4)) {
                    __designTimeSelection(Text(__designTimeSelection(group.name, "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1].arg[2].value.[0].arg[0].value"))
                        .font(__designTimeSelection(.system(size: __designTimeInteger("#7702_8", fallback: 17), weight: .semibold), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1].arg[2].value.[0].modifier[0].arg[0]"))
                        .foregroundColor(.black), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1].arg[2].value.[0]")
                    __designTimeSelection(Text("Sport: \(__designTimeSelection(group.sport.label, "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1].arg[2].value.[1].arg[0].value.[1].value.arg[0].value"))")
                        .font(__designTimeSelection(.system(size: __designTimeInteger("#7702_9", fallback: 13), weight: .regular), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1].arg[2].value.[1].modifier[0].arg[0]"))
                        .foregroundColor(.gray), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1].arg[2].value.[1]")
                }, "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[1]")
                __designTimeSelection(Spacer(), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[2]")
                __designTimeSelection(Image(systemName: __designTimeString("#7702_10", fallback: "ellipsis"))
                    .foregroundColor(.gray), "#7702.[1].[1].property.[0].[0].arg[2].value.[0].arg[2].value.[3]")
            }
            .padding(.bottom, __designTimeInteger("#7702_11", fallback: 10)), "#7702.[1].[1].property.[0].[0].arg[2].value.[0]")

            __designTimeSelection(HStack(spacing: __designTimeInteger("#7702_12", fallback: 6)) {
                __designTimeSelection(Image(systemName: __designTimeString("#7702_13", fallback: "circle.fill"))
                    .resizable()
                    .foregroundColor(__designTimeSelection(Color.green, "#7702.[1].[1].property.[0].[0].arg[2].value.[1].arg[1].value.[0].modifier[1].arg[0].value"))
                    .frame(width: __designTimeInteger("#7702_14", fallback: 10), height: __designTimeInteger("#7702_15", fallback: 10)), "#7702.[1].[1].property.[0].[0].arg[2].value.[1].arg[1].value.[0]")
                __designTimeSelection(Text("\(__designTimeSelection(group.players.count, "#7702.[1].[1].property.[0].[0].arg[2].value.[1].arg[1].value.[1].arg[0].value.[1].value.arg[0].value")) Players")
                    .font(__designTimeSelection(.system(size: __designTimeInteger("#7702_16", fallback: 13), weight: .semibold), "#7702.[1].[1].property.[0].[0].arg[2].value.[1].arg[1].value.[1].modifier[0].arg[0]"))
                    .foregroundColor(.black), "#7702.[1].[1].property.[0].[0].arg[2].value.[1].arg[1].value.[1]")
            }
            .padding(.leading, __designTimeInteger("#7702_17", fallback: 4)), "#7702.[1].[1].property.[0].[0].arg[2].value.[1]")
        }
        .padding(__designTimeInteger("#7702_18", fallback: 18))
        .background(
            __designTimeSelection(RoundedRectangle(cornerRadius: __designTimeInteger("#7702_19", fallback: 16))
                .fill(__designTimeSelection(Color.white, "#7702.[1].[1].property.[0].[0].modifier[1].arg[0].value.modifier[0].arg[0].value"))
                .shadow(color: __designTimeSelection(Color(.sRGBLinear, white: __designTimeInteger("#7702_20", fallback: 0), opacity: __designTimeFloat("#7702_21", fallback: 0.06)), "#7702.[1].[1].property.[0].[0].modifier[1].arg[0].value.modifier[1].arg[0].value"), radius: __designTimeInteger("#7702_22", fallback: 8), x: __designTimeInteger("#7702_23", fallback: 0), y: __designTimeInteger("#7702_24", fallback: 4)), "#7702.[1].[1].property.[0].[0].modifier[1].arg[0].value")
        )
        .padding(.horizontal, __designTimeInteger("#7702_25", fallback: 8))
        .padding(.vertical, __designTimeInteger("#7702_26", fallback: 4)), "#7702.[1].[1].property.[0].[0]")
    }
}

#Preview {
    GroupCardView(group: Group(
        name: __designTimeString("#7702_27", fallback: "Tuesday Volleyball"),
        sport: .volleyball,
        players: Array(repeating: Player(name: __designTimeString("#7702_28", fallback: "Paulo"), gender: .male, skillLevel: .advanced), count: __designTimeInteger("#7702_29", fallback: 16))
    ))
    .previewLayout(.sizeThatFits)
    GroupCardView(group: Group(
        name: __designTimeString("#7702_30", fallback: "Futsal Fridays"),
        sport: .futsal,
        players: Array(repeating: Player(name: __designTimeString("#7702_31", fallback: "Maria"), gender: .female, skillLevel: .intermediate), count: __designTimeInteger("#7702_32", fallback: 10))
    ))
    .previewLayout(.sizeThatFits)
    GroupCardView(group: Group(
        name: __designTimeString("#7702_33", fallback: "Morning Hoops"),
        sport: .basketball,
        players: Array(repeating: Player(name: __designTimeString("#7702_34", fallback: "João"), gender: .male, skillLevel: .beginner), count: __designTimeInteger("#7702_35", fallback: 12))
    ))
    .previewLayout(.sizeThatFits)
}
