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

struct ImageCam: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage?
    @Binding var isCamShowing: Bool
    
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
            }
        }
      
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //run code when the user has cancelled the picker UI
        print("cancelled cam")
        
        
        parent.isCamShowing = false //dismissing camera
    }
}




