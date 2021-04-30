//
//  ActivityView.swift
//  MyCamera
//
//  Created by kawarimidoll on 2021/04/30.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    let shareItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
    }

    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: UIViewControllerRepresentableContext<ActivityView>) {
        // nop
    }

}
