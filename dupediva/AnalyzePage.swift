//
//  AnalyzePage.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/7/24.
//
//#if canImport(UIKit) && !os(macOS)
import UIKit

//import Foundation
//import Alamofire

class ViewController: UIViewController {
    
 //   let apiKey = "60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5"
  //  let searchQuery = "blue-floral-maxi-skirt"
    let apiUrl = "https://serpapi.com/search.json?engine=google_shopping&api_key=60096f2733c30de4c45e10637bdf2ba916af5e73ed563122b39f40e85bbcb5a5&q=purple-sweater"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        fetchPhotos()
    }
    func fetchPhotos(){
        guard let url = URL(string: apiUrl)else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            print("Got data!")
        }
        task.resume()
    }
    
 
    
}


//#endif
