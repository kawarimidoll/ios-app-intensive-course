//
//  ContentView.swift
//  MyOkashi
//
//  Created by kawarimidoll on 2021/05/01.
//

import SwiftUI

struct ContentView: View {

    // ObservableObject内の@Published付きプロパティの変化を監視してbody更新
    @ObservedObject var okashiDataList = OkashiData()
    @State var inputText = ""
    @State var showSafari = false

    var body: some View {
        VStack {
            TextField("Input keyword", text: $inputText, onCommit: {
                okashiDataList.search(keyword: inputText)
            })
            .padding()

            List(okashiDataList.okashiList) {
                okashi in

                Button(action: {
                    showSafari.toggle()
                }) {
                    HStack {
                        Image(uiImage: okashi.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        Text(okashi.name)
                    }
                }
                .sheet(isPresented: self.$showSafari) {
                    SafariView(url: okashi.link)
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
