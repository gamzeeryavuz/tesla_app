//
//  CarControlsView.swift
//  TeslaApp
//
//  Created by Gamze Eryavuz on 18.06.2025.
//

import SwiftUI

let carControls: [ActionItem] = [
    ActionItem(icon: "flashlight.on.fill", text: "Flash"),
    ActionItem(icon: "speaker.wave.3.fill", text: "Honk"),
    ActionItem(icon: "key.fill", text: "Start"),
    ActionItem(icon: "arrow.up.bin", text: "Front"),
    ActionItem(icon: "arrow.up.square", text: "Trunk")
]
struct CarControlsView: View {
    @Environment(\.presentationMode) var presentationMode
        @State  var toggleValet: Bool = false
    var body: some View {
     
            
            ZStack {
                ScrollView {
                    VStack{
                       
                        VStack(alignment: .leading ,spacing: 10) {
                            HStack {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                 }) {
                                    
                                    GeneralButton(icon: "chevron.left")
                                }
                                Spacer()
                            }
                            Text("Car Controls")
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            
                        }
                      
                        CustomDivider()
                        
                        CarLockButton()
                        CustomDivider()
                        CarControlAction()
                        CustomDivider()
                        HStack {
                            Text("Valet Mode")
                                .font(.headline)
                            Spacer()
                            Toggle("", isOn: $toggleValet)
                                .labelsHidden()
                        }
                        .padding(.vertical)

                        if toggleValet {
                            Text("Valet Mode is ON")
                                .font(.footnote)
                                .foregroundColor(.green)
                                .transition(.opacity)
                                .padding(.bottom, 8)
                        }
                    } .padding()
                    
                }
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(Color.white)
            .navigationTitle("Gamze's Tesla ")
            .navigationBarHidden(true)
            
        
        
    }
}

#Preview {
    CarControlsView()
}

struct CarLockButton: View {
    var body: some View {
        Button(action: {} ){
            FullButton(text: "Unlock Car", icon: "lock.fill")
            
            
        }
    }
}
    
    
    struct CarControlAction: View {
        var body: some View {
            VStack (spacing:20){
                
                
                HStack {
                    Spacer()
                    ActionButton(item: carControls[0])
                    Spacer()
                    ActionButton(item: carControls[1])
                    Spacer()
                    ActionButton(item: carControls[2])
                    
                }
                HStack {
                    Spacer()
                    ActionButton(item: carControls[3])
                    Spacer()
                    ActionButton(item: carControls[4])
                    Spacer()
                }
            }
            .padding()
        }
    }

