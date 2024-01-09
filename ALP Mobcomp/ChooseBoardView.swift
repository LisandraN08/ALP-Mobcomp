//
//  ChooseBoardView.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 25/12/23.
//

import SwiftUI

struct ChooseBoardView: View {
    @State private var colorScheme: ColorScheme = .dark
    @Binding var isLightMode: Bool
    @State private var Angka: Int = 1
    @State private var selectedVulnerability: Vulnerability = .none
    @State private var selectedDealer: Dealer = .west
    
    init(isLightMode: Binding<Bool>) {
        _isLightMode = isLightMode
    }

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
            .background(isLightMode ? LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 0.68, green: 0.82, blue: 1), location: 0.00),
                Gradient.Stop(color: Color(red: 0.8, green: 0.95, blue: 1), location: 0.32),
                Gradient.Stop(color: Color(red: 0.86, green: 0.81, blue: 1), location: 0.65),
                Gradient.Stop(color: Color(red: 0.93, green: 0.87, blue: 1), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.45, y: 0.18),
                endPoint: UnitPoint(x: 1.08, y: 1.19)
            ) :
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
                            .foregroundColor(isLightMode ? .black : .white)
                        HStack{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 28, height: 28)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(10)
                                Button(action: {
                                    if Angka > 1 {
                                        Angka -= 1
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
                            Text("\(Angka)")
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
                                  Angka += 1
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
                            .foregroundColor(isLightMode ? .black : .white)

                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 201, height: 39)
                                    .foregroundColor(Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                
                                Text("None")
                                    .font(Font.custom("Poppins", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 ? .white : .black)
                            }
                        
                        .padding(.bottom, 10)

                            ZStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 201, height: 39)
                                        .foregroundColor(Angka % 16 == 2 || Angka % 16 == 5 || Angka % 16 == 12 || Angka % 16 == 15 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("North-South")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Angka % 16 == 2 || Angka % 16 == 5 || Angka % 16 == 12 || Angka % 16 == 15 ? .white : .black)
                                }

                            }
                        
                        .padding(.bottom, 10)

                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 201, height: 39)
                                    .foregroundColor(Angka % 16 == 3 || Angka % 16 == 6 || Angka % 16 == 9 || Angka % 16 == 0 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                Text("East-West")
                                    .font(Font.custom("Poppins", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Angka % 16 == 3 || Angka % 16 == 6 || Angka % 16 == 9 || Angka % 16 == 0 ? .white : .black)
                            }
                        
                        .padding(.bottom, 10)

                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 201, height: 39)
                                    .foregroundColor(Angka % 16 == 4 || Angka % 16 == 7 || Angka % 16 == 10 || Angka % 16 == 13 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                Text("All")
                                    .font(Font.custom("Poppins", size: 20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Angka % 16 == 4 || Angka % 16 == 7 || Angka % 16 == 10 || Angka % 16 == 13 ? .white : .black)
                            }
                        
                        .padding(.bottom, 10)
                        .padding(.bottom, 25)
                        Text("Dealer")
                            .font(
                                Font.custom("Poppins", size: 26)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(isLightMode ? .black : .white)
                        HStack{

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(Angka % 4 == 0 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("W")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Angka % 4 == 0 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(Angka % 4 == 1  ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("N")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Angka % 4 == 1 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(Angka % 4 == 2 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("E")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Angka % 4 == 2 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)

                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 51, height: 51)
                                        .foregroundColor(Angka % 4 == 3 ? Color(red: 0.04, green: 0.57, blue: 0.51) : Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    Text("S")
                                        .font(Font.custom("Poppins", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Angka % 4 == 3 ? .white : .black)
                                }
                            
                            .padding(.trailing,5)
                        }
                    }
                }
                .padding(.bottom, 20)
                Button(action: {
                    startBidding()
                }) {
                    NavigationLink(destination: BiddingView(isLightMode: $isLightMode, Angka: $Angka)) {
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
            
        }
        .frame(width: 393, height: 852)
        .background(isLightMode ? .white : .black)
    }
    private func startBidding() {
        print("Board Number: \(Angka)")
        print("Selected Vulnerability: \(selectedVulnerability)")
        print("Selected Dealer: \(selectedDealer)")
    }
}
//
//#Preview {
//    ChooseBoardView()
//}
