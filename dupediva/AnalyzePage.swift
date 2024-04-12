//////
//////  File.swift
//////  dupediva
//////
//////  Created by Vaishy Kumar on 4/8/24.
//////
////
//import Foundation
//import GoogleGenerativeAI
//import UIKit
//import SwiftUI
////
//func performAPICall() -> Void {
//    var img: UIImage
//    
//    let model = GenerativeModel(name: "gemini-pro-vision", apiKey: "AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4")
//    let prompt = "What is this piece of clothing? Please include color, material, type of clothing and exclude brand name."
//    let i = img
//        Task{
//            let response = try await model.generateContent(prompt, i)
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
//////    let inputurl = "https://lurkingclass.com/cdn/shop/products/1964BK_THORNS_SWEATER_LURKING_CLASS_BY_SKETCHY_TANK_02B_1024x1024.jpg?v=1643842749"
//////    //    let u1 = "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4"
//////    let u1 = "https://serpapi.com/search?engine=google_reverse_image&image_url=" + inputurl + "&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5"
//////    //let u2 = "https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=" + productname
//////    let url = URL(string: u1)!
//////    //
//////    //    //"https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=purple-sweater")!
//////    //
//////    //    //"https://serpapi.com/search?engine=google_reverse_image&image_url=https://i.imgur.com/5bGzZi7.jpg&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5"
//////    //
//////    var request = URLRequest(url: url)
//////    
//////    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//////        if let error = error {
//////            print(error)
//////        } else if let data = data {
//////            
//////            let str = String(data: data, encoding: .utf8)!
////            //print(str ?? "")
////            let model = GenerativeModel(name: "gemini-pro-vision", apiKey: "AIzaSyAsIZ7U934OKyFifKJPDJDdua4aJyPCqd4")
////            let image = getImage();
////            //let prompt = "Find the most specific response from this JSON file of API responses. I prefer a responses that includes color, material, type of clothing and please exclude brand name. " + str
////            let prompt = "What is this piece of clothing? Please include color, material, type of clothing and exclude brand name."
////            Task{
////                let response = try await model.generateContent(prompt, image)
////                let r = response.text?.components(separatedBy: "text")
////                let r2 = r![0]
////                print(r2)
////                
////                let u2 = "https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=" + r2;
////                let url = URL(string: u2)!
////                var request = URLRequest(url: url)
////                let task2 = URLSession.shared.dataTask(with: request) { (data, response, error) in
////                        if let error = error {
////                            print(error)
////                        } else if let data = data {
////                            
////                            let str = String(data: data, encoding: .utf8)!
////                            print(str)
////                            
////                        }
////                    
////                }
////                task2.resume()
////            }
////            
////        //}
////   // }
////   // task.resume()
////            
////            
////    }
////
////    
////



