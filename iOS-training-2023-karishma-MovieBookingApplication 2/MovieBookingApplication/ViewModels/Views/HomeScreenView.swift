//
//  HomeScreenView.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import SwiftUI
struct HomeScreenView: View {
    @ObservedObject var viewModel: HomeScreenViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Hi,Edwards!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.trailing,90)
                    
                    Button(action: {
                        
                    }){
                        Image("PHOTO 2")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .cornerRadius(30)
                        }
                }.padding(.top,30)
                
                HStack {
                    TextField("search here", text: $viewModel.showtext , onEditingChanged: { value in
                        viewModel.searchBar()
                    })
                        .textFieldStyle(.plain)
                        .font(Font.system(size: 14))
                        .frame(width: 305)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 40).fill(Color("Color3")))
                        .foregroundColor(.white)
                    
                    Button(action:  {
                       viewModel.searchBar()
                        }) { Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                VStack {
                    HStack {
                        Text("Categories")
                            .foregroundColor(.white)
                            .padding(.trailing,200)
                        
                        Button(action: {
                            
                        }){
                            Text("see more")
                                .foregroundColor(.gray)
                            }
                    }.padding(.bottom)
                    ZStack {
                        HStack {
                            Button(action: {
                                
                            }){
                                Text("😱  Horror")
                                    .font(.system(size: 17))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray)
                                            .shadow(color: .gray, radius: 2, x: 0, y: 2))
                            }.frame(width:80, height: 110)
                                .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 0.0))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                            Button(action: {
                                
                            }) {
                                VStack{
                                    Text("🥰")
                                        .font(.system(size: 17))
                                    Text("romance")
                                }
                                .font(.system(size: 17))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 2))
                            }.frame(width:80, height: 110)
                                .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 0.0))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            Button(action: {
                                
                            }) {
                                Text("🤪  Comedy")
                                    .font(.system(size: 17))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray)
                                            .shadow(color: .gray, radius: 2, x: 0, y: 2))
                            }.frame(width:80, height: 110)
                                .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 0.0))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            Button(action: {
                                
                            }) {
                                
                                Text("🤩 Drama")
                                    .font(.system(size: 17))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray)
                                            .shadow(color: .gray, radius: 2, x: 0, y: 2))
                            }.frame(width:80, height: 110)
                                .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 0.0))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                        }.padding(.leading,2)
                    }.padding(.bottom,10)
                }
                VStack(){
                    HStack {
                        Text("Popular")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.trailing,200)
                        
                        Button(action: {
                            viewModel.showSheet = true
                        }){
                            Text("see more")
                                .foregroundColor(.gray)
                        }
                        .sheet(isPresented: $viewModel.showSheet) {
                          ListView()
                        }
                    }
                    scrollView()
                    }
            }
            .navigationDestination(isPresented: $viewModel.shownext, destination: {
                MovieDetailsView(viewModel: MovieDetailsViewModel(movie: viewModel.shift))
            })
            .onAppear {
                viewModel.fetch()
            }
            .background(Color("Color"))
        }
 }
    
func scrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack{
                if let movies = viewModel.movies?.results
                {
                    ForEach(0..<movies.count ,id: \.self) { index in
                        
                        VStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movies[index].poster_path)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            }
                        placeholder: {
                            Color.gray.opacity(0.2)
                        }
                            Text(movies[index].original_title)
                                .foregroundColor(.white)
                            
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            }
                        .padding(.bottom,80)
                        .onTapGesture {
                            self.viewModel.shift = movies[index]
                            viewModel.shownext.toggle()
                        }
                        
                    }
                }
            }
        }
        .padding(.top, 30)
    }
}

