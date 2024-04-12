//
//  Product.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/11/24.
//

import Foundation

class Product{
    
    let title: String
    let img: String
    let link: String
    let price: Double
    
    
    
    init(title: String, img: String, link: String, price: Double) {
        
        self.title = title
        self.img = img
        self.link = link
        self.price = price
        
    }
    
    
}

class ProductList{
    let products: [String]
    
    init(products: [String]) {
        self.products = products
    }
    
    static func parse(str: String) -> [Product]{
        let split = str.components(separatedBy: "\"shopping_results\"")
        print("\n\n\n")
        //should be 3 elements
        print(split.count)
        print("\n\n\n")
        //we need the last of the three elements
        print(split[1])
        print("\n\n\n")
        let products = split[1].components(separatedBy: "},\n    {")
        print(products.count) //61
        print(products[0]) //index out of range
        print(products[1])
        print("\n\n\n")
        let productI = products[1].components(separatedBy: CharacterSet.newlines)
        print(productI)
      
    }
    
    func initProductIOLD(productI: [String]) -> Product{
        var newTitle: String = ""
        var newImg: String = ""
        var newLink: String = ""
        var newPrice: Double  = -1
        var priceStr: String
        
        let endCount = productI.count - 1
        let startCount = 0
        
        
      //  let titleSubstr = newTitle[]
        for s in productI {
            if s.contains("title"){
                newTitle = s
            } else if s.contains("extracted_price"){
                priceStr = s
            }else if s.contains("link") && !s.contains("product_link"){
                newLink = s
            }else if s.contains("thumbnail"){
                newImg = s
            }
        }
        
        return Product(title: newTitle, img: newImg, link: newLink, price: newPrice)
        
    }
    
    func initProductI(productI: [String]) -> String{
          var newTitle: String = ""
          var newImg: String = ""
          var newLink: String = ""
          var newPrice: Double  = -1
          var priceStr: String = ""
          
          let endCount = productI.count - 1
          let startCount = 0
          
          
          
          for s in productI {
              if s.contains("title"){
                  // newTitle = s
                  let startIndex = s.index(s.startIndex, offsetBy: 16)
                  let endIndex = s.index(s.endIndex, offsetBy: -2)
                  newTitle = String(s[startIndex..<endIndex])
              } else if s.contains("extracted_price"){
                  let startIndex = s.index(s.startIndex, offsetBy: 19)
                  let endIndex = s.index(s.endIndex, offsetBy: -2)
                  priceStr = String(s[startIndex..<endIndex])
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
                  //newImg = s
              }
          }
          
          newPrice = priceStr.toDouble()!
          return newTitle+"\n\n"+newImg+"\n\n"+newLink+"\n\n"+priceStr
          
      }

    
    
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
extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

