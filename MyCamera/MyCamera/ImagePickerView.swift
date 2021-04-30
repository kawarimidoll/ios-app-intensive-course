//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?

    class Coordinator: NSObject,
                       UINavigationControllerDelegate,
                       UIImagePickerControllerDelegate {
        let parent: ImagePickerView

        init(_ parent: ImagePickerView) {
            self.parent = parent
        }

        // needed by UIImagePickerControllerDelegate
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }

            parent.isShowSheet = false
        }

        // needed by UIImagePickerControllerDelegate
        func imagePickerControllerDidCancel(
            _ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
    }

    // call automatically by SwiftUI
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // needed by UIViewControllerRepresentable
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ImagePickerView>
    ) -> UIImagePickerController {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.sourceType = .camera
        myImagePickerController.delegate = context.coordinator
        return myImagePickerController
    }

    // needed by UIViewControllerRepresentable
    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // nop
    }

}
