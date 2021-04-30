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
    @State var isShowActivity = false
    @State var isPhotoLibrary = false
    @State var isShowAction = false

    @State var showAlert = false

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
                if cameraIsEnable() {
                    print("available")
                    isShowAction = true
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
                if isPhotoLibrary {
                    PHPickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                } else {
                    ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                }
            }
            .actionSheet(isPresented: $isShowAction) {
                ActionSheet(
                    title: Text("Select"),
                    message: Text("Camera or photo library"),
                    buttons: [
                        .default(Text("Camera"), action: {
                            if cameraIsEnable() {
                                print("available")
                                isShowSheet = true
                            } else {
                                print("disabled")
                            }
                            isPhotoLibrary = false
                        }),
                        .default(Text("Photo library"), action: {
                            isPhotoLibrary = true
                            isShowSheet = true
                        }),
                        .cancel()
                    ])
            }

            Button(action: {
                if (captureImage != nil) {
                    isShowActivity = true
                } else {
                    showAlert = true
                }
            }) {
                Text("Share the photo")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()
            .sheet(isPresented: $isShowActivity) {
                ActivityView(shareItems: [captureImage!])
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("No photo!"),
                      message: Text("Take a photo or select from library"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }

    func cameraIsEnable() -> Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
