//
//  GroupGameView.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 28/05/26.
//

import SwiftUI

struct GroupGameView<ViewModel: GroupGameViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var showingCreateSheet = false
    @State private var newGroupName = ""
    @State private var selectedSport: SportType = .volleyball
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch viewModel.state {
                case .loading:
                    Spacer()
                    ProgressView("Carregando...")
                    Spacer()
                    
                case .error:
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 40))
                            .foregroundColor(.red)
                        Text("Erro ao carregar grupos")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Button("Tentar novamente") {
                            Task {
                                await viewModel.loadData()
                            }
                        }
                    }
                    Spacer()
                    
                case .loaded:
                    ScrollView {
                        VStack(spacing: 16) {
                            Text("Seus Times")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top, 16)
                            
                            if viewModel.groups.isEmpty {
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
                                ForEach(viewModel.groups) { group in
                                    GroupGameCardView(group: group)
                                        .contextMenu {
                                            Button(role: .destructive) {
                                                Task {
                                                    await viewModel.deleteGroup(group)
                                                }
                                            } label: {
                                                Label("Excluir", systemImage: "trash")
                                            }
                                        }
                                }
                                .padding(.horizontal)
                            }
                            
                            // Botao Create New Group
                            Button {
                                showingCreateSheet = true
                            } label: {
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
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 16)
                        }
                    }
                    
                case .teams:
                    EmptyView()
                }
            }
        }
        .task {
            await viewModel.loadData()
        }
        .sheet(isPresented: $showingCreateSheet) {
            createGroupSheet
        }
    }
    
    // MARK: - Create Group Sheet
    
    private var createGroupSheet: some View {
        NavigationStack {
            Form {
                Section("Nome do Grupo") {
                    TextField("Ex: Vôlei da Praia", text: $newGroupName)
                }
                
                Section("Tipo de Esporte") {
                    Picker("Esporte", selection: $selectedSport) {
                        ForEach(SportType.allCases, id: \.self) { sport in
                            HStack {
                                Image(systemName: sport.icon)
                                Text(sport.label)
                            }
                            .tag(sport)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
            }
            .navigationTitle("Novo Grupo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        resetForm()
                        showingCreateSheet = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Criar") {
                        createGroup()
                    }
                    .disabled(newGroupName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
        .presentationDetents([.medium])
    }
    
    // MARK: - Private Methods
    
    private func createGroup() {
        let group = GroupGame(
            name: newGroupName.trimmingCharacters(in: .whitespaces),
            sport: selectedSport,
            players: []
        )
        
        Task {
            await viewModel.addGroup(group)
        }
        
        resetForm()
        showingCreateSheet = false
    }
    
    private func resetForm() {
        newGroupName = ""
        selectedSport = .volleyball
    }
}

#Preview {
    GroupGameView(viewModel: GroupGameViewModel())
}
