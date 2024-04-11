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
    @State var isAPIButtonPressed: Bool = false
    @State var isCamShowing = false
    
    @State var str: String = ""
    
    
    var body: some View{
        // Text("test class")
        NavigationStack{
            VStack{
                //selected image
                if let image = selectedImage{
                    VStack{
                        
                        //selected image
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.purple, lineWidth: 4))
                            .frame(width:300, height:400)
                        //api button
                        
                        Button(action: {
                            print("button tapped")
                            //performAPICall()
                        },
                               label: {
                            NavigationLink(destination: SearchView()) {
                                Text("Search for Similar Products(API button)")
                                
                            }.buttonStyle(PurpleButtonStyle())
                        })
                        
                        
                        //start api button
                        //  Button(
                        //       action:{
                        //          print("button tapped 2")
                        //performAPICall()
                        //          showSheet.toggle()
                        //      },
                        //      label:{
                        //           Text("Search for Similar Products(API button)")
                        //       }
                        //      ).buttonStyle(PurpleButtonStyle())
                        //end api button
                        
                        //retake photo
                        HStack{
                            Button{
                                isPickerShowing = true
                            }label:{
                                Text("Reselect Photo").foregroundColor(Color.white)
                            }.buttonStyle(PurpleButtonStyle())
                                .sheet(isPresented: $isPickerShowing, onDismiss: nil){
                                    //image picker
                                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                                }
                            //camera
                            Button{
                                isCamShowing = true
                            }label:{
                                Text("Retake Photo")
                            }.buttonStyle(PurpleButtonStyle())
                                .sheet(isPresented: $isCamShowing, onDismiss: nil){
                                    //image cam
                                    ImageCam(selectedImage: $selectedImage, isCamShowing: $isCamShowing)
                                }
                        }.padding()
                        
                        
                        
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
                    
                    //   NavigationLink("Click here", destination: OtherView()).buttonStyle(PurpleButtonStyle())
                    
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

struct SearchView: View{
    //for the keywords, gemini will give us these
    @State var color:String = ""
    @State var material:String = ""
    @State var productType:String = ""
    
    //for each product (not needed here but j putting here for now)
    @State var price:Double = 0
    @State var link:String = ""
    @State var imgLink:String = ""
    @State var title:String = ""
    
    var body: some View{
        Text("Search view")
        //  print("in second view")
        //  Text(str)
        Button{
            print("search view")
        }label: {
            Text("hi")
        }
 //      let _ = performAPICall()
        
        //get the products from the json file - parse it
        //display each product?
        
        
        
        
        
    }
}


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
        
        
        
        
        //     .bold()
        //   .frame(width: 280, height: 50)
        // .background(Color.init(red: 0.818, green: 0.688, blue: 0.095))
        //.foregroundColor(.white)
        //.cornerRadius(10)
    }
}
