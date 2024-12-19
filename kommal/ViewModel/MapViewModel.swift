//
//  MapViewModel.swift
//  kommal
//
//  Created by Ghada al ajmi on 15/06/1446 AH.
//

import MapKit

final class MapViewModel: ObservableObject{
    
    @Published var directions1: [MKRoute] = []

    func getDirections(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let sourcePlacemark = MKPlacemark(coordinate: source)
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = sourceMapItem
        directionsRequest.destination = destinationMapItem
        directionsRequest.transportType = .automobile
        
        var directions = MKDirections(request: directionsRequest)
        directions.calculate { response, error in
            if let error = error {
                print("Error getting directions: \(error.localizedDescription)")
                return
            }
            
            if let route = response?.routes.first {
                self.directions1 = [route]
                self.openAppleMapsDirections(from: source, to: destination)
            }
        }
    }
    
    // Open Apple Maps with directions
    func openAppleMapsDirections(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let url = URL(string: "http://maps.apple.com/?saddr=\(source.latitude),\(source.longitude)&daddr=\(destination.latitude),\(destination.longitude)")!
        UIApplication.shared.open(url)
    }
}
