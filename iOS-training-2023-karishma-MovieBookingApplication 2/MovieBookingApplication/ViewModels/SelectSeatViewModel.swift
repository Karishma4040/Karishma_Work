//
//  SelectSeatViewModel.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import Foundation
import SwiftUI

struct Seat: Identifiable {
    let id: Int
    var isBooked: Bool
}
//MARK: - variables
class SelectSeatViewModel: ObservableObject {
    @Published var time1: Bool = false
    @Published var time2: Bool = false
    @Published var time3: Bool = false
    @Published var time4: Bool = false
    @Published var date = Date()
    @Published var selectedButtonIndex: Int = 0
    @Published var seats: [Seat] = []
    @Published var bookTicket: Bool = false
    @Published var showAlert: Bool = false

    //MARK: - function
init(totalSeats: Int) {
        seats = (1...totalSeats).map { Seat(id: $0, isBooked: false) }
    }

    func bookSeat(seat: Seat) {
        if let index = seats.firstIndex(where: { $0.id == seat.id }) {
            seats[index].isBooked = true
        }
    }

    func unbookSeat(seat: Seat) {
        if let index = seats.firstIndex(where: { $0.id == seat.id }) {
            seats[index].isBooked = false
        }
    }
    
}
    


        
