//
//  Product.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/11/24.
//

import Foundation
import UIKit
import SDWebImage

class Product{
    
    let title: String
    let img: String
    let link: String
    let price: String
    
    init(title: String, img: String, link: String, price: String) {
        self.title = title
        self.img = img
        self.link = link
        self.price = price
    }
    
    func toDouble(str:String) -> Double{
        var doubleValue = Double(str) ?? -1.0
        //else {
        //print("Invalid input")
        // return -1
        // }
        
        
        
        //  return doubleValue = Double(str!) ?? -1.0
        
        return doubleValue
        
        // return doubleValue
        return -1
    }
    
    
    func getTitle() -> String{
        return title
    }
    func getImg() -> String{
        return img
    }
    func getLink() -> String{
        return link
    }
    func getPrice() -> String{
        return price
    }
    func toString() -> String{
        return "Title: ["+title+"], Image Link: ["+img+"], Product Link: ["+link+"], Price: ["+price+"]"
    }
}

class ProductList{
    var productList: [Product]
    
    init(productList: [Product]) {
        self.productList = productList
    }
    
    func getProduct(index: Int) -> Product{
        return productList[index]
    }
    
    static func parse(str: String) -> [Product]{
        var products: [Product]  =  [Product(title: "", img: "", link: "", price: "")]
        let split = str.components(separatedBy: "\"shopping_results\"")
      //  print(split[1])
        //   print("\n\n\n")
        //should be 2 elements
        // print(split.count)
        //  print("\n\n\n")
        //we need the last of the three elements
        //    print(split[1])
        //      print("\n\n\n")
        
        // products = list of products with all the extra characters and info
        let productsSplit = split[1].components(separatedBy: "},\n    {")
      //  print(productsSplit[1])
        //   print(products.count) //61
        //   print(products[0]) //index out of range
        //     print(products[1])
        //     print("\n\n\n")
        for p in productsSplit{
            //each product with all the extra characters separated by line
        //    print(p)
            let productI = p.components(separatedBy: CharacterSet.newlines)
            let newProduct = initProductI(productI: productI)
            products.append(newProduct)
        }
        return products
        
        //   print(productI)
        
    }
    static func initProductI(productI: [String]) -> Product{
        
        var newTitle: String = ""
        var newImg: String = ""
        var newLink: String = ""
        var newPrice: String  = ""
   //     var priceStr: String = ""
        
        //     let endCount = productI.count - 1
        //  let startCount = 0
        
        
        
        for s in productI {
            if s.contains("title"){
                // newTitle = s
                let startIndex = s.index(s.startIndex, offsetBy: 16)
                let endIndex = s.index(s.endIndex, offsetBy: -2)
                newTitle = String(s[startIndex..<endIndex])
            } else if s.contains("\"price\""){
                let startIndex = s.index(s.startIndex, offsetBy: 16)
                let endIndex = s.index(s.endIndex, offsetBy: -2)
                newPrice = String(s[startIndex..<endIndex])
                // priceStr = s
            }else if s.contains("link") && !s.contains("product_link"){
                let startIndex = s.index(s.startIndex, offsetBy: 15)
                let endIndex = s.index(s.endIndex, offsetBy: -2)
                newLink = String(s[startIndex..<endIndex])
                // newLink = s
            }else if s.contains("thumbnail"){
                let startIndex = s.index(s.startIndex, offsetBy: 20)
                let endIndex = s.index(s.endIndex, offsetBy: -2)
                newImg = String(s[startIndex..<endIndex])
                //                imageView.sd_setImage(with: URL(string: newImg), placeholderImage: UIImage(named: "placeholder.png"))
         //       let imageUrlString = "http://cdn.playbuzz.com/cdn/38402fff-32a3-4e78-a532-41f3a54d04b9/cc513a85-8765-48a5-8481-98740cc6ccdc.jpg"
                
         //       let imageUrl = URL(string: imageUrlString)!
                
         //       let imageData = try! Data(contentsOf: imageUrl)
                
            //    let image = UIImage(data: imageData)
                //newImg = s
                
                
                
                //
               // newPrice = ""//priceStr.toDouble()!
            }
        }
            
            return Product(title: newTitle, img: newImg, link: newLink, price: newPrice)
            //        return newTitle+"\n\n"+newImg+"\n\n"+newLink+"\n\n"+priceStr
            
        }
        
        //    func initProductIOLD(productI: [String]) -> Product{
        //        var newTitle: String = ""
        //        var newImg: String = ""
        //        var newLink: String = ""
        //        var newPrice: Double  = -1
        //        var priceStr: String
        //
        //        let endCount = productI.count - 1
        //        let startCount = 0
        //
        //
        //        //  let titleSubstr = newTitle[]
        //        for s in productI {
        //            if s.contains("title"){
        //                newTitle = s
        //            } else if s.contains("extracted_price"){
        //                priceStr = s
        //            }else if s.contains("link") && !s.contains("product_link"){
        //                newLink = s
        //            }else if s.contains("thumbnail"){
        //                newImg = s
        //            }
        //        }
        //
        //        return Product(title: newTitle, img: newImg, link: newLink, price: newPrice)
        //
        //    }
        
    }
    
    
    //let split = str.components(separatedBy: "\"shopping_results\"")
    //print("\n\n\n")
    ////should be 3 elements
    //print(split.count)
    //print("\n\n\n")
    ////we need the last of the three elements
    //print(split[1])
    //print("\n\n\n")
    //let products = split[1].components(separatedBy: "},\n    {")
    //print(products.count) //61
    //print(products[0]) //index out of range
    //print(products[1])
    //print("\n\n\n")
    //let productI = products[1].components(separatedBy: CharacterSet.newlines)
    ////    print(productI)
    //for p in productI{
    //    print(p)
    //    print("\n")
    //}
//    extension String {
//        func toDouble() -> Double? {
//            return NumberFormatter().number(from: self)?.doubleValue
//        }
//    }
    

