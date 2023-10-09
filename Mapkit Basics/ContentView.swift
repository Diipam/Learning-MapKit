//
//  ContentView.swift
//  Mapkit Basics
//
//  Created by Smart Solar Nepal on 05/10/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let tower = CLLocationCoordinate2D(
        latitude: 27.68521607514551,
        longitude: 85.33507911190014)

    let home = CLLocationCoordinate2D(
        latitude: 27.666656878349883,
        longitude: 85.36014842538394)

    let sasurali = CLLocationCoordinate2D(
        latitude: 27.76158620943384,
        longitude: 85.29408565925299)

    let khusiramNoob = CLLocationCoordinate2D(
        latitude: 39.33303,
        longitude: 82.11403)

    @State var camera: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $camera) {

            Marker("My Office" , systemImage: "building.2.fill", coordinate: tower)
                .tint(.blue)

            Annotation("Ghar", coordinate: home){
                Image(systemName: "person.crop.artframe")
                    .foregroundColor(.white)
                    .padding()
                    .background(.red)
            }

            Marker("Sasurali",coordinate: sasurali)
                .tint(.red)

            Marker("Khusiram Noob" , systemImage: "figure.strengthtraining.traditional", coordinate: khusiramNoob)
                .tint(.blue)

        }
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                Button {
//                    add a button
                    camera = .region(MKCoordinateRegion(
                    center: home,
                    latitudinalMeters: 200,
                    longitudinalMeters: 200))
                } label: {
                    Text("Cn Home")
                }

                Button {
                    camera = .region(MKCoordinateRegion(center: tower, latitudinalMeters: 200, longitudinalMeters: 200))
                } label: {
                    Text("Office")
                }

                Spacer()

            }
            .padding(.top)
            .background(.thinMaterial)
        }
        .mapStyle(.imagery)
    }
}

#Preview {
    ContentView()
}

