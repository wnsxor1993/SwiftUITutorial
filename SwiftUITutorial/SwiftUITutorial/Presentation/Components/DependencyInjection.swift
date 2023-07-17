//
//  DependencyInjection.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

// MARK: Manager로 지정된 부분은 ViewModel로 변경될 수도 있음
struct DependencyInjection<V, T>: View where V: View, T: ObservableObject {
    
    typealias Content = V
    typealias Manager = T
    
    let manager: Manager
    let content: () -> Content

    init(manager: Manager, @ViewBuilder content: @escaping () -> Content) {
        self.manager = manager
        self.content = content
    }

    var body: some View {
        Group {
            content()
        }
        .environmentObject(manager)
    }
}
