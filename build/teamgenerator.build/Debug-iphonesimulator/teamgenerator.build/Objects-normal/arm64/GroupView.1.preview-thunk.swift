import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/ravinavarro/Documents/MyProjects/teamGenerator/Scenes/Groups/View/GroupView.swift", line: 1)
//
//  GroupView.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 28/05/26.
//

import SwiftUI

protocol GroupViewModelProtocol: ObservableObject {
    var state: GroupViewState { get }
    func loadData()
}

enum GroupViewState {
    case loading
    case error
    case loaded
}

struct GroupView: View {
    @State private var groupManager = TeamManager()
    var body: some View {
        NavigationStack {
            VStack(spacing: __designTimeInteger("#19825_0", fallback: 0)) {
                //Header
                GroupHeaderView()
                
                // Lista de Groupos
                ScrollView {
                    VStack(spacing: __designTimeInteger("#19825_1", fallback: 16)) {
                        Text(__designTimeString("#19825_2", fallback: "Seus Times"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top,__designTimeInteger("#19825_3", fallback: 16))
                    
                        if groupManager.groups.isEmpty {
                            VStack(spacing: __designTimeInteger("#19825_4", fallback: 12)) {
                                Image(systemName: __designTimeString("#19825_5", fallback: "folder.badge.plus"))
                                    .font(.system(size: __designTimeInteger("#19825_6", fallback: 40)))
                                    .foregroundColor(.gray)
                                Text(__designTimeString("#19825_7", fallback: "Nenhum grupo criado"))
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text(__designTimeString("#19825_8", fallback: "Comece criando um grupo"))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, __designTimeInteger("#19825_9", fallback: 40))
                        } else {
                            ForEach(groupManager.groups) { group in
                                GroupCardView(group: group)
                            }
                        }
                        //Botao Create New Group
                        VStack(spacing: __designTimeInteger("#19825_10", fallback: 12)) {
                            Image(systemName: __designTimeString("#19825_11", fallback: "plus"))
                                .font(.title3)
                            
                            Text(__designTimeString("#19825_12", fallback: "Criar Novo Grupo"))
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, __designTimeInteger("#19825_13", fallback: 32))
                        .foregroundColor(.blue)
                        .background(Color(.systemGray6))
                        .cornerRadius(__designTimeInteger("#19825_14", fallback: 12))
                        .padding(.horizontal)
                        .padding(.vertical, __designTimeInteger("#19825_15", fallback: 16))
                    }
                }
            }
        }
    }
}

#Preview {
    GroupView()
}
