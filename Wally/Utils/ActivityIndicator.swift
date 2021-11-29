//
//  ActivityIndicator.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-27.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct SpinWheel: ViewModifier {
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
            if isLoading {
                Group {
                    Color(red: 0, green: 0, blue: 0, opacity: 0.2)
                        .ignoresSafeArea()
                    ActivityIndicator(isAnimating: $isLoading, style: .large)
                }
            }
        }
    }
}
