//
//  PHPickerView.swift
//  MyCamera
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
    
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?

    class Coordinator: NSObject,
                       PHPickerViewControllerDelegate {
        let parent: PHPickerView

        init(_ parent: PHPickerView) {
            self.parent = parent
        }

        // needed byPHPickerViewControllerDelegate
        func picker(
            _ picker: PHPickerViewController,
            didFinishPicking results: [PHPickerResult]) {
            if let result = results.first {
                result.itemProvider.loadObject(ofClass: UIImage.self) {
                    (image, error) in
                    if let unwrapImage = image as? UIImage {
                        self.parent.captureImage = unwrapImage
                    } else {
                        print("no available photo")
                    }
                }
            } else {
                print("no selected photo")
            }
            parent.isShowSheet = false
        }
    }

    // call automatically by SwiftUI
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<PHPickerView>
    ) -> PHPickerViewController {
        var configration = PHPickerConfiguration()
        configration.filter = PHPickerFilter.images
        configration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(
        _ uiViewController: PHPickerViewController,
        context: UIViewControllerRepresentableContext<PHPickerView>) {
        // nop
    }

}
