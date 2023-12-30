//
//  BiddingView.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 20/12/23.
//

import SwiftUI

struct TRIAL: View {
    @State private var colorScheme: ColorScheme = .dark
    @State private var tableNumber: Int = 1
    @State private var dealerPosition: Int = 1
    @State private var selectedAssetsPlayer1: Set<Int> = []
    @State private var selectedAssetsPlayer2: Set<Int> = []
    @State private var selectedAssetsPlayer3: Set<Int> = []
    @State private var selectedAssetsPlayer4: Set<Int> = []
    @State private var isAssetSelectionVisible = false
    @State private var currentPlayer = 1
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var selectedImage: String? = nil
    @State private var showAlert = false
    @State private var selectedImageName: String?
    @State private var Bidding: Int = 0
    
    @State private var x: CGFloat = 180
    

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
                        .overlay(
                                Group {
                                    if let selectedImage = selectedImage {
                                        Image(selectedImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .position(x: 60, y: 120)
                                            .rotationEffect(Angle(degrees: 180))
                                    }
                                }
                            
                        )

                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:435, height: 123)  // Set the desired height here
                            .background(Color(red: 0.82, green: 0.86, blue: 0.88).opacity(0.5))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                            .rotationEffect(Angle(degrees: 90))
                            .frame(minWidth: 0, maxWidth: .infinity)  // Set the desired width range here
                            .overlay(
                                HStack(spacing: 10) {
                                    ForEach(selectedAssetsPlayer4.sorted(), id: \.self) { asset in
                                        Image("\(selectedImage)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .rotationEffect(Angle(degrees: 180))
                                            .position(x: 60, y: 220)
                                    }
                                }
                            )
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
                            .overlay(
                                HStack(spacing: 10) {
                                    ForEach(selectedAssetsPlayer3.sorted(), id: \.self) { asset in
                                        Image("\(selectedImage)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .rotationEffect(Angle(degrees: 90))
                                            .position(x: 70, y:400)
                                            .rotationEffect(.degrees(180))
                                    }
                                }
                            )
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 150, height: 359)
                        .background(Color(red: 0.82, green: 0.86, blue: 0.88).opacity(0.5))
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                        .rotationEffect(Angle(degrees: 90))
                        .overlay(
                            HStack(spacing: 10) {
                                ForEach(selectedAssetsPlayer2.sorted(), id: \.self) { asset in
                                    Image("\(selectedImage)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .rotationEffect(Angle(degrees: 360))
                                        .position(x: 200, y:-280)
                                }
                            }
                        )
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
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .background(Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
                        .cornerRadius(40)
                        .rotationEffect(Angle(degrees: 180))
                        .offset(x: 0, y: -300)
                        .onTapGesture {
                            // Handle tap action for currentPlayer 1
                            // Update currentPlayer and perform necessary actions
                            isAssetSelectionVisible.toggle()
                        }
                        .overlay(
                            VStack {
                                Spacer()
                                ZStack{
                                    
                                    if Bidding < 1 {
                                        Image("1B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 50)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "1"
                                        }
                                    }
                                    
                                    if Bidding < 2 {
                                        Image("2B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 50)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "2"
                                        }
                                    }
                                    
                                    if Bidding < 3 {
                                        Image("3B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 50)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "3"
                                        }
                                    }
                                    
                                    if Bidding < 4 {
                                        Image("4B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 50)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "4"
                                        }
                                    }
                                    
                                    if Bidding < 5 {
                                        Image("5B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 50)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "5"
                                        }
                                    }
                                    
                                    if Bidding < 6 {
                                        Image("6B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 70)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "6"
                                        }
                                    }
                                               
                                    if Bidding < 7 {
                                        Image("7B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 70)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "7"
                                        }
                                    }
                                    
                                    if Bidding < 8 {
                                        Image("8B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 70)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "8"
                                        }
                                    }
                                    
                                    if Bidding < 9 {
                                        Image("9B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 70)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "9"
                                        }
                                    }
                                    
                                    if Bidding < 10 {
                                        Image("10B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 70)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "10"
                                        }
                                    }
                                    
                                    if Bidding < 11 {
                                        Image("11B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 90)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "11"
                                        }
                                    }
                                               
                                    if Bidding < 12 {
                                        Image("12B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 90)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "12"
                                        }
                                    }
                                    
                                    if Bidding < 13 {
                                        Image("13B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 90)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "13"
                                        }
                                    }
                                    
                                    if Bidding < 14 {
                                        Image("14B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 90)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "14"
                                        }
                                    }
                                    
                                    if Bidding < 15 {
                                        Image("15B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 90)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "15"
                                        }
                                    }
                                    
                                    if Bidding < 16 {
                                        Image("16B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 110)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "16"
                                        }
                                    }
                                               
                                    if Bidding < 17 {
                                        Image("17B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 110)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "17"
                                        }
                                    }
                                    
                                    if Bidding < 18 {
                                        Image("18B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 110)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "18"
                                        }
                                    }
                                    
                                    if Bidding < 19 {
                                        Image("19B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 110)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "19"
                                        }
                                    }
                                    
                                    if Bidding < 20 {
                                        Image("20B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 110)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "20"
                                        }
                                    }
                                    
                                    if Bidding < 21 {
                                        Image("21B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 130)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "21"
                                        }
                                    }
                                               
                                    if Bidding < 22 {
                                        Image("22B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 130)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "22"
                                        }
                                    }
                                    
                                    if Bidding < 23 {
                                        Image("23B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 130)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "23"
                                        }
                                    }
                                    
                                    if Bidding < 24 {
                                        Image("24B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 130)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "24"
                                        }
                                    }
                                    
                                    if Bidding < 25 {
                                        Image("25B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 130)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "25"
                                        }
                                    }
                                    
                                    if Bidding < 26 {
                                        Image("26B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 150)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "26"
                                        }
                                    }
                                               
                                    if Bidding < 27 {
                                        Image("27B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 150)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "27"
                                            Bidding = 27
                                        }
                                    }
                                    
                                    if Bidding < 28 {
                                        Image("28B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 150)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "28"
                                            Bidding = 28
                                        }
                                    }
                                    
                                    if Bidding < 29 {
                                        Image("29B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 150)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "29"
                                            Bidding = 29
                                        }
                                    }
                                    
                                    if Bidding < 30 {
                                        Image("30B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 150)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "30"
                                            Bidding = 30
                                        }
                                    }
                                        
                                    if Bidding < 31 {
                                        Image("31B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 75, y: 170)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "31"
                                            Bidding = 31
                                        }
                                    }
                                               
                                    if Bidding < 32 {
                                        Image("32B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 93, y: 17)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "32"
                                            Bidding = 32
                                        }
                                    }
                                    
                                    if Bidding < 33 {
                                        Image("33B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 111, y: 170)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "33"
                                            Bidding = 33
                                        }
                                    }
                                    
                                    if Bidding < 34 {
                                        Image("34B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 129, y: 170)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "34"
                                            Bidding = 34
                                        }
                                    }
                                    
                                    if Bidding < 35 {
                                        Image("35B")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .position(x: 147, y: 170)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "35"
                                            Bidding = 35
                                        }
                                    }
                                    
                                    
                                    Image("36B")
                                        .resizable()
                                        .frame(width: 30, height: 32)
                                        .position(x: 80, y: 189)
                                        .rotationEffect(.degrees(180))
                                        .onTapGesture
                                    {
                                        selectedImage = "36"
                                    }

                                    Image("38B")
                                        .resizable()
                                        .frame(width: 25, height: 32)
                                        .position(x: 144, y: 186)
                                        .rotationEffect(.degrees(180))
                                        .onTapGesture
                                    {
                                        selectedImage = "37"
                                    }
                                    
                                    Image("37B")
                                        .resizable()
                                        .frame(width: 40, height: 45)
                                        .position(x: 112, y: 188)
                                        .rotationEffect(.degrees(180))
                                        .onTapGesture
                                    {
                                        selectedImage = "38"
                                    }
                                    
                                    Image("39B")
                                        .resizable()
                                        .frame(width: 92, height: 105)
                                        .position(x: 111, y: 234)
                                        .rotationEffect(.degrees(180))
                                        .onTapGesture
                                    {
                                        selectedImage = "38"
                                        
                                    }
                                }

                                .opacity(isAssetSelectionVisible ? 1 : 0)
                                .animation(.easeInOut)
                                .onTapGesture {
                                    isAssetSelectionVisible.toggle()
                                    showAlert.toggle()
                                    
                                }
                                Spacer()
                            }
                        )
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
                            isAssetSelectionVisible.toggle()
                        }
                        .overlay(
                            VStack {
                                Spacer()
                                ZStack{
                                }

                                .opacity(isAssetSelectionVisible ? 1 : 0)
                                .animation(.easeInOut)
                                .onTapGesture {
                                    isAssetSelectionVisible.toggle()
                                }
                                Spacer()
                            }
                        )
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
                            // Handle tap action for currentPlayer 3
                            // Update currentPlayer and perform necessary actions
                            isAssetSelectionVisible.toggle()
                        }
                        .overlay(
                            VStack {
                                Spacer()
                                ZStack{
                                    
                                }

                                .opacity(isAssetSelectionVisible ? 1 : 0)
                                .animation(.easeInOut)
                                .onTapGesture {
                                    isAssetSelectionVisible.toggle()
                                }
                                Spacer()
                            }
                        )
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
                            // Handle tap action for currentPlayer 4
                            // Update currentPlayer and perform necessary actions
                            isAssetSelectionVisible.toggle()
                        }
                        .overlay(
                            VStack {
                                Spacer()
                                ZStack{
                                    
                                }

                                .opacity(isAssetSelectionVisible ? 1 : 0)
                                .animation(.easeInOut)
                                .onTapGesture {
                                    isAssetSelectionVisible.toggle()
                                }
                                Spacer()
                            }
                        )
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


    // Helper function to get selected assets for a specific player
    private func selectedAssets(for player: Int) -> Set<Int> {
        switch player {
        case 1:
            return selectedAssetsPlayer1
        case 2:
            return selectedAssetsPlayer2
        case 3:
            return selectedAssetsPlayer3
        case 4:
            return selectedAssetsPlayer4
        default:
            return []
        }
    }

    // Helper function to determine rotation angle for each player
    private func rotationAngle(for player: Int) -> Angle {
        switch player {
        case 1:
            return Angle(degrees: 90)
        case 2:
            return Angle(degrees: 180)
        case 3:
            return Angle(degrees: 270)
        case 4:
            return Angle(degrees: 360)
        default:
            return Angle(degrees: 0)
        }
    }
}

#Preview {
    TRIAL()
}
