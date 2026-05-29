//
//  GroupView.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 28/05/26.
//

import SwiftUI

struct GroupView: View {
    @State private var groupManager = GroupManager()
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.groupManager = groupManager
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                //Header
                GroupHeaderView()
                
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
    GroupView()
}
