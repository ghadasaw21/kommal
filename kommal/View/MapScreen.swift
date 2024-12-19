//
//  MapScreen.swift
//  kommal
//
//  Created by Ghada al ajmi on 14/06/1446 AH.
//
import SwiftUI
import MapKit

struct MapScreen: View {
    
    @State private var posithon : MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        // TabView container to hold multiple tabs
        TabView {
            // First tab: Map screen
            ZStack {
                VStack(spacing: 0) {
                    
                    
                    
                    // Map view
                    VStack{
                        Map(position: $posithon){
                            
                        }.onAppear(){
                            CLLocationManager().requestWhenInUseAuthorization()
                        }
                    }
                    
                }
                
                // Plus button (custom button for zoom or other actions)
                Button(action: {
                    // Action for user location button (e.g., show user profile)
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(.white))
                        .offset(x: 0)
                }
                .frame(width: 72, height: 72)
                .fontWeight(.bold)
                .background(Circle())
                .foregroundColor(Color(.ylw))
                .padding()
                .offset(x: 140, y: -300).shadow(radius: 1)
            }
            .tabItem {
                Image(systemName: "mappin.and.ellipse") // Icon for this tab
                Text("Map") // Title for the tab
            }
            
            // Second tab: Profile or other content screen
            VStack {
                Text("Browse")
                    .font(.largeTitle)
                    .padding()
                // Add more content for the Profile tab here
            }
            .tabItem {
                Image(systemName: "square.grid.2x2.fill") // Icon for this tab
                Text("Browse") // Title for the tab
            }
            
            // Third tab: Settings or other content screen
            VStack {
                Text("Chat")
                    .font(.largeTitle)
                    .padding()
                // Add more content for the Settings tab here
            }
            .tabItem {
                Image(systemName: "apple.intelligence")
                    // Icon for this tab
                Text("Chat with AI") // Title for the tab
            }
        }
        .accentColor(.circle)
        .background(Color.white) // Set the background color of the entire TabView to white
    }
}

// Custom Location struct that conforms to Identifiable

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
