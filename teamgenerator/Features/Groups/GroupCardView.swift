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
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                // Icone do esporte
                Image(systemName: group.sport.icon)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(group.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("Esporte: \(group.sport.label)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
            
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                
                Text("\(group.players.count) Jogadores")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    GroupCardView(group: Group(
        name: "Vôlei de Terça",
        sport: .volleyball,
        players: [
        Player(name: "Paulo", gender: .male, skillLevel: .advanced),
        Player(name: "Maria", gender: .female, skillLevel: .intermediate)
        ]
    ))
}
