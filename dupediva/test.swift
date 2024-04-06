//
//  test.swift
//  dupediva
//
//  Created by Preeti Thirukonda on 4/3/24.
//

import Foundation
import SwiftUI

struct TestView: View{
    var body: some View{
       // Text("test class")
        
        Button(action: {
            // What to perform
            print("test")
        }) {
            // How the button looks like
            Text("test button")
        }
    }
}


struct TestView_Previews: PreviewProvider{
    static var previews: some View{
        TestView()
    }
}
