//
//  AnyTransition +.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/20.
//

import SwiftUI

extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}
