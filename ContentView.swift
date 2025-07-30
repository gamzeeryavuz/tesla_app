//
//  ContentView.swift
//  TeslaApp
//
//  Created by Gamze Eryavuz on 2.06.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var openVoiceCommand = false
    
    @State private var openMediaControls = false
    
    @State private var openCharging = false
    
    @State private var actionText = ""
    @State private var actionIcon = ""
    @State private var openAction = false
    
    
    
    
    var body: some View {
        NavigationView {
            
            
            ZStack {
                ScrollView {
                    VStack{
                        HomeHeader()
                        CustomDivider()
                        CarSection(openCharging: $openCharging)
                        CustomDivider()
                        CategoryView(openAction: $openAction,
                                     actionText: $actionText ,
                                     actionIcon: $actionIcon ,
                                     openCharging: $openCharging,
                                     openMedia: $openMediaControls,
                                     title: "Quick Shortcuts", showEdit: true ,actionItem: quickShortcuts)
                        CustomDivider()
                        CategoryView(openAction: $openAction,
                                     actionText: $actionText ,
                                     actionIcon: $actionIcon ,
                                     openCharging: $openCharging,
                                     openMedia: $openMediaControls,
                                     title: "Recent Action", showEdit: true ,actionItem: recentActions)
                        CustomDivider()
                        AllSettings()
                        ReorderButton()
                        
                        
                        
                    } .padding()
                    
                }
                VoiceCommandButton(open: $openVoiceCommand)
                
                if(openVoiceCommand || openCharging || openMediaControls || openAction) {
                    
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation{
                                openVoiceCommand = false
                                openCharging = false
                                openMediaControls = false
                                openAction = false
                                
                                
                            }
                            
                        }
                }
                
                if openVoiceCommand {
                    VoiceCommandView(open: $openVoiceCommand, text: "Take me to Olive Garden ")
                        .zIndex(1)
                        .transition(.move(edge: .bottom ))
                    
                }
                
                if openCharging {
                    ChargingView()
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                    
                }
                
                if openMediaControls {
                    MediaPlayer()
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
                
                
                if openAction && !actionText.isEmpty {
                    ActionNotification(open: $openAction, icon:actionIcon, text: actionText)
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                    
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(Color.white)
            .navigationTitle("Gamze's Tesla ")
            .navigationBarHidden(true)
            
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
        static var previews: some View
        {
            ContentView()
        }
    }

struct VoiceCommandButton: View {
    
    
    @Binding var open: Bool
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation{ open = true }
                    
                }) {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold , design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("Green"))
                        .foregroundColor(Color.gray)
                        .clipShape(Circle())
                        .padding()
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    
    
  }
 
struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                Text("Model 3 ".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical,4)
                    .padding(.horizontal,8)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .clipShape(Capsule())
                
                Text("Gamze's Tesla ")
                    .font(.largeTitle)
                    .fontWeight(.semibold )
                
            }
            Spacer()
            HStack {
                Button(action: {}) {
                    GeneralButton(icon: "lock.fill")
                }
                Button(action: {}) {
                    GeneralButton(icon: "gear")
                }
                
            
            }
        } .padding(.top)


    
}
    }




struct CarSection: View {
    
    @Binding var openCharging: Bool
    

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        openCharging = true
                    }
                } )
                {
                    Label("237 miles".uppercased(), systemImage: "battery.75")
                        .font(.system(size: 16 , weight: .semibold, design: .rounded))
                        .foregroundColor(Color.green)
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                    Text("Last updated: 5 min ago ")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                }
                
            }
            Image("tesla")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
    }
    
}
struct  CategoryHeader: View {
    
    var title: String
    var showEdit: Bool = false
    
    var body: some View {
        VStack{
            HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                if showEdit {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Edit")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                        
                    }
                }
            }
        
    
               
                
                
            }
        }
}

struct CategoryView: View {
    @Binding var openAction: Bool
    @Binding var actionText: String
    @Binding var actionIcon: String
    
    @Binding var openCharging: Bool
    @Binding var openMedia: Bool
    
    var title: String
    var showEdit: Bool = false
    var actionItem: [ActionItem]
    
    var body: some View {
        VStack {
            CategoryHeader(title: title, showEdit: showEdit)
            ScrollView(.horizontal, showsIndicators: false){
                HStack (alignment:.top){
                    if title == "Quick Shortcuts" 
                    {
                        Button(action: { withAnimation {
                            openCharging = true
                        }})  {
                            ActionButton(item: chargingShortcut)

                        }
                        Button(action: {withAnimation {
                            openMedia = true
                        }}) {
                            ActionButton(item: mediaShortcut)

                        }
                        
                    }
                    
                    ForEach(actionItem,id:\.self)  {
                        item in
                        
                        Button(action: {
                            withAnimation {
                                openAction = true
                                actionText = item.text
                                actionIcon = item.icon
                                
                            }
                            
                        }) {
                            ActionButton(item: item)
                        }
                    }
                }
                

            }
        }
        
    }
}


struct ActionButton: View {
    
    var item: ActionItem
    
    
    var body: some View {
        VStack(alignment: .center){
            GeneralButton(icon: item.icon)
            Text(item.text)
                .frame(width: 72)
                .font(.system(size:12, weight: .semibold,design: .default))
                .multilineTextAlignment(.center)
        }
    }
}



let quickShortcuts: [ActionItem] = [
    ActionItem(icon: "fanblades.fill", text: "Fan On"),
    ActionItem(icon: "bolt.car", text: "Close Charge Port") ,
    
]
let chargingShortcut =     ActionItem(icon: "bolt.fill", text: "Charging")
let mediaShortcut =    ActionItem(icon: "music.note", text: "Media Controls")



let recentActions: [ActionItem] = [
    ActionItem(icon: "arrow.up.square", text: "Open Trunk ") ,
    ActionItem(icon: "fanblades", text: "Fan Off"),
    ActionItem(icon: "person.fill.viewfinder", text: "Summon"),

]

struct AllSettings: View{
    var body: some View {
        VStack {
            CategoryHeader(title: "All Settings ")
            
            LazyVGrid(columns: [GridItem(.fixed(170)),GridItem(.fixed(170))]) {
                NavigationLink(destination: CarControlsView()) {  SettingBlock(icon: "car.fill", title: "Controls",subtitle: "car locked")
                }
                
                NavigationLink(destination: CarControlsView()) {
                    
                    SettingBlock(icon: "fanblades.fill", title: "Climate", subtitle: "Interior 68° F") }
                
                
          
                NavigationLink(destination: LocationView()) {
                    SettingBlock(icon: "location.fill", title: "Location",subtitle: "EMPIRE STATE BUILDING") }
                
                SettingBlock(icon: "checkerboard.shield", title: "Security" , subtitle: "0 EVENTS DETECTED")
                SettingBlock(icon: "sparkles", title: "upgrades",subtitle: "3 upgrades available" )
                
                
                
                
            }
        }
    }
}
 
struct SettingBlock: View {
    
    var icon: String
    var title: String
    var subtitle: String
    
    var hasSubtitle: Bool = false
    var backgroundColor: Color = Color.white.opacity(0.05)
    
    
    var body: some View {
        HStack (alignment: .center,spacing: 0) {
            Image(systemName: icon)
            VStack (alignment: .leading,spacing: 4){
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 16,weight: .medium,design: .default))
             
                    Text(subtitle.uppercased())
                        .font(.system(size: 7, weight: .medium,design: .default))
                        .frame(maxWidth: .infinity,alignment: .leading)
                
                        .lineLimit(1)
                    
                
                
                
            
            }
            .padding(.leading,5)
            
            Spacer()
            Image(systemName: "chevron.right")
            
        }
        .padding(.horizontal,8)
        .padding(.vertical,16)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke( Color.white.opacity(0.1),lineWidth:0.5))
        
    }
}

struct ReorderButton: View {
    var body: some View {
        Button(action:{}){
            
            
            
            Text("Reorder Groups")
                .font(.caption)
                .padding(.vertical, 8 )
                .padding(.horizontal,14)
                .background(Color.white.opacity(0.05))
                .clipShape(Capsule())
        }
        
        
    }
}
