//
//  ChooseBoardView.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 25/12/23.
//

import SwiftUI

struct ChooseBoardView: View {
    @State private var boardNumber = 1
    @State private var selectedVulnerability: Vulnerability = .none
    @State private var selectedDealer: Dealer = .west

    enum Vulnerability {
        case none
        case northSouth
        case eastWest
        case all
    }
    
    enum Dealer {
        case west
        case north
        case east
        case south
    }
    
    var body: some View {
        ZStack{
            Image("Vector")
            .frame(width: 797.95227, height: 350.65829)
            .background(
              LinearGradient(
                stops: [
                  Gradient.Stop(color: Color(red: 0.24, green: 0.46, blue: 0.67), location: 0.00),
                  Gradient.Stop(color: .white.opacity(0), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.45, y: 0.18),
                endPoint: UnitPoint(x: 1.08, y: 1.19)
              )
            )
            .blur(radius: 50)
            .rotationEffect(Angle(degrees: -153.15))

            VStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 594)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: -0.02),
                                endPoint: UnitPoint(x: 1.03, y: 1.06)
                            )
                        )
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                    VStack{
                        Text("Board")
                            .font(
                                Font.custom("Poppins", size: 26)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        HStack{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 28, height: 28)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(10)
                                Button(action: {
                                    if boardNumber > 1 {
                                        boardNumber -= 1
                                    }
                                }) {
                                    Text("-")
                                        .font(
                                            Font.custom("Poppins", size: 20)
                                                .weight(.semibold)
                                        )
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.trailing)
                            Text("\(boardNumber)")
                                .font(
                                    Font.custom("Poppins", size: 32)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 28, height: 28)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(10)
                                Button(action: {
                                  boardNumber += 1
                                }) {
                                    Text("+")
                                        .font(
                                            Font.custom("Poppins", size: 20)
                                                .weight(.semibold)
                                        )
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.leading)
                        }
                        .padding(.bottom, 30)
                        Text("Vulnerability")
                            .font(
                                Font.custom("Poppins", size: 26)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)

                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 201, height: 39)
                                    .foregroundColor(boardNumber % 16 == 1 || boardNumber % 16 == 8 || boardNumber % 16 == 11 || boardNumber % 16 == 14 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                
                                Text("None")
                                    .font(Font.custom("Poppins", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(boardNumber % 16 == 1 || boardNumber % 16 == 8 || boardNumber % 16 == 11 || boardNumber % 16 == 14 ? .white : .black)
                            }
                        
                        .padding(.bottom, 10)

                            ZStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 201, height: 39)
                                        .foregroundColor(boardNumber % 16 == 2 || boardNumber % 16 == 5 || boardNumber % 16 == 12 || boardNumber % 16 == 15 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("North-South")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(boardNumber % 16 == 2 || boardNumber % 16 == 5 || boardNumber % 16 == 12 || boardNumber % 16 == 15 ? .white : .black)
                                }

                            }
                        
                        .padding(.bottom, 10)

                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 201, height: 39)
                                    .foregroundColor(boardNumber % 16 == 3 || boardNumber % 16 == 6 || boardNumber % 16 == 9 || boardNumber % 16 == 0 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                Text("East-West")
                                    .font(Font.custom("Poppins", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(boardNumber % 16 == 3 || boardNumber % 16 == 6 || boardNumber % 16 == 9 || boardNumber % 16 == 0 ? .white : .black)
                            }
                        
                        .padding(.bottom, 10)

                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 201, height: 39)
                                    .foregroundColor(boardNumber % 16 == 4 || boardNumber % 16 == 7 || boardNumber % 16 == 10 || boardNumber % 16 == 13 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                Text("All")
                                    .font(Font.custom("Poppins", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(boardNumber % 16 == 4 || boardNumber % 16 == 7 || boardNumber % 16 == 10 || boardNumber % 16 == 13 ? .white : .black)
                            }
                        
                        .padding(.bottom, 10)
                        .padding(.bottom, 25)
                        Text("Dealer")
                            .font(
                                Font.custom("Poppins", size: 26)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        HStack{

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(boardNumber % 4 == 0 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("W")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(boardNumber % 4 == 0 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(boardNumber % 4 == 1  ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("N")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(boardNumber % 4 == 1 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(boardNumber % 4 == 2 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("E")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(boardNumber % 4 == 2 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(boardNumber % 4 == 3 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("S")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(boardNumber % 4 == 3 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)
                        }
                    }
                }
                .padding(.bottom, 20)
                Button(action: {
                    startBidding()
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 62)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.34, green: 0.67, blue: 0.81), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.72, green: 0.96, blue: 1), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                )
                            )
                            .cornerRadius(15)
                        
                        Text("Start Bidding")
                            .font(
                                Font.custom("Poppins", size: 22)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                }
            }
            
        }
        .frame(width: 393, height: 852)
        .background(.black)
    }
    private func startBidding() {
        print("Board Number: \(boardNumber)")
        print("Selected Vulnerability: \(selectedVulnerability)")
        print("Selected Dealer: \(selectedDealer)")
    }
}

#Preview {
    ChooseBoardView()
}
