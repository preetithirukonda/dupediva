//
//  test.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/3/24.
//

import Foundation
import SwiftUI

struct LandingView: View{
    
    @State private var showSheet: Bool = false
    
    var body: some View{
        // Text("test class")
        NavigationStack{
            
            Button(
                action:{
                    performAPICall()
                    showSheet.toggle()
                },
                label:{
                    Text("API button")
                }
            ).buttonStyle(.borderedProminent) .sheet(isPresented: $showSheet){
                SheetView()
            }
            
            NavigationLink("Click here", destination: OtherView())
        }
    }}


struct SheetView: View{
    
    @State var string:String = ""
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    TextField("search for image", text: $string ).textFieldStyle(.roundedBorder)
                }.padding()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider{
    static var previews: some View{
        LandingView()
    }
}