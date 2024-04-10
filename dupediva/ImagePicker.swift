//
//  ImagePicker.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/8/24.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator//obj that recieves uiimagepickercontroller events
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
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
