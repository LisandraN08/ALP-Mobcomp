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
    @State private var selectedAssetsPlayer1: Set<Int> = []
    @State private var selectedAssetsPlayer2: Set<Int> = []
    @State private var selectedAssetsPlayer3: Set<Int> = []
    @State private var selectedAssetsPlayer4: Set<Int> = []
    @State private var isAssetSelectionVisible = false
    @State private var currentPlayer = 1
    
    
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
                            HStack(spacing: 10) {
                                ForEach(selectedAssetsPlayer1.sorted(), id: \.self) { asset in
                                    Image("\(asset)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .rotationEffect(Angle(degrees: 270))
                                        .position(x: -30, y:150)
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
                                        Image("\(asset)")
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
                                        Image("\(asset)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .rotationEffect(Angle(degrees: 90))
                                            .position(x: 70, y:400)
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
                                    Image("\(asset)")
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
                                assetSelectionView(player: 1, assets: [
                                    [9, 18, 25, 31, 38],
                                    [8, 17, 24, 30, 37],
                                    [7, 16, 23, 29, 36]
                                ])
                                .opacity(isAssetSelectionVisible ? 1 : 0)
                                .animation(.easeInOut)
                                .onTapGesture {
                                    isAssetSelectionVisible.toggle()
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
                                assetSelectionView(player: 2, assets: [
                                    [9, 8, 7],
                                    [18, 17, 16],
                                    [25, 24, 23],
                                    [31, 30, 29],
                                    [38, 37, 36]
                                ])
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
                                assetSelectionView(player: 3, assets: [
                                    [38, 31, 25, 18, 9],
                                    [37, 30, 24, 17, 8],
                                    [36, 29, 23, 16, 7]
                                ])
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
                                assetSelectionView(player: 4, assets: [
                                    [36, 37, 38],
                                    [29, 30, 31],
                                    [23, 24, 25],
                                    [16, 17, 18],
                                    [7, 8, 9]
                                ])
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
    func assetSelectionView(player: Int, assets: [[Int]]) -> some View {
        VStack {
            ForEach(assets, id: \.self) { assetRow in
                HStack {
                    ForEach(assetRow, id: \.self) { asset in
                        Button(action: {
                            switch player {
                            case 1:
                                selectedAssetsPlayer1.insert(asset)
                                currentPlayer += 1
                                isAssetSelectionVisible = false
                            case 2:
                                selectedAssetsPlayer2.insert(asset)
                                currentPlayer += 1
                                isAssetSelectionVisible = false
                            case 3:
                                selectedAssetsPlayer3.insert(asset)
                                currentPlayer += 1
                                isAssetSelectionVisible = false
                            case 4:
                                selectedAssetsPlayer4.insert(asset)
                                currentPlayer = 1
                                isAssetSelectionVisible = false
                            default:
                                break
                            }

                            // Handle the selected asset
                            print("Selected Assets Player \(player): \(selectedAssets(for: player))")
                        }) {
                            Image("\(asset)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .rotationEffect(rotationAngle(for: player))
                                .scaleEffect(2)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
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
