//
//  MapModel.swift
//  kommal
//
//  Created by Ghada al ajmi on 15/06/1446 AH.
//


//  kommal
//
//  Created by Ghada al ajmi on 15/06/1446 AH.
//
import uuid
import Foundation
import MapKit

struct Location: Identifiable {
   var id: UUID
   var coordinate: CLLocationCoordinate2D
}
