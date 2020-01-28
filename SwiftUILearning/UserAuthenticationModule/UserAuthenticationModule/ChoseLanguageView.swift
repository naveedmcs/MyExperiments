//
//  ChoseLanguageView.swift
//  UserAuthenticationModule
//
//  Created by apple on 1/21/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import SwiftUI

struct ChoseLanguageView: View {
    var body: some View {
           NavigationView {

               ScrollView {
                   Text("Lol 123 Lol")
                       .foregroundColor(Color.secondary)
                       .padding([.top, .bottom], 16)
//                       .padding([.leading,.trailing], 16)
//                   TwoTextFieldsView(isSecondSecure: true,
//                                     firstTextFieldText: username,
//                                     secondTextFieldText: password,
//                                     firstTextFieldPlaceholder: "Username",
////                                     secondTextFieldPlaceholder: "Password")
//                       .padding([.leading,.trailing, .bottom], 16)



               }
           .navigationBarTitle(<#T##title: Text##Text#>)
               .onTapGesture {
                print("Hello")
               }

           }

       }
}

struct ChoseLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChoseLanguageView()
    }
}
