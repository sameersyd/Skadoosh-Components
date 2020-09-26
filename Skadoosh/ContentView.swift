//
//  ContentView.swift
//  Skadoosh
//
//  Created by Sameer Nawaz on 26/09/20.
//

import SwiftUI

struct ContentView: View {
    
    var title = "Get iOS Weekly"
    var description = "The newsletter comes once a week and covers a broad range of topics like tutorials, screencasts, news. Just everything that's awesome in the iOS Development world!"
    @State var TFValue: String = ""
    func getNewsLetter() { print("Send newsletter to \(TFValue)") }
    
    var body: some View {
        VStack {
            NewsLetterCard(primaryText: title, secondaryText: description, TFPlaceHolder: "Your email", TFValue: self.$TFValue, buttonLabel: "Get", buttonClick: self.getNewsLetter)
        }
        .padding(.horizontal, 16.0)
    }
}

struct NewsLetterCard: View {
    
    var primaryText: String
    var secondaryText: String
    var TFPlaceHolder: String
    @Binding var TFValue: String
    var buttonLabel: String
    var buttonClick: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(primaryText).font(.title2).fontWeight(.bold)
            Text(secondaryText).font(.headline).fontWeight(.regular)
            HStack(alignment: .center) {
                TextField(TFPlaceHolder, text: $TFValue)
                    .padding(.leading, 8.0)
                    .frame(height: 40.0)
                    .font(.body)
                    .foregroundColor(Color.black)
                    .accentColor(Color.gray)
                Button(action: { self.buttonClick() }) {
                    Text(buttonLabel)
                        .foregroundColor(Color.white)
                        .frame(height: 40.0)
                        .padding(.horizontal, 30.0)
                }
                .background(Color("custom_orange"))
                .cornerRadius(18.0)
            }
            .padding(.horizontal, 5.0)
            .frame(height: 50.0)
            .background(Color.white)
            .cornerRadius(30.0)
        }
        .padding(.all, 30.0)
        .foregroundColor(.white)
        .background(Color("custom_purple"))
        .cornerRadius(30.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
