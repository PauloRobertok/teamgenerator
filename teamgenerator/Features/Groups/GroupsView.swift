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
            VStack(spacing: 0) {
                //Header
                HStack {
                    
                    Image(systemName: "volleyball")
                        .font(.title)
                    
                    Text("Grupos")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                
                // Lista de Groupos
                ScrollView {
                    VStack(spacing: 16) {
                        Text("Seus Times")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top,16)
                    
                        if groupManager.groups.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "folder.badge.plus")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                                Text("Nenhum grupo criado")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text("Comece criando um grupo")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 40)
                        } else {
                            ForEach(groupManager.groups) { group in
                                GroupCardView(group: group)
                            }
                        }
                        //Botao Create New Group
                        VStack(spacing: 12) {
                            Image(systemName: "plus")
                                .font(.title3)
                            
                            Text("Criar Novo Grupo")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                        .foregroundColor(.blue)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.vertical, 16)
                    }
                }
            }
        }
    }
}

#Preview {
    GroupsView()
}
