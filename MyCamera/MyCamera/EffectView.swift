//
//  EffectView.swift
//  MyCamera
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI

struct EffectView: View {

    @Binding var isShowSheet: Bool
    let captureImage: UIImage // effect target image
    @State var showImage: UIImage? // output image
    @State var isShowActivity = false

    var body: some View {
        VStack {
            Spacer()

            if let unwrapShowImage = showImage {
                Image(uiImage: unwrapShowImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Spacer()

            Button(action: {

            }) {
                Text("Set effect")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()

            Button(action: {

            }) {
                Text("Share")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()

            Button(action: {

            }) {
                Text("Close")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .onAppear {
            showImage = captureImage
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(isShowSheet: Binding.constant(true),
                   captureImage: UIImage(named: "preview_use")!)
    }
}
