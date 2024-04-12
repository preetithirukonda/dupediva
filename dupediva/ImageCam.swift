//
//  Camera.swift
//  cameratest
//
//  Created by Preeti Thirukonda on 4/9/24.
//
//

import Foundation
import UIKit
import SwiftUI
import GoogleGenerativeAI

struct ImageCam: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage?
    @Binding var isCamShowing: Bool
    
    func APIrequest() -> Void {
        let model = GenerativeModel(name: "gemini-pro-vision", apiKey: "AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4")
        let prompt = "What is this piece of clothing? Please include color, material, type of clothing and exclude brand name."
        let i = selectedImage!
        Task{
            let response = try await model.generateContent(prompt, i)
            let r = response.text?.components(separatedBy: "text")
            let r2 = r![0]
            print(r2)
            
            let u2 = "https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=" + r2;
            let url = URL(string: u2)!
            var request = URLRequest(url: url)
            let task2 = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                } else if let data = data {
                    
                    let str = String(data: data, encoding: .utf8)!
                    print(str)
                    
                }
                
            }
            task2.resume()
        }
        
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator//obj that recieves uiimagepickercontroller events
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator2 {
        return Coordinator2(self)
    }
}

class Coordinator2: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var parent:ImageCam
    init(_ picker:ImageCam){
        self.parent = picker
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //run the code when the user has selected an image
        print("image taken")
        if let image =   info[.originalImage] as? UIImage{
            //we got the image
            DispatchQueue.main.async{
                self.parent.selectedImage = image
                self.parent.isCamShowing = false //dismissing camera
                //self.parent.APIrequest()
            }
        }
      
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //run code when the user has cancelled the picker UI
        print("cancelled cam")
        
        
        parent.isCamShowing = false //dismissing camera
    }
}




