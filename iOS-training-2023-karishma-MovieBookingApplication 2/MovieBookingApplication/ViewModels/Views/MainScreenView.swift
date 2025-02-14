//
//  MainScreenView.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 05/04/23.
//

import Foundation
import SwiftUI

struct MainScreenView: View {
    var body: some View {
        HStack {
            TabView {
                HomeScreenView(viewModel: HomeScreenViewModel()).tabItem{
                    Image(systemName: "homekit")
                }
                SelectSeatView(totalSeats: 20).tabItem{
                   Image(systemName: "bookmark.circle")
                }
                ProfileView().tabItem{
                    Image(systemName: "person.circle")
                }
            }
        }
    }
}

