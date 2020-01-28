//
//  ContentView.swift
//  UserAuthenticationModule
//
//  Created by apple on 1/21/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    @State private var shouldAnimate = true
    
    @State var moveToNextVC = false
    
    var body: some View {
        
        
        GeometryReader{ (geometry) in
            ZStack() {
                Image("splash")
                    .resizable()
                VStack {
                    ActivityIndicator(isAnimating: self.$shouldAnimate, style: .large)
                    
                }.position(x: geometry.size.width/2,
                           y: geometry.size.height/6)
                    .foregroundColor(.red)
                
            }.edgesIgnoringSafeArea(.all)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                self.moveToNextVC = true
                
            }
            }.sheet(isPresented: $moveToNextVC){
            ChoseLanguageView()
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
