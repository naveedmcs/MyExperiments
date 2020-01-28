//
//  ActivityIndicator.swift
//  UserAuthenticationModule
//
//  Created by apple on 1/21/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import SwiftUI

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

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader{ (geometry) in
            VStack {
                
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                
            }.position(x: geometry.size.width/2, y: geometry.size.height/6)
            
        }
        
    }
}
