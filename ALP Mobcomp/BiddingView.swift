//
//  BiddingView.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 20/12/23.
//

import SwiftUI

struct BiddingView: View {
    @State private var colorScheme: ColorScheme = .dark
    @State private var tableNumber: Int = 1
    @State private var dealerPosition: Int = 1
    @State private var currentPlayer: Int = 1

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 150, height: 359)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.5))
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                        .rotationEffect(Angle(degrees: 90))
                    
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:435, height: 123)  // Set the desired height here
                            .background(Color(red: 0.82, green: 0.86, blue: 0.88).opacity(0.5))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                            .rotationEffect(Angle(degrees: 90))
                            .frame(minWidth: 0, maxWidth: .infinity)  // Set the desired width range here
                        VStack{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 126, height: 45)
                                    .background(
                                        LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: Color(red: 0.54, green: 0.73, blue: 0.79), location: 0.00),
                                                Gradient.Stop(color: Color(red: 0.72, green: 1, blue: 0.95), location: 1.00),
                                            ],
                                            startPoint: UnitPoint(x: 0.5, y: 0),
                                            endPoint: UnitPoint(x: 0.5, y: 1)
                                        )
                                    )
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .rotationEffect(Angle(degrees: 90))
                                    .frame(minHeight: 10, maxHeight: 0)
                                    .frame(maxWidth: 50)
                                
                                Text("SCORE")
                                    .font(
                                        Font.custom("Poppins", size: 20)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .rotationEffect(Angle(degrees: 90))
                            }
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 0, height: 65)
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 50, height: 50)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.54, green: 0.73, blue: 0.79), location: 0.00),
                                            Gradient.Stop(color: Color(red: 0.72, green: 1, blue: 0.95), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(25)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .rotationEffect(Angle(degrees: 90))
                                .frame(minHeight: 10, maxHeight: 0)
                                .frame(maxWidth: 50)
                            
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 0, height: 65)
                            
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 126, height: 45)
                                    .background(
                                        LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: Color(red: 0.54, green: 0.73, blue: 0.79), location: 0.00),
                                                Gradient.Stop(color: Color(red: 0.72, green: 1, blue: 0.95), location: 1.00),
                                            ],
                                            startPoint: UnitPoint(x: 0.5, y: 0),
                                            endPoint: UnitPoint(x: 0.5, y: 1)
                                        )
                                    )
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .rotationEffect(Angle(degrees: 90))
                                    .frame(minHeight: 10, maxHeight: 0)
                                    .frame(maxWidth: 50)
                                
                                Text("INPUT")
                                    .font(
                                        Font.custom("Poppins", size: 20)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .rotationEffect(Angle(degrees: 90))
                            }
                        }
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:435, height: 123)  // Set the desired height here
                            .background(Color(red: 0.82, green: 0.86, blue: 0.88).opacity(0.5))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                            .rotationEffect(Angle(degrees: 90))
                            .frame(minWidth: 0, maxWidth: .infinity)  // Set the desired width range here
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 150, height: 359)
                        .background(Color(red: 0.82, green: 0.86, blue: 0.88).opacity(0.5))
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                        .rotationEffect(Angle(degrees: 90))
                }
                if currentPlayer == 1 {
                    Text("Tap to Bid")
                        .font(
                        Font.custom("Poppins", size: 36)
                        .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(20)
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .background(Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 180))
                        .offset(x: 0, y: -300)
                        .onTapGesture {
                            // Handle tap action for currentPlayer 1
                            // Update currentPlayer and perform necessary actions
                            currentPlayer += 1
                        }
                } else if currentPlayer == 2 {
                    Text("Tap to Bid")
                        .font(
                        Font.custom("Poppins", size: 36)
                        .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(20)
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .background(Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 270))
                        .offset(x: 120, y: 0)
                        .onTapGesture {
                            // Handle tap action for currentPlayer 2
                            // Update currentPlayer and perform necessary actions
                            currentPlayer += 1
                        }
                } else if currentPlayer == 3 {
                    Text("Tap to Bid")
                        .font(
                        Font.custom("Poppins", size: 36)
                        .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(20)
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .background(Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 0))
                        .offset(x: 0, y: 300)
                        .onTapGesture {
                            // Handle tap action for currentPlayer 2
                            // Update currentPlayer and perform necessary actions
                            currentPlayer += 1
                        }
                } else if currentPlayer == 4 {
                    Text("Tap to Bid")
                        .font(
                        Font.custom("Poppins", size: 36)
                        .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(20)
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .background(Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: -120, y: 0)
                        .onTapGesture {
                            // Handle tap action for currentPlayer 2
                            // Update currentPlayer and perform necessary actions
                            currentPlayer += 1
                        }
                }
                
            }
            .frame(width: 393, height: 852)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.26, green: 0.53, blue: 0.61), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.14, green: 0.4, blue: 0.51), location: 0.29),
                        Gradient.Stop(color: Color(red: 0.06, green: 0.14, blue: 0.27), location: 0.67),
                        Gradient.Stop(color: .black, location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.03, y: 0.02),
                    endPoint: UnitPoint(x: 1.08, y: 1.08)
                )
            )
        }
    }
}

struct PlayerSquare: View {
    let position: Int
    let isDealer: Bool
    let isCurrentPlayer: Bool

    var body: some View {
        VStack {
            Text("Player \(position)")
                .font(.subheadline)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 150)
                .foregroundColor(isCurrentPlayer ? .yellow : .gray)
                .overlay(isDealer ? Text("Dealer").foregroundColor(.red) : nil)
        }
        .padding()
    }
}

#Preview {
    BiddingView()
}
