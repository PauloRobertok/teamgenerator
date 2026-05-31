//
//  RepositoryError.swift
//  teamgenerator
//
//  Created by Ravi navarro on 30/05/26.
//

import Foundation

enum RepositoryError: Error, LocalizedError {
    case notFound
    case saveFailed
    case fetchFailed
    
    var errorDescription: String? {
        switch self {
        case .notFound:
            return "Item não encontrado"
        case .saveFailed:
            return "Falha ao salvar"
        case .fetchFailed:
            return "Falha ao buscar dados"
        }
    }
}
