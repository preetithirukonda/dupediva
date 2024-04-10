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
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    @State var isCamShowing = false
    
    
    var body: some View{
        // Text("test class")
        NavigationStack{
            VStack{
                //selected image
                if let image = selectedImage{
                    VStack{

                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.purple, lineWidth: 4))
                            .frame(width:300, height:400)
                        //api button
                        Button(
                            action:{
                                performAPICall()
                                showSheet.toggle()
                            },
                            label:{
                                Text("Search for Similar Products(API button)")
                            }
                        ).buttonStyle(PurpleButtonStyle())
                    }
                }else{
                    //upload and camera buttons
                    
                    HStack{
                        Button{
                            isPickerShowing = true
                        }label:{
                            Text("Select a Photo").foregroundColor(Color.white)
                        }.buttonStyle(PurpleButtonStyle())
                            .sheet(isPresented: $isPickerShowing, onDismiss: nil){
                                //image picker
                                ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                            }
                        //camera
                        Button{
                            isCamShowing = true
                        }label:{
                            Text("Take a Photo")
                        }.buttonStyle(PurpleButtonStyle())
                            .sheet(isPresented: $isCamShowing, onDismiss: nil){
                                //image cam
                                ImageCam(selectedImage: $selectedImage, isCamShowing: $isCamShowing)
                            }
                    }.padding()
                    
                    NavigationLink("Click here", destination: OtherView()).buttonStyle(PurpleButtonStyle())
                    
                    //login button
                    Button(
                        action:{
                            
                            print("test")
                            showSheet.toggle()
                      
                        },
                        label:{
                            Text("Login")
                        }
                    ).buttonStyle(PurpleButtonStyle()) .sheet(isPresented: $showSheet){
                        SheetView(isSheetShowing: $showSheet)
                    }
                }
               
                
              
            }
        }
    }
}

//struct SearchView: View{
//    var body: some View{}}


struct SheetView: View{
    
    @State var username:String = ""
    @State var password:String = ""
    @Binding var isSheetShowing: Bool
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Username:")
                        TextField("Enter Username or Email", text: $username ).textFieldStyle(.roundedBorder)
                    }.padding()
                    HStack{
                        Text("Password:")
                        TextField("Enter Password", text: $password ).textFieldStyle(.roundedBorder)
                    }.padding()
                    
                    Button(
                        action:{
                            
                            print("test")
                            isSheetShowing = false
                        },
                        label:{
                            Text("Login")
                        }
                    ).buttonStyle(PurpleButtonStyle())
                    
                }
                
            }
        }
    }
}

struct TestView_Previews: PreviewProvider{
    static var previews: some View{
        LandingView()
    }
}



struct PurpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}
