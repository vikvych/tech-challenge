//
//  BorderView.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

struct BorderView<Content: View>: View {
    let borderColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let content: () -> Content

    var body: some View {
        content()
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: borderWidth)
                    .foregroundColor(borderColor)
            )
            .padding(borderWidth)
    }
}
