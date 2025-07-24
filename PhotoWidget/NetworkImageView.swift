//
//  NetworkImageView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import SwiftUI

struct NetworkImageView: View {
    
    let url : URL
    
    var body: some View {
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "person")
        }
    }
}
