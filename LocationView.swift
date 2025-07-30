//
//  LocationView.swift
//  TeslaApp
//
//  Created by Gamze Eryavuz on 3.07.2025.
//

import SwiftUI
import MapKit


struct CarLocation: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let carLocations = [CarLocation(latitude: 40.7484, longitude: -73.9857)]

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))

    
    var body: some View {
        ZStack {
        Map(coordinateRegion: $location, annotationItems: carLocations,
            annotationContent: {
            location in MapAnnotation(coordinate: location.coordinate, content: {CarPin()})
        }
        )
            
            CarLocationPanel()
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        GeneralButton(icon: "chevron.left")
                    }
                    Spacer()
                    Button(action:{}) {
                        GeneralButton(icon: "speaker.wave.3.fill")
                    }
                }
                .padding()
                Spacer()
            }
            
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.black)
        .foregroundColor(Color.white)
        .navigationTitle("Gamze's Tesla ")
        .navigationBarHidden(true)
        
    
        }
    }

struct CarPin: View {
    var body: some View {
        VStack (alignment:.center,spacing: 4){
            Image(systemName: "car.fill")
                .frame(width: 48, height: 32,alignment: .center)
                .background(Color.red)
                .foregroundColor(Color.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text("Mach Five")
                .fontWeight(.medium)
                .padding(.horizontal, 4)
                .padding(.vertical ,4 )
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style:.continuous))
                .overlay(RoundedRectangle(cornerRadius: 8,style: .continuous).stroke(Color.black.opacity(0.1),lineWidth: 1))
        }
    }
}


#Preview {
     LocationView()
}

struct CarLocationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            VStack (alignment: .leading,spacing: 20){
                VStack(alignment:.leading,spacing: 10) {
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity,alignment: .leading)
                    Label("20 W 34th St, New York, NY 10001" ,
                          systemImage: "location.fill")
                    .font(.footnote)
                    .opacity(0.5)
                    
                }
           
                VStack(alignment:.leading,spacing: 10) {
                    Text("Summon")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity,alignment: .leading)
                 Text("Press and hold controls to move vehicle ")
                        .opacity(0.5)
                        .font(.footnote)
                    CustomDivider()
                    FullButton(text: "Go to Target ")
                    HStack {
                        FullButton(text: "Forward" , icon: "arrow.up")
                        FullButton(text: "Backward" , icon: "arrow.down")

                    }
                }
                
                
                
                
            }
            
            
            
            .padding()
            .frame(maxWidth:.infinity)
            .background(Color.black)
            .foregroundColor(Color.white)
        }
    }
}
