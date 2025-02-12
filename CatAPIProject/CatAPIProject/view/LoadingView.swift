//
//  LoadingView.swift
//  LoadingView
//  Created by Karishma Patil on 16.10.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("😸")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the movies ...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
