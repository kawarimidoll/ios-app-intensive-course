//
//  ContentView.swift
//  MyCamera
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI

struct ContentView: View {

    @State var captureImage: UIImage? = nil
    @State var isShowSheet = false

    var body: some View {

        VStack {
            Spacer()

            if let unwrapCpautreImage = captureImage {
                Image(uiImage: unwrapCpautreImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Spacer()

            Button(action: {
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    print("available")
                    isShowSheet = true
                } else {
                    print("disabled")
                }
            }) {
                Text("Take a photo")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()
            .sheet(isPresented: $isShowSheet) {
                ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
