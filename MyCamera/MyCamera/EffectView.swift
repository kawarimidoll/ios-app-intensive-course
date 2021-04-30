//
//  EffectView.swift
//  MyCamera
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI

let filterArray = [
    "CIPhotoEffectMono",
    "CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CISepiaTone",
]
var filterSelectIndex = 0

struct EffectView: View {

    @Binding var isShowSheet: Bool
    let captureImage: UIImage // effect target image (not bind)
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
                let filterName = filterArray[filterSelectIndex]
                print("filter: \(filterName)")
                filterSelectIndex += 1
                if filterSelectIndex >= filterArray.count {
                    filterSelectIndex = 0
                }
                let rotate = captureImage.imageOrientation
                let inputImage = CIImage(image: captureImage)

                guard let effectFilter =
                        CIFilter(name: filterName) else {
                    return
                }

                effectFilter.setDefaults()
                effectFilter.setValue(
                    inputImage, forKey: kCIInputImageKey)

                guard let outputImage =
                        effectFilter.outputImage else {
                    return
                }

                let ciContext = CIContext(options: nil)

                guard let cgImage =
                        ciContext.createCGImage(
                            outputImage, from: outputImage.extent)
                else {
                    return
                }

                showImage =
                    UIImage(cgImage: cgImage,
                            scale: 1.0,
                            orientation: rotate)
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
                isShowActivity = true
            }) {
                Text("Share")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()
            .sheet(isPresented: $isShowActivity) {
                ActivityView(shareItems: [showImage!])
            }

            Button(action: {
                isShowSheet = false
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
