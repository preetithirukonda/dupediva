//
//  test.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/3/24.
//

import Foundation
import SwiftUI
import UIKit

struct TestView: View{
    
    @State private var showSheet: Bool = false
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    @State var isCamShowing = false
    @State var selectedImageCam: UIImage?
   
    
  
    var body: some View{
        // Text("test class")
        NavigationStack{
            VStack{
                if let image = selectedImage{
                    Image(uiImage: image).resizable()
                        .frame(width:200, height:200)
                }
                
               // if selectedImage != nil{
               //     Image(uiImage: selectedImage!).resizable()
               //         .frame(width:200, height:200)
               // }
                if selectedImageCam != nil{
                    Image(uiImage: selectedImageCam!).resizable()
                        .frame(width:200, height:200)
                }
                
               
                //picker
                Button{
                    isPickerShowing = true
                }label:{
                    Text("select a photo")
                }.buttonStyle(.borderedProminent)
                    .sheet(isPresented: $isPickerShowing, onDismiss: nil){
                        //image picker
                        ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                    }
                //camera
                Button{
                    isCamShowing = true
                }label:{
                    Text("take a photo")
                }.buttonStyle(.borderedProminent)
                    .sheet(isPresented: $isCamShowing, onDismiss: nil){
                        //image cam
                        ImageCam(selectedImageCam: $selectedImageCam, isCamShowing: $isCamShowing)
                    }
                
                NavigationLink("Click here", destination: OtherView())
                //test button
                Button(
                    action:{
                        
                        print("test")
                        showSheet.toggle()
                    },
                    label:{
                        Text("test button")
                    }
                ).buttonStyle(.borderedProminent) .sheet(isPresented: $showSheet){
                    SheetView()
                }
                
                
              }
          
            
            
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
        TestView()
    }
}
