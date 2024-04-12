//
//  test.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/3/24.
//

import Foundation
import SwiftUI

public var isPickerShowing = false


struct LandingView: View{
    @State private var showSheet: Bool = false
    @State public var isPickerShowing = false
    @State public var selectedImage: UIImage?
    @State var isAPIButtonPressed: Bool = false
    @State var isCamShowing = false
    @State var productList: [Product] =  [Product(title: "", img: "", link: "", price: "")]
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
                            // ImagePicker.APIrequest()
                            //let _ = performAPICall(selectedImage: $selectedImage)
                            //performAPICall()
                        },
                               label: {
                            NavigationLink(destination: SearchView()) {
                                Text("Search for Similar Products!")
                                
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
                                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, productList: $productList)
                                }
                            //camera
                            Button{
                                isCamShowing = true
                            }label:{
                                Text("Retake Photo")
                            }.buttonStyle(PurpleButtonStyle())
                                .sheet(isPresented: $isCamShowing, onDismiss: nil){
                                    //image cam
                                    ImageCam(selectedImage: $selectedImage, isCamShowing: $isCamShowing, productList: $productList)
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
                                ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, productList: $productList)
                            }
                        //camera
                        Button{
                            isCamShowing = true
                        }label:{
                            Text("Take a Photo")
                        }.buttonStyle(PurpleButtonStyle())
                            .sheet(isPresented: $isCamShowing, onDismiss: nil){
                                //image cam
                                ImageCam(selectedImage: $selectedImage, isCamShowing: $isCamShowing, productList: $productList)
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

//this is the page that has all the similar products
struct SearchView: View{
    
    var body: some View{
        // var img1: UIImage
        VStack{
            Text("Search view")
            var image: UIImage? = displayImg(url: "HI")
            if let img = image {
                Image(uiImage: img)
            } else {
                Text("Loading image...")
            }
        }
        
        //  print("in second view")
        //  Text(str)
        //        Button{
        //        }label: {
        //            Text("hi")
        //Text(ImagePicker(selectedImage: LandingView().$selectedImage, isPickerShowing: LandingView().$isPickerShowing).APIrequest());
        //        }
        //let _ = performAPICall(selectedImage: $selectedImage)
        
        
        
        
        
    }
}

func displayImg(url: String) -> UIImage{
    var image: UIImage
    image = UIImage()
    
    let catPictureURL = URL(string: "http://i.imgur.com/w5rkSIj.jpg")!
    // Creating a session object with the default configuration.
    // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
    let session = URLSession(configuration: .default)
    
    // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
    let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
        // The download has finished.
        if let e = error {
            print("Error downloading cat picture: \(e)")
        } else {
            // No errors found.
            // It would be weird if we didn't have a response, so check for that too.
            if let res = response as? HTTPURLResponse {
                print("Downloaded cat picture with response code \(res.statusCode)")
                if let imageData = data {
                    // Finally convert that Data into an image and do what you wish with it.
                    let image = UIImage(data: imageData)
                    print("image data worked")
                    // Do something with your image.
                } else {
                    print("Couldn't get image: Image is nil")
                }
            } else {
                print("Couldn't get response code for some reason")
            }
        }
    }
    
    downloadPicTask.resume()
    
    return image
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
        //   var list:[Product] = [Product(title: "", img: "", link: "", price: -1)]
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
