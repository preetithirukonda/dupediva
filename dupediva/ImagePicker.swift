
//
//  ImagePicker.swift
//  cameratest
//
//  Created by Preeti Thirukonda on 4/9/24.
//
//

import Foundation
import UIKit
import SwiftUI
import GoogleGenerativeAI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    @Binding var productList: [Product]
    //  @Binding var donePicking: Bool
    
    public func APIrequest() -> Void {
        let model = GenerativeModel(name: "gemini-pro-vision", apiKey: "AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4")
        let prompt = "What is this piece of clothing? Please include color, material, type of clothing and exclude brand name."
        let i = selectedImage!
        Task{
            let response = try await model.generateContent(prompt, i)
            let r = response.text?.components(separatedBy: "text")
            let r2 = r![0]
            print(r2)
            let model2 = GenerativeModel(name: "gemini-pro", apiKey: "AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4")
            let prompt2 = "In this sentence, what is the color named? " + r2
            let response2 = try await model2.generateContent(prompt2)
            let r3 = response2.text?.components(separatedBy: "text")
            // color of the piece of clothing!!
            let color = r3![0]
            print(color)
            let prompt3 = "In this sentence, what is the material named? " + r2
            let response3 = try await model2.generateContent(prompt3)
            let r4 = response3.text?.components(separatedBy: "text")
            // material of the piece of clothing!!
            let material = r4![0]
            print(material)
            
            let u2 = "https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=" + r2;
            let url = URL(string: u2)!
            let request = URLRequest(url: url)
            let task2 = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                } else if let data = data {
                    
                    let str = String(data: data, encoding: .utf8)!
                    //str has all the data in the "json file"
                    print(str)
                    print("\n\n\n\n\n")
                    productList =  ProductList.parse(str: str)
                    for p in productList{
                        print(p.toString())
                    }
                //    productList =  ProductList.parse(str: str)
                }
                
            }
            task2.resume()
        }
        
        
        
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator//obj that recieves uiimagepickercontroller events
        return imagePicker
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    //    public func performAPICall() -> Void {
    //        let model = GenerativeModel(name: "gemini-pro-vision", apiKey: "AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4")
    //        let image = getImage();
    //        let prompt = "What is this piece of clothing? Please include color, material, type of clothing and exclude brand name."
    //        Task{
    //            let response = try await model.generateContent(prompt, image)
    //            let r = response.text?.components(separatedBy: "text")
    //            let r2 = r![0]
    //            print(r2)
    //
    //            let u2 = "https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=" + r2;
    //            let url = URL(string: u2)!
    //            var request = URLRequest(url: url)
    //            let task2 = URLSession.shared.dataTask(with: request) { (data, response, error) in
    //                    if let error = error {
    //                        print(error)
    //                    } else if let data = data {
    //
    //                        let str = String(data: data, encoding: .utf8)!
    //                        print(str)
    //
    //                    }
    //
    //            }
    //            task2.resume()
    //        }
    //    }
    //
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var parent:ImagePicker
    init(_ picker:ImagePicker){
        self.parent = picker
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //run the code when the user has selected an image
        print("image selected")
        if let image =   info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            //we got the image
            DispatchQueue.main.async{
                self.parent.selectedImage = image
                //   self.parent.donePicking = true
                self.parent.APIrequest();
            }
        }
        //dismiss the picker
        parent.isPickerShowing = false
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //run code when the user has cancelled the picker UI
        print("cancelled")
        
        //dismiss the picker
        parent.isPickerShowing = false
    }
}
