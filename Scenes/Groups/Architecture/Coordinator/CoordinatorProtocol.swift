//
//  CoordinatorProtocol.swift
//  teamgenerator
//
//  Created by Ravi navarro on 30/05/26.
//

import SwiftUI

protocol CoordinatorProtocol {
    associatedtype ContentView: View
    func show() -> ContentView
}
