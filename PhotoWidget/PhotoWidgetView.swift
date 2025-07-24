//
//  PhotoWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import SwiftUI
import WidgetKit

struct PhotoWidgetView: View {
    
    var entry: PhotoWidgetEntry
    
    var body: some View {
        let path = entry.imageUrl
        
        NetworkImageView(url: URL(string: path)!)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
