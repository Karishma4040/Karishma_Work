//
//  SelectSeatView.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import SwiftUI
struct SelectSeatView: View {
    init(totalSeats: Int) {
        _viewModel = ObservedObject(wrappedValue: SelectSeatViewModel(totalSeats: totalSeats))
    }
    
    @ObservedObject var viewModel: SelectSeatViewModel
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Selected Seats")
                        .font(.title2)
                        .padding(.trailing,10)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack{
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 10) {
                        ForEach(viewModel.seats) { seat in
                            Button(action: {
                                if seat.isBooked {
                                    viewModel.unbookSeat(seat: seat)
                                } else {
                                    viewModel.bookSeat(seat: seat)
                                }
                            }) {
                                Text("\(seat.id)")
                                    .font(.headline)
                                    .padding()
                                    .background(seat.isBooked ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .disabled(seat.isBooked)
                        }
                    }
                }
                
            }.padding()
            HStack{
                Image(systemName: "square.split.diagonal.2x2")
                    .foregroundColor(.white)
                    .frame(width: 10,height: 10)
                Text("closed")
                    .foregroundColor(.white)
                
                Image(systemName: "square")
                    .frame(width: 10,height: 10)
                    .foregroundColor(.white)
                Text("Available")
                    .foregroundColor(.white)
                
                Image(systemName: "square")
                    .background(Color.gray)
                    .frame(width: 10,height: 10)
                Text("reserve")
                    .foregroundColor(.white)
                
                Image(systemName: "square.fill")
                    .foregroundColor(.blue)
                    .frame(width: 10,height: 10)
                Text("booked")
                    .foregroundColor(.white)
            }
            .padding(30)
            HStack{
                DatePicker("", selection: $viewModel.date)
                    .datePickerStyle(CompactDatePickerStyle())
                Spacer()
                Image(systemName:"calendar")
                    .imageScale(.large)
                    .foregroundColor(.white)
            }
            .padding(.bottom,50)
            HStack{
                Button("11.30am",action: {
                    viewModel.time1.toggle()
                    
                })
                .frame(width: 100, height: 20)
                .cornerRadius(20)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .background(viewModel.time1 ? Color.blue : Color.gray)
                .cornerRadius(15)
                .padding(.leading,5)
                
                Button("2.30pm",action: {
                    viewModel.time2.toggle()
                }).frame(width: 100, height: 20)
                    .cornerRadius(20)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .background(viewModel.time2 ? Color.blue : Color.gray)
                    .cornerRadius(15)
                    .padding(.leading,5)
                
                Button("4.15pm",action: {
                    viewModel.time3.toggle()
                }).frame(width: 100, height: 20)
                    .cornerRadius(20)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .background(viewModel.time3 ? Color.blue : Color.gray)
                    .cornerRadius(15)
                    .padding(.leading,5)
            }
            
            VStack{
                HStack{
                    Button("8.45pm",action: {
                        viewModel.time4.toggle()
                    }).frame(width: 100, height: 20)
                        .cornerRadius(20)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .background(viewModel.time4 ? Color.blue : Color.gray)
                        .cornerRadius(15)
                        .padding(.leading,0)
                }
                Spacer()
                HStack{
                    Text("$45.98")
                        .foregroundColor(.yellow)
                        .font(.title2)
                    Button(action: {
                        viewModel.showAlert.toggle()
                    })
                    {
                        Text("Buy Ticket")
                            .frame(width: 250, height: 20)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .background(Color(.blue))
                            .cornerRadius(15)
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Ticket booked"))
                    }
                    
                }
                .background(Color("Color"))
            }
        }
        .background(Color("Color"))
    }
    
}








