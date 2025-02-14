//
//  ProfileView.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack{
                Text("WELCOME TO THE MOVIE TICKET BOOKING APP BY KARISHMA")
                    .font(.largeTitle)
                    .foregroundColor(.brown)
                    .bold()
            }
            HStack{ Image("PHOTO 2")
                    .resizable()
                    .frame(width: 200,height: 250)
                    .cornerRadius(70)
            }
            HStack {
                Text("KARISHMA PATIL")
            }
        }
    }
}
