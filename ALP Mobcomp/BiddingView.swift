//
//  BiddingView.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 20/12/23.
//

import SwiftUI

struct BiddingView: View {
//    @Binding var isLightMode: Bool
    @State private var colorScheme: ColorScheme = .dark
    @Binding var Angka: Int
    @Binding var isLightMode: Bool
    @State private var tableNumber: Int = 1
    @State private var dealerPosition: Int = 1
    @State private var selectedAssetsPlayer1: [Int] = []
    @State private var selectedAssetsPlayer2: [Int] = []
    @State private var selectedAssetsPlayer3: [Int] = []
    @State private var selectedAssetsPlayer4: [Int] = []
    @State private var isAssetSelectionVisible = false
    @State private var currentPlayer = 1
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var selectedImage: String? = nil
    @State private var selectedImage2: String? = nil
    @State private var selectedImage3: String? = nil
    @State private var selectedImage4: String? = nil
    @State private var showAlert = false
    @State private var selectedImageName: String?
    @State private var Bidding: Int = 0
    @State private var Bidding2: Int = 0
    @State private var Opening: Int = 0
    @State private var Opener: Int = 0
    @State private var Pass: Int = 0
    @State private var DblUS: Int = 0
    @State private var DblTB: Int = 0
    @State private var RDblUS: Int = 0
    @State private var RDblTB: Int = 0
    @State private var DblUSOK: Int = 0
    @State private var DblTBOK: Int = 0
    @State private var RDblUSOK: Int = 0
    @State private var RDblTBOK: Int = 0
    @State private var Kontrak: String = ""
    @State private var Kontrakfix: String = ""
    @State private var isCalculatorViewActive = false
    @State private var x: CGFloat = 180
    @State private var isTextVisible = true

    init(isLightMode: Binding<Bool>, Angka: Binding<Int>) {
        _isLightMode = isLightMode
        _Angka = Angka
    }

    var body: some View {
        
            ZStack {
                VStack {
                    Rectangle() //utara
                        .foregroundColor(.clear)
                        .frame(width: 150, height: 359)
                        .background(Color(Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 ||
                                          Angka % 16 == 3 || Angka % 16 == 6 || Angka % 16 == 9 || Angka % 16 == 0 ? .white : .red).opacity(0.5))
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                        .rotationEffect(Angle(degrees: 90))
                        .overlay(
                            ZStack {
                                ForEach(selectedAssetsPlayer1.indices, id: \.self) { index in
                                    let asset = selectedAssetsPlayer1[index]
                                    Image("\(asset)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .rotationEffect(Angle(degrees: 270))
                                        .position(x: CGFloat(200 - (30 * (index))), y: 170)
                                }

                            }
                        )

                    HStack(spacing: 0) {
                        Rectangle() //barat
                            .foregroundColor(.clear)
                            .frame(width:435, height: 123)  // Set the desired height here
                            .background(Color(Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 ||
                                              Angka % 16 == 2 || Angka % 16 == 5 || Angka % 16 == 12 || Angka % 16 == 15  ? .white : .red).opacity(0.5))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                            .rotationEffect(Angle(degrees: 90))
                            .frame(minWidth: 0, maxWidth: .infinity)  // Set the desired width range here
                            .overlay(
                                ZStack {
                                    ForEach(selectedAssetsPlayer4.indices, id: \.self) { index in
                                        let asset = selectedAssetsPlayer4[index]
                                        Image("\(asset)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .rotationEffect(Angle(degrees: 180))
                                            .position(x: 75, y: CGFloat(-100 + (30 * (index))))
                                    }
                                }
                            )

                        VStack{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 126, height: 45)
                                    .background( isLightMode ? LinearGradient(
                                        stops: [
                                        Gradient.Stop(color: Color(red: 0.4, green: 0.64, blue: 0.78), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 0.99), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                        ) :
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

                                Text("Previous")
                                    .font(
                                        Font.custom("Poppins", size: 20)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)

                                    .rotationEffect(Angle(degrees: 90))
                                    .onTapGesture {
                                        selectedAssetsPlayer1.removeAll()
                                        selectedAssetsPlayer2.removeAll()
                                        selectedAssetsPlayer3.removeAll()
                                        selectedAssetsPlayer4.removeAll()
                                        Bidding = 0
                                        Pass = 0
                                        Opening = 0
                                        Opener = 0
                                        Kontrak = ""
                                        Kontrakfix = ""
                                        isTextVisible = true
                                        if Angka == 1
                                        {
                                            Angka = 1
                                            currentPlayer = Angka % 4
                                            if currentPlayer == 0
                                            {
                                                currentPlayer = 4
                                                selectedImage = ""
                                            }
                                        }
                                        else
                                        {
                                            Angka = Angka - 1

                                            currentPlayer = Angka % 4
                                            if currentPlayer == 0
                                            {
                                                currentPlayer = 4
                                            }
                                        }
                                    }
                            }

                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 0, height: 65)

                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 50, height: 50)
                                .background( isLightMode ?
                                    LinearGradient(
                                    stops: [
                                    Gradient.Stop(color: Color(red: 0.4, green: 0.64, blue: 0.78), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 0.99), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0),
                                    endPoint: UnitPoint(x: 0.5, y: 1)
                                    ) : LinearGradient(
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
                                .overlay (
                                    Text(String(Angka))
                                        .font(
                                            Font.custom("Poppins", size: 20)
                                                .weight(.bold)
                                        )
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                        .rotationEffect(Angle(degrees: 90))
                                        .position(x: 25, y: 5)
                                )


                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 0, height: 65)
                                    .onAppear {
                                        if Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 {
                                            currentPlayer = 1
                                        } else if Angka % 16 == 2 || Angka % 16 == 5 || Angka % 16 == 12 || Angka % 16 == 15 {
                                            currentPlayer = 2
                                        } else if Angka % 16 == 3 || Angka % 16 == 6 || Angka % 16 == 9 || Angka % 16 == 0 {
                                            currentPlayer = 3
                                        } else {
                                            currentPlayer = 4
                                        }
                                    }
                            


                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 126, height: 45)
                                    .background(isLightMode ? LinearGradient(
                                        stops: [
                                        Gradient.Stop(color: Color(red: 0.4, green: 0.64, blue: 0.78), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 0.99), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    ) :
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


                                Text("Next")
                                    .font(
                                        Font.custom("Poppins", size: 20)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .rotationEffect(Angle(degrees: 90))
                                    .onTapGesture
                                    {
                                        selectedAssetsPlayer1.removeAll()
                                        selectedAssetsPlayer2.removeAll()
                                        selectedAssetsPlayer3.removeAll()
                                        selectedAssetsPlayer4.removeAll()
                                        Bidding = 0
                                        Pass = 0
                                        Opening = 0
                                        Kontrak = ""
                                        Kontrakfix = ""
                                        Opener = 0
                                        Angka = Angka + 1
                                        isTextVisible = true
                                        currentPlayer = Angka % 4
                                        if currentPlayer == 0
                                        {
                                            currentPlayer = 4
                                        }
                                    }
                            }
                        }

                        Rectangle() //timur
                            .foregroundColor(.clear)
                            .frame(width:435, height: 123)  // Set the desired height here
                            .background(Color(Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 ||
                                              Angka % 16 == 2 || Angka % 16 == 5 || Angka % 16 == 12 || Angka % 16 == 15  ? .white : .red).opacity(0.5))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                            .rotationEffect(Angle(degrees: 90))
                            .frame(minWidth: 0, maxWidth: .infinity)  // Set the desired width range here
                            .overlay(
                                ZStack {
                                    ForEach(selectedAssetsPlayer2.indices, id: \.self) { index in
                                        let asset = selectedAssetsPlayer2[index]
                                        Image("\(asset)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .rotationEffect(Angle(degrees: 0))
                                            .position(x: 80, y: CGFloat(220 - (30 * (index))))
                                    }
                                }
                            )

                    }

                    Rectangle() //selatan
                        .foregroundColor(.clear)
                        .frame(width: 150, height: 359)
                        .background(Color(Angka % 16 == 1 || Angka % 16 == 8 || Angka % 16 == 11 || Angka % 16 == 14 ||
                                          Angka % 16 == 3 || Angka % 16 == 6 || Angka % 16 == 9 || Angka % 16 == 0 ? .white : .red).opacity(0.5))
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 4)
                        .rotationEffect(Angle(degrees: 90))
                        .overlay(
                            ZStack {
                                ForEach(selectedAssetsPlayer3.indices, id: \.self) { index in
                                    let asset = selectedAssetsPlayer3[index]
                                    Image("\(asset)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .rotationEffect(Angle(degrees: 90))
                                        .position(x: CGFloat(-50 + (30 * (index))), y: 170)
                                }
                            }
                        )


                }
                if isTextVisible {
                    
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
                            .background(isLightMode ? Color(red: 0.06, green: 0.14, blue: 0.27).opacity(0.5) : Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
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
                                                .position(x: 75, y: -20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "1"
                                                Bidding2 = 1
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1C"
                                            }
                                        }

                                        if Bidding < 2 {
                                            Image("2B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "2"
                                                Bidding2 = 2
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1D"
                                            }
                                        }

                                        if Bidding < 3 {
                                            Image("3B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "3"
                                                Bidding2 = 3
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1H"
                                            }
                                        }

                                        if Bidding < 4 {
                                            Image("4B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "4"
                                                Bidding2 = 4
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1S"
                                            }
                                        }

                                        if Bidding < 5 {
                                            Image("5B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "5"
                                                Bidding2 = 5
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1NT"
                                            }
                                        }

                                        if Bidding < 6 {
                                            Image("6B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 0)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "6"
                                                Bidding2 = 6
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2C"
                                            }
                                        }

                                        if Bidding < 7 {
                                            Image("7B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 0)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "7"
                                                Bidding2 = 7
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2D"
                                            }
                                        }

                                        if Bidding < 8 {
                                            Image("8B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 0)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "8"
                                                Bidding2 = 8
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2H"
                                            }
                                        }

                                        if Bidding < 9 {
                                            Image("9B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 0)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "9"
                                                Bidding2 = 9
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2S"
                                            }
                                        }

                                        if Bidding < 10 {
                                            Image("10B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 0)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "10"
                                                Bidding2 = 10
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2NT"
                                            }
                                        }

                                        if Bidding < 11 {
                                            Image("11B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "11"
                                                Bidding2 = 11
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3C"
                                            }
                                        }

                                        if Bidding < 12 {
                                            Image("12B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "12"
                                                Bidding2 = 12
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3D"
                                            }
                                        }

                                        if Bidding < 13 {
                                            Image("13B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "13"
                                                Bidding2 = 13
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3H"
                                            }
                                        }

                                        if Bidding < 14 {
                                            Image("14B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "14"
                                                Bidding2 = 14
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3S"
                                            }
                                        }

                                        if Bidding < 15 {
                                            Image("15B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 20)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "15"
                                                Bidding2 = 15
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3NT"
                                            }
                                        }

                                        if Bidding < 16 {
                                            Image("16B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 40)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "16"
                                                Bidding2 = 16
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4C"
                                            }
                                        }

                                        if Bidding < 17 {
                                            Image("17B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 40)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "17"
                                                Bidding2 = 17
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4D"
                                            }
                                        }

                                        if Bidding < 18 {
                                            Image("18B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 40)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "18"
                                                Bidding2 = 18
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4H"
                                            }
                                        }

                                        if Bidding < 19 {
                                            Image("19B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 40)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "19"
                                                Bidding2 = 19
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4S"
                                            }
                                        }

                                        if Bidding < 20 {
                                            Image("20B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 40)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "20"
                                                Bidding2 = 20
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4NT"
                                            }
                                        }

                                        if Bidding < 21 {
                                            Image("21B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 60)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "21"
                                                Bidding2 = 21
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5C"
                                            }
                                        }

                                        if Bidding < 22 {
                                            Image("22B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 60)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "22"
                                                Bidding2 = 22
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5D"
                                            }
                                        }

                                        if Bidding < 23 {
                                            Image("23B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 60)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "23"
                                                Bidding2 = 23
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5H"
                                            }
                                        }

                                        if Bidding < 24 {
                                            Image("24B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 60)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "24"
                                                Bidding2 = 24
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5S"
                                            }
                                        }

                                        if Bidding < 25 {
                                            Image("25B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 60)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "25"
                                                Bidding2 = 25
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5NT"
                                            }
                                        }

                                        if Bidding < 26 {
                                            Image("26B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 80)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "26"
                                                Bidding2 = 26
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6C"
                                            }
                                        }

                                        if Bidding < 27 {
                                            Image("27B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 80)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "27"
                                                Bidding2 = 27
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6D"
                                            }
                                        }

                                        if Bidding < 28 {
                                            Image("28B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 80)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "28"
                                                Bidding2 = 28
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6H"
                                            }
                                        }

                                        if Bidding < 29 {
                                            Image("29B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 80)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "29"
                                                Bidding2 = 29
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6S"
                                            }
                                        }

                                        if Bidding < 30 {
                                            Image("30B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 80)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "30"
                                                Bidding2 = 30
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6NT"
                                            }
                                        }

                                        if Bidding < 31 {
                                            Image("31B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 100)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "31"
                                                Bidding2 = 31
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7C"
                                            }
                                        }

                                        if Bidding < 32 {
                                            Image("32B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 100)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "32"
                                                Bidding2 = 32
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7D"
                                            }
                                        }

                                        if Bidding < 33 {
                                            Image("33B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 100)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "33"
                                                Bidding2 = 33
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7H"
                                            }
                                        }

                                        if Bidding < 34 {
                                            Image("34B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 100)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "34"
                                                Bidding2 = 34
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7S"
                                            }
                                        }

                                        if Bidding < 35 {
                                            Image("35B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 100)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "35"
                                                Bidding2 = 35
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7NT"
                                            }
                                        }

                                        if RDblTBOK == 1 {
                                            Image("36B")
                                                .resizable()
                                                .frame(width: 30, height: 32)
                                                .position(x: 80, y: 119)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "36"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "rdbl"
                                            }
                                        }

                                        if DblTBOK == 1 {
                                            Image("38B")
                                                .resizable()
                                                .frame(width: 25, height: 32)
                                                .position(x: 144, y: 116)
                                                .rotationEffect(.degrees(180))
                                                .onTapGesture
                                            {
                                                selectedImage = "37"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 1
                                                RDblTB = 0
                                                Kontrak = "dbl"
                                            }
                                        }

                                        Image("37B")
                                            .resizable()
                                            .frame(width: 40, height: 45)
                                            .position(x: 112, y: 118)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("39B")
                                            .resizable()
                                            .frame(width: 92, height: 105)
                                            .position(x: 111, y: 164)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            selectedImage = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("SUBMIT")
                                            .resizable()
                                            .frame(width: 92, height: 90)
                                            .position(x: 111, y: 230)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture
                                        {
                                            if Kontrak != ""
                                            {
                                                if (Kontrak != "pass")
                                                {
                                                    if Opener == 0
                                                    {
                                                        Opener = 1
                                                    }
                                                    if (Kontrak == "dbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else if (Kontrak == "rdbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else
                                                    {
                                                        Kontrakfix = Kontrak
                                                    }
                                                }
                                                else
                                                {
                                                    Pass = Pass + 1
                                                }
                                                if ((Opening > 3 && Pass > 2) || (Opener == 1 && Pass > 2) || (Opening >= 3 && Pass >= 3))
                                                {
                                                    isTextVisible = false
                                                    isAssetSelectionVisible = false
                                                    
                                                    if Kontrakfix.isEmpty {
                                                        Kontrakfix = "All Pass"
                                                    } else {
                                                        // Modify Kontrakfix based on conditions
                                                        if Kontrakfix.contains("rdbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dblrdbl", with: "XX")
                                                        } else if Kontrakfix.contains("dbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dbl", with: "X")
                                                        }
                                                    }

                                                    // Menampilkan alert dengan informasi yang telah disiapkan
                                                    let alertController = UIAlertController(title: "Informasi Bidding", message: "Kontrak: \(Kontrakfix)\n", preferredStyle: .alert)
                                                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                    // Mendapatkan referensi dari view controller saat ini
                                                    if let currentViewController = UIApplication.shared.keyWindow?.rootViewController {
                                                        currentViewController.present(alertController, animated: true, completion: nil)
                                                    }
                                                }
                                                else
                                                {
                                                    currentPlayer = 2
                                                    Bidding = Bidding2
                                                    Opening = Opening + 1
                                                }

                                                if let selectedImage = selectedImage, let intValue = Int(selectedImage) {

                                                    selectedAssetsPlayer1.append(intValue)
                                                }
                                            }
                                            else
                                            {
                                                let alert = UIAlertController(title: "State",
                                                                              message: "Pilih Kartu",
                                                                              preferredStyle: .alert)

                                                // Menambahkan tombol OK ke alert
                                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                // Menampilkan alert
                                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                                            }
                                            Kontrak = ""
                                        }

                                        Image("UNDO")
                                            .resizable()
                                            .frame(width: 92, height: 90)
                                            .position(x: 111, y: -60)
                                            .rotationEffect(.degrees(180))
                                            .onTapGesture {
                                                if !selectedAssetsPlayer4.isEmpty {
                                                    var selectedArray = Array(selectedAssetsPlayer4)
                                                    selectedArray.removeLast()
                                                    selectedAssetsPlayer4 = Array(Set(selectedArray))


                                                    // Mengatur bidding berdasarkan kondisi yang Anda sebutkan
                                                    if selectedAssetsPlayer3.isEmpty {
                                                        Bidding = 0
                                                    }
                                                    else if let lastAsset = selectedAssetsPlayer3.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer2.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer1.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    }
                                                    guard let lastAssetPlayer3 = selectedAssetsPlayer3.max() else {
                                                                   return
                                                               }

                                                               // Mendapatkan nilai terakhir dari selectedAssetsPlayer2
                                                               let lastAssetPlayer2 = selectedAssetsPlayer2.max() ?? 0

                                                               // Logika berdasarkan kondisi nilai terakhir dari selectedAssetsPlayer3
                                                               if lastAssetPlayer3 != 36 && lastAssetPlayer3 != 37 && lastAssetPlayer3 != 38 && lastAssetPlayer3 != 39 {
                                                                   // Jika lastAssetPlayer3 tidak sama dengan 36, 37, 38, atau 39
                                                                   Pass = 0
                                                                   DblUSOK = 1
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               } else if (lastAssetPlayer3 == 38 || lastAssetPlayer3 == 39) && (lastAssetPlayer2 == 36 || lastAssetPlayer2 == 37 || lastAssetPlayer2 == 38 || lastAssetPlayer2 == 39) {
                                                                   // Jika lastAssetPlayer3 adalah 37 atau 39 dan lastAssetPlayer2 adalah 36, 37, 38, atau 39
                                                                   if lastAssetPlayer2 == 38 || lastAssetPlayer2 == 39 {
                                                                       Pass = 0
                                                                       DblUSOK = 1
                                                                       DblTBOK = 0
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                                   else {
                                                                       Pass = 0
                                                                       DblUSOK = 0
                                                                       DblTBOK = 0
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                               } else if lastAssetPlayer3 == 37 {
                                                                   // Jika lastAssetPlayer3 adalah 36
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 1
                                                                   RDblTBOK = 0
                                                               } else {
                                                                   // Jika kondisi lainnya
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               }
                                                    currentPlayer = 4
                                                }
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
                            .background(isLightMode ? Color(red: 0.06, green: 0.14, blue: 0.27).opacity(0.5) : Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
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

                                        if Bidding < 1 {
                                            Image("1B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -100)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "1"
                                                Bidding2 = 1
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1C"
                                            }
                                        }

                                        if Bidding < 2 {
                                            Image("2B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -100)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "2"
                                                Bidding2 = 2
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1D"
                                            }
                                        }

                                        if Bidding < 3 {
                                            Image("3B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -100)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "3"
                                                Bidding2 = 3
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1H"
                                            }
                                        }

                                        if Bidding < 4 {
                                            Image("4B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -100)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "4"
                                                Bidding2 = 4
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1S"
                                            }
                                        }

                                        if Bidding < 5 {
                                            Image("5B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -100)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "5"
                                                Bidding2 = 5
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1NT"
                                            }
                                        }

                                        if Bidding < 6 {
                                            Image("6B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -80)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "6"
                                                Bidding2 = 6
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2C"
                                            }
                                        }

                                        if Bidding < 7 {
                                            Image("7B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -80)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "7"
                                                Bidding2 = 7
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2D"
                                            }
                                        }

                                        if Bidding < 8 {
                                            Image("8B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -80)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "8"
                                                Bidding2 = 8
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2H"
                                            }
                                        }

                                        if Bidding < 9 {
                                            Image("9B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -80)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "9"
                                                Bidding2 = 9
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2S"
                                            }
                                        }

                                        if Bidding < 10 {
                                            Image("10B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -80)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "10"
                                                Bidding2 = 10
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2NT"
                                            }
                                        }

                                        if Bidding < 11 {
                                            Image("11B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -60)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "11"
                                                Bidding2 = 11
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3C"
                                            }
                                        }

                                        if Bidding < 12 {
                                            Image("12B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -60)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "12"
                                                Bidding2 = 12
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3D"
                                            }
                                        }

                                        if Bidding < 13 {
                                            Image("13B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -60)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "13"
                                                Bidding2 = 13
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3H"
                                            }
                                        }

                                        if Bidding < 14 {
                                            Image("14B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -60)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "14"
                                                Bidding2 = 14
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3S"
                                            }
                                        }

                                        if Bidding < 15 {
                                            Image("15B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -60)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "15"
                                                Bidding2 = 15
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3NT"
                                            }
                                        }

                                        if Bidding < 16 {
                                            Image("16B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -40)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "16"
                                                Bidding2 = 16
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4C"
                                            }
                                        }

                                        if Bidding < 17 {
                                            Image("17B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -40)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "17"
                                                Bidding2 = 17
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4D"
                                            }
                                        }

                                        if Bidding < 18 {
                                            Image("18B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -40)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "18"
                                                Bidding2 = 18
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4H"
                                            }
                                        }

                                        if Bidding < 19 {
                                            Image("19B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -40)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "19"
                                                Bidding2 = 19
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4S"
                                            }
                                        }

                                        if Bidding < 20 {
                                            Image("20B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -40)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "20"
                                                Bidding2 = 20
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4NT"
                                            }
                                        }

                                        if Bidding < 21 {
                                            Image("21B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "21"
                                                Bidding2 = 21
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5C"
                                            }
                                        }

                                        if Bidding < 22 {
                                            Image("22B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "22"
                                                Bidding2 = 22
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5D"
                                            }
                                        }

                                        if Bidding < 23 {
                                            Image("23B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "23"
                                                Bidding2 = 23
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5H"
                                            }
                                        }

                                        if Bidding < 24 {
                                            Image("24B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "24"
                                                Bidding2 = 24
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5S"
                                            }
                                        }

                                        if Bidding < 25 {
                                            Image("25B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "25"
                                                Bidding2 = 25
                                                Pass = 0

                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5NT"
                                            }
                                        }

                                        if Bidding < 26 {
                                            Image("26B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 0)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "26"
                                                Bidding2 = 26
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6C"
                                            }
                                        }

                                        if Bidding < 27 {
                                            Image("27B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 0)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "27"
                                                Bidding2 = 27
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6D"
                                            }
                                        }

                                        if Bidding < 28 {
                                            Image("28B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 0)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "28"
                                                Bidding2 = 28
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6H"
                                            }
                                        }

                                        if Bidding < 29 {
                                            Image("29B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 0)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "29"
                                                Bidding2 = 29
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6S"
                                            }
                                        }

                                        if Bidding < 30 {
                                            Image("30B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 0)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "30"
                                                Bidding2 = 30
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6NT"
                                            }
                                        }

                                        if Bidding < 31 {
                                            Image("31B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "31"
                                                Bidding2 = 31
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7C"
                                            }
                                        }

                                        if Bidding < 32 {
                                            Image("32B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "32"
                                                Bidding2 = 32
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7D"
                                            }
                                        }

                                        if Bidding < 33 {
                                            Image("33B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "33"
                                                Bidding2 = 33
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7H"
                                            }
                                        }

                                        if Bidding < 34 {
                                            Image("34B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "34"
                                                Bidding2 = 34
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7S"
                                            }
                                        }

                                        if Bidding < 35 {
                                            Image("35B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 20)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "35"
                                                Bidding2 = 35
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7NT"
                                            }
                                        }

                                        if RDblUSOK == 1 {
                                            Image("36B")
                                                .resizable()
                                                .frame(width: 30, height: 32)
                                                .position(x: 80, y: 39)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "36"

                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "rdbl"
                                            }
                                        }

                                        if DblUSOK == 1 {
                                            Image("38B")
                                                .resizable()
                                                .frame(width: 25, height: 32)
                                                .position(x: 144, y: 36)
                                                .rotationEffect(.degrees(270))
                                                .onTapGesture
                                            {
                                                selectedImage2 = "37"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 1
                                                Kontrak = "dbl"
                                            }
                                        }

                                        Image("37B")
                                            .resizable()
                                            .frame(width: 40, height: 45)
                                            .position(x: 112, y: 38)
                                            .rotationEffect(.degrees(270))
                                            .onTapGesture
                                        {
                                            selectedImage2 = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("39B")
                                            .resizable()
                                            .frame(width: 92, height: 105)
                                            .position(x: 111, y: 84)
                                            .rotationEffect(.degrees(270))
                                            .onTapGesture
                                        {
                                            selectedImage2 = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("SUBMIT")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .position(x: 250, y: 50)
                                            .rotationEffect(.degrees(270))
                                            .onTapGesture
                                        {
                                            if Kontrak != ""
                                            {
                                                if (Kontrak != "pass")
                                                {
                                                    if Opener == 0
                                                    {
                                                        Opener = 1
                                                    }
                                                    if (Kontrak == "dbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else if (Kontrak == "rdbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else
                                                    {
                                                        Kontrakfix = Kontrak
                                                    }
                                                }
                                                else
                                                {
                                                    Pass = Pass + 1
                                                }
                                                if ((Opening > 3 && Pass > 2) || (Opener == 1 && Pass > 2) || (Opening >= 3 && Pass >= 3))
                                                {
                                                    isTextVisible = false
                                                    isAssetSelectionVisible = false
                                                    
                                                    if Kontrakfix.isEmpty {
                                                        Kontrakfix = "All Pass"
                                                    } else {
                                                        // Modify Kontrakfix based on conditions
                                                        if Kontrakfix.contains("rdbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dblrdbl", with: "XX")
                                                        } else if Kontrakfix.contains("dbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dbl", with: "X")
                                                        }
                                                    }

                                                    // Menampilkan alert dengan informasi yang telah disiapkan
                                                    let alertController = UIAlertController(title: "Informasi Bidding", message: "Kontrak: \(Kontrakfix)\n", preferredStyle: .alert)
                                                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                    // Mendapatkan referensi dari view controller saat ini
                                                    if let currentViewController = UIApplication.shared.keyWindow?.rootViewController {
                                                        currentViewController.present(alertController, animated: true, completion: nil)
                                                    }
                                                }
                                                else
                                                {
                                                    currentPlayer = 3
                                                    Bidding = Bidding2
                                                    Opening = Opening + 1
                                                }

                                                DblUSOK = DblUS
                                                DblTBOK = DblTB
                                                RDblUSOK = RDblUS
                                                RDblTBOK = RDblTB

                                                if let selectedImage2 = selectedImage2, let intValue = Int(selectedImage2) {
                                                    // Assuming selectedImage is a string representation of an integer
                                                    selectedAssetsPlayer2.append(intValue)
                                                }
                                            }
                                            else
                                            {
                                                let alert = UIAlertController(title: "State",
                                                                              message: "Pilih Kartu",
                                                                              preferredStyle: .alert)

                                                // Menambahkan tombol OK ke alert
                                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                // Menampilkan alert
                                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                                            }
                                            Kontrak = ""
                                        }

                                        Image("UNDO")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .position(x: -30, y: 50)
                                            .rotationEffect(.degrees(270))
                                            .onTapGesture
                                        {
                                                if !selectedAssetsPlayer1.isEmpty {
                                                    var selectedArray = Array(selectedAssetsPlayer1)
                                                    selectedArray.removeLast()
                                                    selectedAssetsPlayer1 = Array(Set(selectedArray))
                                                    currentPlayer = 1

                                                    // Mengatur bidding berdasarkan kondisi yang Anda sebutkan
                                                    if selectedAssetsPlayer4.isEmpty {
                                                        Bidding = 0
                                                    }
                                                    else if let lastAsset = selectedAssetsPlayer4.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer3.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer2.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    }
                                                    guard let lastAssetPlayer4 = selectedAssetsPlayer4.max() else {
                                                                   return
                                                               }

                                                               // Mendapatkan nilai terakhir dari selectedAssetsPlayer2
                                                               let lastAssetPlayer3 = selectedAssetsPlayer3.max() ?? 0

                                                               // Logika berdasarkan kondisi nilai terakhir dari selectedAssetsPlayer3
                                                               if lastAssetPlayer4 != 36 && lastAssetPlayer4 != 37 && lastAssetPlayer4 != 38 && lastAssetPlayer4 != 39 {
                                                                   // Jika lastAssetPlayer3 tidak sama dengan 36, 37, 38, atau 39
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 1
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               } else if (lastAssetPlayer4 == 38 || lastAssetPlayer4 == 39) && (lastAssetPlayer3 == 36 || lastAssetPlayer3 == 37 || lastAssetPlayer3 == 38 || lastAssetPlayer3 == 39) {
                                                                   // Jika lastAssetPlayer3 adalah 37 atau 39 dan lastAssetPlayer2 adalah 36, 37, 38, atau 39
                                                                   if lastAssetPlayer3 == 38 || lastAssetPlayer3 == 39 {
                                                                       Pass = 0
                                                                       DblUSOK = 0
                                                                       DblTBOK = 1
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                                   else {
                                                                       Pass = 0
                                                                       DblUSOK = 0
                                                                       DblTBOK = 0
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                               } else if lastAssetPlayer4 == 37 {
                                                                   // Jika lastAssetPlayer3 adalah 36
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 1
                                                               } else {
                                                                   // Jika kondisi lainnya
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               }
                                                    currentPlayer = 1
                                                }
                                            }
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
                            .background(isLightMode ? Color(red: 0.06, green: 0.14, blue: 0.27).opacity(0.5) : Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
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

                                        if Bidding < 1 {
                                            Image("1B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 50)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "1"
                                                Bidding2 = 1
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1C"
                                            }
                                        }

                                        if Bidding < 2 {
                                            Image("2B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 50)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "2"
                                                Bidding2 = 2
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1D"
                                            }
                                        }

                                        if Bidding < 3 {
                                            Image("3B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 50)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "3"
                                                Bidding2 = 3
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1H"
                                            }
                                        }

                                        if Bidding < 4 {
                                            Image("4B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 50)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "4"
                                                Bidding2 = 4
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1S"
                                            }
                                        }

                                        if Bidding < 5 {
                                            Image("5B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 50)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "5"
                                                Bidding2 = 5
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1NT"
                                            }
                                        }

                                        if Bidding < 6 {
                                            Image("6B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 70)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "6"
                                                Bidding2 = 6
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2C"
                                            }
                                        }

                                        if Bidding < 7 {
                                            Image("7B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 70)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "7"
                                                Bidding2 = 7
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2D"
                                            }
                                        }

                                        if Bidding < 8 {
                                            Image("8B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 70)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "8"
                                                Bidding2 = 8
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2H"
                                            }
                                        }

                                        if Bidding < 9 {
                                            Image("9B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 70)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "9"
                                                Bidding2 = 9
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2S"
                                            }
                                        }

                                        if Bidding < 10 {
                                            Image("10B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 70)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "10"
                                                Bidding2 = 10
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2NT"
                                            }
                                        }

                                        if Bidding < 11 {
                                            Image("11B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 90)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "11"
                                                Bidding2 = 11
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3C"
                                            }
                                        }

                                        if Bidding < 12 {
                                            Image("12B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 90)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "12"
                                                Bidding2 = 12
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3D"
                                            }
                                        }

                                        if Bidding < 13 {
                                            Image("13B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 90)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "13"
                                                Bidding2 = 13
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3H"
                                            }
                                        }

                                        if Bidding < 14 {
                                            Image("14B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 90)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "14"
                                                Bidding2 = 14
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3S"
                                            }
                                        }

                                        if Bidding < 15 {
                                            Image("15B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 90)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "15"
                                                Bidding2 = 15
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3NT"
                                            }
                                        }

                                        if Bidding < 16 {
                                            Image("16B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 110)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "16"
                                                Bidding2 = 16
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4C"
                                            }
                                        }

                                        if Bidding < 17 {
                                            Image("17B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 110)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "17"
                                                Bidding2 = 17
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4D"
                                            }
                                        }

                                        if Bidding < 18 {
                                            Image("18B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 110)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "18"
                                                Bidding2 = 18
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4H"
                                            }
                                        }

                                        if Bidding < 19 {
                                            Image("19B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 110)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "19"
                                                Bidding2 = 19
                                                Pass = 0

                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4S"
                                            }
                                        }

                                        if Bidding < 20 {
                                            Image("20B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 110)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "20"
                                                Bidding2 = 20
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4NT"
                                            }
                                        }

                                        if Bidding < 21 {
                                            Image("21B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 130)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "21"
                                                Bidding2 = 21
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5C"
                                            }
                                        }

                                        if Bidding < 22 {
                                            Image("22B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 130)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "22"
                                                Bidding2 = 22
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5D"
                                            }
                                        }

                                        if Bidding < 23 {
                                            Image("23B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 130)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "23"
                                                Bidding2 = 23
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5H"
                                            }
                                        }

                                        if Bidding < 24 {
                                            Image("24B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 130)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "24"
                                                Bidding2 = 24
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5S"
                                            }
                                        }

                                        if Bidding < 25 {
                                            Image("25B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 130)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "25"
                                                Bidding2 = 25
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5NT"
                                            }
                                        }

                                        if Bidding < 26 {
                                            Image("26B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 150)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "26"
                                                Bidding2 = 26
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6C"
                                            }
                                        }

                                        if Bidding < 27 {
                                            Image("27B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 150)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "27"
                                                Bidding2 = 27
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6D"
                                            }
                                        }

                                        if Bidding < 28 {
                                            Image("28B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 150)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "28"
                                                Bidding2 = 28
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6H"
                                            }
                                        }

                                        if Bidding < 29 {
                                            Image("29B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 150)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "29"
                                                Bidding2 = 29
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6S"
                                            }
                                        }

                                        if Bidding < 30 {
                                            Image("30B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 150)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "30"
                                                Bidding2 = 30
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6NT"
                                            }
                                        }

                                        if Bidding < 31 {
                                            Image("31B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 170)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "31"
                                                Bidding2 = 31
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7C"
                                            }
                                        }

                                        if Bidding < 32 {
                                            Image("32B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 170)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "32"
                                                Bidding2 = 32
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7D"
                                            }
                                        }

                                        if Bidding < 33 {
                                            Image("33B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 170)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "33"
                                                Bidding2 = 33
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7H"
                                            }
                                        }

                                        if Bidding < 34 {
                                            Image("34B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 170)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "34"
                                                Bidding2 = 34
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7S"
                                            }
                                        }

                                        if Bidding < 35 {
                                            Image("35B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 170)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "35"
                                                Bidding2 = 35
                                                Pass = 0
                                                Pass = 0
                                                DblUS = 1
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7NT"
                                            }
                                        }

                                        if RDblTBOK == 1 {
                                            Image("36B")
                                                .resizable()
                                                .frame(width: 30, height: 32)
                                                .position(x: 80, y: 189)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "36"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "rdbl"
                                            }
                                        }

                                        if DblTBOK == 1 {
                                            Image("38B")
                                                .resizable()
                                                .frame(width: 25, height: 32)
                                                .position(x: 144, y: 186)
                                                .rotationEffect(.degrees(0))
                                                .onTapGesture
                                            {
                                                selectedImage3 = "37"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 1
                                                RDblTB = 0
                                                Kontrak = "dbl"
                                            }
                                        }

                                        Image("37B")
                                            .resizable()
                                            .frame(width: 40, height: 45)
                                            .position(x: 112, y: 188)
                                            .rotationEffect(.degrees(0))
                                            .onTapGesture
                                        {
                                            selectedImage3 = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("39B")
                                            .resizable()
                                            .frame(width: 92, height: 105)
                                            .position(x: 111, y: 234)
                                            .rotationEffect(.degrees(0))
                                            .onTapGesture
                                        {
                                            selectedImage3 = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("SUBMIT")
                                            .resizable()
                                            .frame(width: 92, height: 90)
                                            .position(x: 111, y: 0)
                                            .rotationEffect(.degrees(0))
                                            .onTapGesture
                                        {
                                            if Kontrak != ""
                                            {
                                                if (Kontrak != "pass")
                                                {
                                                    if Opener == 0
                                                    {
                                                        Opener = 1
                                                    }
                                                    if (Kontrak == "dbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else if (Kontrak == "rdbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else
                                                    {
                                                        Kontrakfix = Kontrak
                                                    }
                                                }
                                                else
                                                {
                                                    Pass = Pass + 1
                                                }
                                                if ((Opening > 3 && Pass > 2) || (Opener == 1 && Pass > 2) || (Opening >= 3 && Pass >= 3))
                                                {
                                                    isTextVisible = false
                                                    isAssetSelectionVisible = false
                                                    
                                                    if Kontrakfix.isEmpty {
                                                        Kontrakfix = "All Pass"
                                                    } else {
                                                        // Modify Kontrakfix based on conditions
                                                        if Kontrakfix.contains("rdbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dblrdbl", with: "XX")
                                                        } else if Kontrakfix.contains("dbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dbl", with: "X")
                                                        }
                                                    }

                                                    // Menampilkan alert dengan informasi yang telah disiapkan
                                                    let alertController = UIAlertController(title: "Informasi Bidding", message: "Kontrak: \(Kontrakfix)\n", preferredStyle: .alert)
                                                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                    // Mendapatkan referensi dari view controller saat ini
                                                    if let currentViewController = UIApplication.shared.keyWindow?.rootViewController {
                                                        currentViewController.present(alertController, animated: true, completion: nil)
                                                    }
                                                }
                                                else
                                                {
                                                    currentPlayer = 4
                                                    Bidding = Bidding2
                                                    Opening = Opening + 1
                                                }
                                                DblUSOK = DblUS
                                                DblTBOK = DblTB
                                                RDblUSOK = RDblUS
                                                RDblTBOK = RDblTB

                                                if let selectedImage3 = selectedImage3, let intValue = Int(selectedImage3) {
                                                    // Assuming selectedImage is a string representation of an integer
                                                    selectedAssetsPlayer3.append(intValue)
                                                }

                                            }
                                            else
                                            {
                                                let alert = UIAlertController(title: "State",
                                                                              message: "Pilih Kartu",
                                                                              preferredStyle: .alert)

                                                // Menambahkan tombol OK ke alert
                                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                // Menampilkan alert
                                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                                            }
                                            Kontrak = ""
                                        }

                                        Image("UNDO")
                                            .resizable()
                                            .frame(width: 92, height: 90)
                                            .position(x: 111, y: -50)
                                            .rotationEffect(.degrees(0))
                                            .onTapGesture {
                                                if !selectedAssetsPlayer2.isEmpty {
                                                    var selectedArray = Array(selectedAssetsPlayer2)
                                                    selectedArray.removeLast()
                                                    selectedAssetsPlayer2 = Array(Set(selectedArray))
                                                    currentPlayer = 2

                                                    // Mengatur bidding berdasarkan kondisi yang Anda sebutkan
                                                    if selectedAssetsPlayer1.isEmpty {
                                                        Bidding = 0
                                                    }
                                                    else if let lastAsset = selectedAssetsPlayer1.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer4.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer3.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    }
                                                    guard let lastAssetPlayer1 = selectedAssetsPlayer1.max() else {
                                                                   return
                                                               }

                                                               // Mendapatkan nilai terakhir dari selectedAssetsPlayer2
                                                               let lastAssetPlayer4 = selectedAssetsPlayer4.max() ?? 0

                                                               // Logika berdasarkan kondisi nilai terakhir dari selectedAssetsPlayer3
                                                               if lastAssetPlayer1 != 36 && lastAssetPlayer1 != 37 && lastAssetPlayer1 != 38 && lastAssetPlayer1 != 39 {
                                                                   // Jika lastAssetPlayer3 tidak sama dengan 36, 37, 38, atau 39
                                                                   Pass = 0
                                                                   DblUSOK = 1
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               } else if (lastAssetPlayer1 == 38 || lastAssetPlayer1 == 39) && (lastAssetPlayer4 == 36 || lastAssetPlayer4 == 37 || lastAssetPlayer4 == 38 || lastAssetPlayer4 == 39) {
                                                                   // Jika lastAssetPlayer3 adalah 37 atau 39 dan lastAssetPlayer2 adalah 36, 37, 38, atau 39
                                                                   if lastAssetPlayer4 == 38 || lastAssetPlayer4 == 39 {
                                                                       Pass = 0
                                                                       DblUSOK = 1
                                                                       DblTBOK = 0
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                                   else {
                                                                       Pass = 0
                                                                       DblUSOK = 0
                                                                       DblTBOK = 0
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                               } else if lastAssetPlayer1 == 37 {
                                                                   // Jika lastAssetPlayer3 adalah 36
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 1
                                                                   RDblTBOK = 0
                                                               } else {
                                                                   // Jika kondisi lainnya
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               }
                                                    currentPlayer = 2
                                                }
                                            }
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
                            .background(isLightMode ? Color(red: 0.06, green: 0.14, blue: 0.27).opacity(0.5) : Color(red: 16/255, green: 37/255, blue: 68/255, opacity: 0.5))
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

                                        if Bidding < 1 {
                                            Image("1B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -110)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "1"
                                                Bidding2 = 1
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1C"
                                            }
                                        }

                                        if Bidding < 2 {
                                            Image("2B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -110)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "2"
                                                Bidding2 = 2
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1D"
                                            }
                                        }

                                        if Bidding < 3 {
                                            Image("3B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -110)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "3"
                                                Bidding2 = 3
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1H"
                                            }
                                        }

                                        if Bidding < 4 {
                                            Image("4B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -110)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "4"
                                                Bidding2 = 4
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1S"
                                            }
                                        }

                                        if Bidding < 5 {
                                            Image("5B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -110)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "5"
                                                Bidding2 = 5
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "1NT"
                                            }
                                        }

                                        if Bidding < 6 {
                                            Image("6B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -90)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "6"
                                                Bidding2 = 6
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2C"
                                            }
                                        }

                                        if Bidding < 7 {
                                            Image("7B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -90)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "7"
                                                Bidding2 = 7
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2D"
                                            }
                                        }

                                        if Bidding < 8 {
                                            Image("8B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -90)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "8"
                                                Bidding2 = 8
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2H"
                                            }
                                        }

                                        if Bidding < 9 {
                                            Image("9B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -90)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "9"
                                                Bidding2 = 9
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2S"
                                            }
                                        }

                                        if Bidding < 10 {
                                            Image("10B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -90)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "10"
                                                Bidding2 = 10
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "2NT"
                                            }
                                        }

                                        if Bidding < 11 {
                                            Image("11B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -70)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "11"
                                                Bidding2 = 11
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3C"
                                            }
                                        }

                                        if Bidding < 12 {
                                            Image("12B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -70)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "12"
                                                Bidding2 = 12
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3D"
                                            }
                                        }

                                        if Bidding < 13 {
                                            Image("13B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -70)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "13"
                                                Bidding2 = 13
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3H"
                                            }
                                        }

                                        if Bidding < 14 {
                                            Image("14B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -70)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "14"
                                                Bidding2 = 14
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3S"
                                            }
                                        }

                                        if Bidding < 15 {
                                            Image("15B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -70)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "15"
                                                Bidding2 = 15
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "3NT"
                                            }
                                        }

                                        if Bidding < 16 {
                                            Image("16B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -50)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "16"
                                                Bidding2 = 16
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4C"
                                            }
                                        }

                                        if Bidding < 17 {
                                            Image("17B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -50)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "17"
                                                Bidding2 = 17
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4D"
                                            }
                                        }

                                        if Bidding < 18 {
                                            Image("18B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -50)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "18"
                                                Bidding2 = 18
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4H"
                                            }
                                        }

                                        if Bidding < 19 {
                                            Image("19B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -50)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "19"
                                                Bidding2 = 19
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4S"
                                            }
                                        }

                                        if Bidding < 20 {
                                            Image("20B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -50)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "20"
                                                Bidding2 = 20
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "4NT"
                                            }
                                        }

                                        if Bidding < 21 {
                                            Image("21B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -30)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "21"
                                                Bidding2 = 21
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5C"
                                            }
                                        }

                                        if Bidding < 22 {
                                            Image("22B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -30)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "22"
                                                Bidding2 = 22
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5D"
                                            }
                                        }

                                        if Bidding < 23 {
                                            Image("23B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -30)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "23"
                                                Bidding2 = 23
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5H"
                                            }
                                        }

                                        if Bidding < 24 {
                                            Image("24B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -30)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "24"
                                                Bidding2 = 24
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5S"
                                            }
                                        }

                                        if Bidding < 25 {
                                            Image("25B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -30)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "25"
                                                Bidding2 = 25
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "5NT"
                                            }
                                        }

                                        if Bidding < 26 {
                                            Image("26B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: -10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "26"
                                                Bidding2 = 26
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6C"
                                            }
                                        }

                                        if Bidding < 27 {
                                            Image("27B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: -10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "27"
                                                Bidding2 = 27
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6D"
                                            }
                                        }

                                        if Bidding < 28 {
                                            Image("28B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: -10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "28"
                                                Bidding2 = 28
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6H"
                                            }
                                        }

                                        if Bidding < 29 {
                                            Image("29B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: -10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "29"
                                                Bidding2 = 29
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6S"
                                            }
                                        }

                                        if Bidding < 30 {
                                            Image("30B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: -10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "30"
                                                Bidding2 = 30
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "6NT"
                                            }
                                        }

                                        if Bidding < 31 {
                                            Image("31B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 75, y: 10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "31"
                                                Bidding2 = 31
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7C"
                                            }
                                        }

                                        if Bidding < 32 {
                                            Image("32B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 93, y: 10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "32"
                                                Bidding2 = 32
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7D"
                                            }
                                        }

                                        if Bidding < 33 {
                                            Image("33B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 111, y: 10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "33"
                                                Bidding2 = 33
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7H"
                                            }
                                        }

                                        if Bidding < 34 {
                                            Image("34B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 129, y: 10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "34"
                                                Bidding2 = 34
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7S"
                                            }
                                        }

                                        if Bidding < 35 {
                                            Image("35B")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .position(x: 147, y: 10)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "35"
                                                Bidding2 = 35
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 1
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "7NT"
                                            }
                                        }

                                        if RDblUSOK == 1 {
                                            Image("36B")
                                                .resizable()
                                                .frame(width: 30, height: 32)
                                                .position(x: 80, y: 29)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "36"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 0
                                                Kontrak = "rdbl"
                                            }
                                        }

                                        if DblUSOK == 1 {
                                            Image("38B")
                                                .resizable()
                                                .frame(width: 25, height: 32)
                                                .position(x: 144, y: 26)
                                                .rotationEffect(.degrees(90))
                                                .onTapGesture
                                            {
                                                selectedImage4 = "37"
                                                Pass = 0
                                                DblUS = 0
                                                DblTB = 0
                                                RDblUS = 0
                                                RDblTB = 1
                                                Kontrak = "dbl"
                                            }
                                        }

                                        Image("37B")
                                            .resizable()
                                            .frame(width: 40, height: 45)
                                            .position(x: 112, y: 28)
                                            .rotationEffect(.degrees(90))
                                            .onTapGesture
                                        {
                                            selectedImage4 = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("39B")
                                            .resizable()
                                            .frame(width: 92, height: 105)
                                            .position(x: 111, y: 74)
                                            .rotationEffect(.degrees(90))
                                            .onTapGesture
                                        {
                                            selectedImage4 = "38"
                                            print("pass")
                                            Kontrak = "pass"
                                        }

                                        Image("SUBMIT")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .position(x: 250, y: 30)
                                            .rotationEffect(.degrees(90))
                                            .onTapGesture
                                        {
                                            if Kontrak != ""
                                            {
                                                if (Kontrak != "pass")
                                                {
                                                    if Opener == 0
                                                    {
                                                        Opener = 1
                                                    }
                                                    if (Kontrak == "dbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else if (Kontrak == "rdbl")
                                                    {
                                                        Kontrakfix = Kontrakfix + Kontrak
                                                    }
                                                    else
                                                    {
                                                        Kontrakfix = Kontrak
                                                    }
                                                }
                                                else
                                                {
                                                    Pass = Pass + 1
                                                }
                                                if ((Opening > 3 && Pass > 2) || (Opener == 1 && Pass > 2) || (Opening >= 3 && Pass >= 3))
                                                {
                                                    isTextVisible = false
                                                    isAssetSelectionVisible = false

                                                    if Kontrakfix.isEmpty {
                                                        Kontrakfix = "All Pass"
                                                    } else {
                                                        // Modify Kontrakfix based on conditions
                                                        if Kontrakfix.contains("rdbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dblrdbl", with: "XX")
                                                        } else if Kontrakfix.contains("dbl") {
                                                            Kontrakfix = Kontrakfix.replacingOccurrences(of: "dbl", with: "X")
                                                        }
                                                    }

                                                    // Menampilkan alert dengan informasi yang telah disiapkan
                                                    let alertController = UIAlertController(title: "Informasi Bidding", message: "Kontrak: \(Kontrakfix)\n", preferredStyle: .alert)
                                                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                    // Mendapatkan referensi dari view controller saat ini
                                                    if let currentViewController = UIApplication.shared.keyWindow?.rootViewController {
                                                        currentViewController.present(alertController, animated: true, completion: nil)
                                                    }
                                                }
                                                else
                                                {
                                                    currentPlayer = 1
                                                    Bidding = Bidding2
                                                    Opening = Opening + 1
                                                }
                                                DblUSOK = DblUS
                                                DblTBOK = DblTB
                                                RDblUSOK = RDblUS
                                                RDblTBOK = RDblTB

                                                if let selectedImage4 = selectedImage4, let intValue = Int(selectedImage4) {
                                                    // Assuming selectedImage is a string representation of an integer
                                                    selectedAssetsPlayer4.append(intValue)
                                                }
                                            }
                                            else
                                            {
                                                let alert = UIAlertController(title: "State",
                                                                              message: "Pilih Kartu",
                                                                              preferredStyle: .alert)

                                                // Menambahkan tombol OK ke alert
                                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                                // Menampilkan alert
                                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                                            }

                                            Kontrak = ""
                                        }

                                        Image("UNDO")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .position(x: -30, y: 30)
                                            .rotationEffect(.degrees(90))
                                            .onTapGesture {
                                                if !selectedAssetsPlayer3.isEmpty {
                                                    var selectedArray = Array(selectedAssetsPlayer3)
                                                    selectedArray.removeLast()
                                                    selectedAssetsPlayer3 = Array(Set(selectedArray))
                                                    currentPlayer = 3

                                                    // Mengatur bidding berdasarkan kondisi yang Anda sebutkan
                                                    if selectedAssetsPlayer2.isEmpty {
                                                        Bidding = 0
                                                    }
                                                    else if let lastAsset = selectedAssetsPlayer2.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer1.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    } else if let lastAsset = selectedAssetsPlayer4.filter { ![36, 37, 38, 39].contains($0) }.max() {
                                                        Bidding = lastAsset
                                                    }
                                                    guard let lastAssetPlayer2 = selectedAssetsPlayer2.max() else {
                                                                   return
                                                               }

                                                               // Mendapatkan nilai terakhir dari selectedAssetsPlayer2
                                                               let lastAssetPlayer1 = selectedAssetsPlayer1.max() ?? 0

                                                               // Logika berdasarkan kondisi nilai terakhir dari selectedAssetsPlayer3
                                                               if lastAssetPlayer2 != 36 && lastAssetPlayer2 != 37 && lastAssetPlayer2 != 38 && lastAssetPlayer2 != 39 {
                                                                   // Jika lastAssetPlayer3 tidak sama dengan 36, 37, 38, atau 39
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 1
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               } else if (lastAssetPlayer2 == 38 || lastAssetPlayer2 == 39) && (lastAssetPlayer1 == 36 || lastAssetPlayer1 == 37 || lastAssetPlayer1 == 38 || lastAssetPlayer1 == 39) {
                                                                   // Jika lastAssetPlayer3 adalah 37 atau 39 dan lastAssetPlayer2 adalah 36, 37, 38, atau 39
                                                                   if lastAssetPlayer1 == 38 || lastAssetPlayer1 == 39 {
                                                                       Pass = 0
                                                                       DblUSOK = 0
                                                                       DblTBOK = 1
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                                   else {
                                                                       Pass = 0
                                                                       DblUSOK = 0
                                                                       DblTBOK = 0
                                                                       RDblUSOK = 0
                                                                       RDblTBOK = 0
                                                                   }
                                                               } else if lastAssetPlayer2 == 37 {
                                                                   // Jika lastAssetPlayer3 adalah 36
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 1
                                                               } else {
                                                                   // Jika kondisi lainnya
                                                                   Pass = 0
                                                                   DblUSOK = 0
                                                                   DblTBOK = 0
                                                                   RDblUSOK = 0
                                                                   RDblTBOK = 0
                                                               }
                                                    currentPlayer = 3

                                                }
                                            }
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

            }
            .frame(width: 393, height: 852)
            .background( isLightMode ?
                    LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 0.55, green: 0.7, blue: 0.9), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.57, green: 0.75, blue: 0.89), location: 0.48),
                    Gradient.Stop(color: Color(red: 0.72, green: 0.96, blue: 1), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.03, y: 0.02),
                    endPoint: UnitPoint(x: 1.08, y: 1.08)
                    ) : LinearGradient(
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


    // Helper function to get selected assets for a specific player
    private func selectedAssets(for player: Int) -> [Int] {
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
//
//#Preview {
//    BiddingView()
//}
