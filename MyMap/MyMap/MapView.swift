//
//  MapView.swift
//  MyMap
//
//  Created by kawarimidoll on 2021/04/29.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    let searchKey: String

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

        print(searchKey)

        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(searchKey) {
            (placemarks, error) in
            // placemarks is multiple value and contents of them is nullable value
            // so checking is needed like as `placemarks?.first?.location?.coordinate`
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                print(targetCoordinate)

                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinate
                pin.title = searchKey

                uiView.addAnnotation(pin)
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0
                )
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京スカイツリー")
    }
}
