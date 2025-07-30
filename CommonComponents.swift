//
//  CommonComponents.swift
//  TeslaApp
//
//  Created by Gamze Eryavuz on 3.07.2025.
//

import Foundation
import SwiftUI

struct GeneralButton: View {
    
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.05))
            .foregroundColor(Color.gray)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle()
                .stroke(Color.white.opacity(0.1),lineWidth: 0.5))
        
    }
}


struct CustomDivider: View{
    var body: some  View{
        Rectangle()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ )
            .frame(height: 0.6)
            .background(Color.white)
            .opacity(0.1)
        
    }
}



struct ActionItem: Hashable{
    var icon: String
    var text: String
    
    
}

struct FullButton: View {
    var text: String
    var icon: String = ""
    
    var body: some View {
        if icon.isEmpty {
            textButton
        } else {
            iconButton
            
        }
    }
    
    var iconButton:  some View {
        Label(text, systemImage: icon)
            .font(.system(size:14 , weight: .medium,design: .default))
            .frame(maxWidth:.infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14,style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 14, style:.continuous)
                .stroke(Color.white.opacity(0.1),lineWidth: 0.5)
            )
        
    }
    var textButton: some View {
        Text(text)
            .font(.system(size: 14, weight: .medium, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style:.continuous))
            .overlay( RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.white.opacity(0.1),lineWidth: 0.5)
                      
            )
    }
}
