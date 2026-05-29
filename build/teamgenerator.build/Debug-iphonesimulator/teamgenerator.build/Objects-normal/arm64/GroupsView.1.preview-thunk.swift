import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/ravinavarro/Documents/MyProjects/teamGenerator/Teams/Groups/GroupsView.swift", line: 1)
//
//  GroupsView.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 28/05/26.
//

import SwiftUI

struct GroupsView: View {
    @State private var groupManager = GroupManager()
    var body: some View {
        NavigationStack {
            VStack(spacing: __designTimeInteger("#15424_0", fallback: 0)) {
                //Header
                HStack {
                    
                    Image(systemName: __designTimeString("#15424_1", fallback: "volleyball"))
                        .font(.title)
                    
                    Text(__designTimeString("#15424_2", fallback: "Grupos"))
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                
                // Lista de Groupos
                ScrollView {
                    VStack(spacing: __designTimeInteger("#15424_3", fallback: 16)) {
                        Text(__designTimeString("#15424_4", fallback: "Seus Times"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top,__designTimeInteger("#15424_5", fallback: 16))
                    
                        if groupManager.groups.isEmpty {
                            VStack(spacing: __designTimeInteger("#15424_6", fallback: 12)) {
                                Image(systemName: __designTimeString("#15424_7", fallback: "folder.badge.plus"))
                                    .font(.system(size: __designTimeInteger("#15424_8", fallback: 40)))
                                    .foregroundColor(.gray)
                                Text(__designTimeString("#15424_9", fallback: "Nenhum grupo criado"))
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text(__designTimeString("#15424_10", fallback: "Comece criando um grupo"))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, __designTimeInteger("#15424_11", fallback: 40))
                        } else {
                            ForEach(groupManager.groups) { group in
                                GroupCardView(group: group)
                            }
                        }
                        //Botao Create New Group
                        VStack(spacing: __designTimeInteger("#15424_12", fallback: 12)) {
                            Image(systemName: __designTimeString("#15424_13", fallback: "plus"))
                                .font(.title3)
                            
                            Text(__designTimeString("#15424_14", fallback: "Criar Novo Grupo"))
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, __designTimeInteger("#15424_15", fallback: 32))
                        .foregroundColor(.blue)
                        .background(Color(.systemGray6))
                        .cornerRadius(__designTimeInteger("#15424_16", fallback: 12))
                        .padding(.horizontal)
                        .padding(.vertical, __designTimeInteger("#15424_17", fallback: 16))
                    }
                }
            }
        }
    }
}

#Preview {
    GroupsView()
}
