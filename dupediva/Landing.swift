//
//  test.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/3/24.
//

import Foundation
import SwiftUI
import UIKit

public var isPickerShowing = false


struct LandingView: View{
    @State private var showSheet: Bool = false
    @State public var isPickerShowing = false
    @State public var selectedImage: UIImage?
    @State var isAPIButtonPressed: Bool = false
    @State var isCamShowing = false
    
//    @State private var selectedImage: UIImage?
//       @State private var isPickerShowing = false
//       @State private var isCamShowing = false
//       @State private var isSheetShowing = false
    
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
                            .frame(width: 300, height: 400)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.purple, lineWidth: 4))
                            
                            .frame(width:300, height:400)
                        //api button
                        
                        
                        Button(action: {
                    //navigateToStoryboardView()
                            NavigationLink("link", destination: SearchView())
                         }) {
                           Text("Search for Similar Products!")
                          }
                          .buttonStyle(PurpleButtonStyle())
                        
//                        Button(action: {
//                            print("button tapped")
//                            
//                            //let _ = performAPICall(selectedImage: $selectedImage)
//                            //performAPICall()
//                        },
//                               label: {
//                            NavigationLink(destination: SearchView()) {
//                                Text("Search for Similar Products!")
//                                
//                            }.buttonStyle(PurpleButtonStyle())
//                        })
                        
                        
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
    
//    private func navigateToStoryboardView() {
//            // Load the storyboard file
//        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
//
//        // Attempt to instantiate the view controller with the specified identifier
//        // Attempt to instantiate the view controller with the specified identifier
//        if let viewController = storyboard.instantiateViewController(withIdentifier: "MyViewController") as? StoryboardView {
//            // Use the view controller here
//        } else {
//            print("Unable to instantiate view controller from storyboard.")
//        }
//            
//            // Present the view controller
//            UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)
//        }
}

struct SearchView: View{
    
    var body: some View{
        Text("Search view")
        //  print("in second view")
        //  Text(str)
        Button{
            
        }label: {
            Text("hi")
            //Text(ImagePicker(selectedImage: LandingView().$selectedImage, isPickerShowing: LandingView().$isPickerShowing).APIrequest());
        }
        //let _ = performAPICall(selectedImage: $selectedImage)
        
        
        
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

struct StoryboardWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StoryboardView") as? StoryboardView else {
            fatalError("StoryboardView not implemented in storyboard")
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // update code
    }
}
