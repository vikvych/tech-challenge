//
//  ViewModifiers.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

extension Text {
    func primary() -> some View {
        self
            .bold()
            .font(.body)
            .foregroundColor(.accentColor)
    }
    
    func secondary() -> some View {
        self
            .font(.body)
            .foregroundColor(.accentColor)
    }
    
    func tertiary() -> some View {
        self
            .font(.caption)
            .foregroundColor(.accentColor)
            .opacity(0.8)
    }
    
    func percentage() -> some View {
        self
            .font(.title2)
            .bold()
            .foregroundColor(Color(UIColor.label))
    }

    func filter() -> some View {
        self
            .font(.title2)
            .bold()
            .foregroundColor(.white)
    }

    func sumFilter(with color: Color) -> some View {
        self
            .font(.headline)
            .foregroundColor(color)
    }
}

extension View {
    func borderOverlay(
        cornerRadius: CGFloat,
        borderWidth: CGFloat,
        borderColor: Color
    ) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: borderWidth)
                    .foregroundColor(borderColor)
            )
            .padding(borderWidth / 2)
    }
}
