//
//  Calculator.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 24/12/23.
//

import SwiftUI

struct Calculator: View {
    @State private var colorScheme: ColorScheme = .dark
    @Binding var isLightMode: Bool
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isVulSelected = false
    @State private var selectedCardType: String = ""
    @State private var selectedNumber: Int = 0
    @State private var selectedNumberString: String = ""
    @State private var selected: String = ""
    @State private var selectedIMP: Int = 0
    @State private var selectedInt: Int = 0
    @State private var countVul: Int = 0
    @State private var selectedOperation: String = ""
    @State private var isDoubleSelected = false
    @State private var isRedoubleSelected = false
    @State private var selectedResult: Int = 0
    @State private var selectedResultString: String = ""
    @State private var Result: String = ""
    @State private var Result2: String = ""
    @State private var ResultScore: String = ""
    @State private var selectedNumber1: Int = 0
    @State private var selectedNumberString1: String = ""
    @State private var selected1: String = "0"
    @State private var selectedInt1: Int = 0
    @State private var hitungscore: Int = 0
    @State private var angkascore: Int = 0
    @State private var isBoardsSelected = true
    @State private var isIMPSelected = false
    @State private var isOperationSelected = false
    @State private var isScoreSelected = true
    @State private var isIMPSselected = false
    @State private var isVPSelected = false
    
    init(isLightMode: Binding<Bool>) {
        _isLightMode = isLightMode
    }
    
    var body: some View {
        
        if isScoreSelected == true {
            if countVul == 0 || selectedNumber == 0 || selectedCardType == ""
            {
                ZStack{
                    //background
//                    Image("Ellipse 1")
//                        .frame(width: 1277.08508, height: 862.28662)

//                        .blur(radius: 182)
//                        .rotationEffect(Angle(degrees: -15))
//                        .position(CGPoint(x: widthLayar * 0.9, y: heightLayar * 0.7))
                    
                    
                    // kotak kalkulator
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 423, height: 537)
                        .background(isLightMode ?
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                            Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
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
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.1), radius: 35, x: 0, y: -5)
                        .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.63))
                    
                    createTabLabels()
                    
                    // kotak vul non vul
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 355, height: 70)
                        .background(.white.opacity(0.3))
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
                        .position(CGPoint(x: widthLayar * 0.49, y: heightLayar * 0.41))
                    
                    Text("VUL")
                        .font(
                            Font.custom("Poppins", size: 26)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.27, y: heightLayar * 0.412))
                        .onTapGesture {
                            isVulSelected = true
                            countVul = countVul + 1
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                        }
                    
                    Text("NON VUL")
                        .font(
                            Font.custom("Poppins", size: 26)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 150, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.71, y: heightLayar * 0.412))
                        .onTapGesture {
                            isVulSelected = false
                            countVul = countVul + 1
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                            
                        }
                    
                    Text(selected)
                        .font(
                            Font.custom("Poppins", size: 35)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(isVulSelected ? Color.red : (isLightMode ? .black : .white))
                        .frame(width: 355, height: 35, alignment: .trailing)
                        .position(CGPoint(x: widthLayar * 0.4, y: heightLayar * 0.25)) //OKE
                    
                    createNumberButton(1, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.12, positionY: 0.51)
                    createNumberButton(2, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.37, positionY: 0.51)
                    createNumberButton(3, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.61, positionY: 0.51)
                    createNumberButton(4, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.86, positionY: 0.51)
                    createNumberButton(5, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.12, positionY: 0.612)
                    createNumberButton(6, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.37, positionY: 0.612)
                    createNumberButton(7, selectedCardType: selectedCardType, imageName: "CIRCLE", positionX: 0.61, positionY: 0.612)
                    
                    
                    Image("CIRCLE")
                        .frame(width: 70, height: 70)
                        .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.612))
                    Text("NT")
                        .font(
                            Font.custom("Poppins", size: 26)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.612))
                        .onTapGesture {
                            selectedCardType = "NT"
                            selected = String(selectedNumber) + selectedCardType
                            Result2 = "NT"
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                            
                        }
                    createCardImage(imageName: "SPADE", cardType: "♠️", positionX: 0.873, positionY: 0.767)
                    
                    createCardImage(imageName: "DIAMOND", cardType: "♦️", positionX: 0.632, positionY: 0.767)
                    
                    createCardImage(imageName: "HEART", cardType: "♥️", positionX: 0.37, positionY: 0.767)
                    
                    createCardImage(imageName: "CLUB", cardType: "♣️", positionX: 0.126, positionY: 0.767)
                    
                }
                .background(isLightMode ?
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color.white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.69, green: 0.85, blue: 0.92), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            ) : LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.22, green: 0.22, blue: 0.22), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.15, green: 0.15, blue: 0.16), location: 0.23),
                                    Gradient.Stop(color: Color(red: 0, green: 0.01, blue: 0.03), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: 0),
                                endPoint: UnitPoint(x: 1, y: 1)
                            )
                            
                )
            }
            else
            {
                ZStack{
                    // kotak kalkulator
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 423, height: 537)
                        .background(isLightMode ?
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
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
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.1), radius: 35, x: 0, y: -5)
                        .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.73))

                    Image("rectangle6")
                        .frame(width: 69, height: 259)
                        .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
                        .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.6))
                    
                    createTabLabels()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 270, height: 70)
                        .background(isLightMode ? .white.opacity(0.3) : (Color(red: 0.02, green: 0.02, blue: 0.02).opacity(0.3)))
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
                        .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.498)) //OKE

                    createCalculationButton(1, posX: 0.12, posY: 0.61)
                    createCalculationButton(2, posX: 0.37, posY: 0.61)
                    createCalculationButton(3, posX: 0.61, posY: 0.61)
                    createCalculationButton(4, posX: 0.12, posY: 0.712)
                    createCalculationButton(5, posX: 0.37, posY: 0.712)
                    createCalculationButton(6, posX: 0.61, posY: 0.712)
                    createCalculationButton(7, posX: 0.12, posY: 0.814)
                    createCalculationButton(8, posX: 0.37, posY: 0.814)
                    createCalculationButton(9, posX: 0.61, posY: 0.814)
                    createCalculationButton(0, posX: 0.86, posY: 0.814)
                    
                    Image("akar-icons_backspace-2")
                        .frame(width: 28, height: 33)
                        .background(isLightMode ? .black.opacity(0) : .white)
                        .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.51))
                        .onTapGesture {
                            isDoubleSelected = false
                            isRedoubleSelected = false
                            selectedResultString = String(selectedResult)
                            if !selectedResultString.isEmpty {
                                selectedResultString = String(selectedResultString.dropLast())
                            }
                            Result = selected + selectedOperation + selectedResultString
                            if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                                Result = selected + selectedOperation + selectedResultString
                                selectedResult = selectedResult / 10
                                
                            }
                            else {
                                Result = selected + selectedOperation
                            }
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                        }
                    
                    Text("+")
                        .font(
                            Font.custom("Poppins", size: 48)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.495))
                        .onTapGesture {
                            selectedOperation = "+"
                            isOperationSelected = true
                            selectedResult = 0
                            if isDoubleSelected == true {
                                Result = selected + "X" + selectedOperation + "0"

                            }
                            else if isRedoubleSelected == true {
                                Result = selected + "XX" + selectedOperation + "0"

                            }
                            else {
                                Result = selected + selectedOperation + "0"
                            }
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                            
                        }
                    
                    Text("-")
                        .font(
                            Font.custom("Poppins", size: 48)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.495))
                        .onTapGesture {
                            selectedOperation = "-"
                            selectedResult = 0
                            isOperationSelected = true
                            if isDoubleSelected == true {
                                Result = selected + "X" + selectedOperation + "0"

                            }
                            else if isRedoubleSelected == true {
                                Result = selected + "XX" + selectedOperation + "0"

                            }
                            else {
                                Result = selected + selectedOperation + "0"

                            }
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                        }
                    
                    Text("=")
                        .font(
                            Font.custom("Poppins", size: 48)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.495))
                        .onTapGesture {
                            selectedOperation = "="
                            isOperationSelected = true
                            if isDoubleSelected == true {
                                Result = selected + "X" + selectedOperation

                            }
                            else if isRedoubleSelected == true {
                                Result = selected + "XX" + selectedOperation

                            }
                            else {
                                Result = selected + selectedOperation

                            }
                            selectedResult = 0
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                        }
                    
                    Text("X")
                        .font(
                            Font.custom("Poppins", size: 26)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.61))
                        .onTapGesture {
                            
                            isDoubleSelected.toggle()
                            isRedoubleSelected = false
                            if isDoubleSelected == true {
                                if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                                else {
                                    selectedResult = 0
                                    Result = selected + "X" + selectedOperation
                                }
                            }
                            else {
                                Result = selected + selectedOperation + String(selectedResult)
                            }
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                        }

                    Text("XX")
                        .font(
                            Font.custom("Poppins", size: 26)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0, green: 0.16, blue: 1))
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.712))
                        .onTapGesture {
                            isRedoubleSelected.toggle()
                            isDoubleSelected = false
                            if isRedoubleSelected == true {
                                if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                                
                                else {
                                    selectedResult = 0
                                    Result = selected + "XX" + selectedOperation
                                }
                            }
                            else {
                                Result = selected + selectedOperation + String(selectedResult)
                            }
                            calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)
                        }

                    Text("=")
                        .font(
                            Font.custom("Poppins", size: 26)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.35))

                    Text(String(hitungscore))
                        .font(
                            Font.custom("Poppins", size: 40)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(isLightMode ? .black : .white)
                        .frame(width: 165, height: 70, alignment: .trailing)
                        .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.35))

                    
            
                    Text(Result.isEmpty ? selected : Result)
                        .font(
                            Font.custom("Poppins", size: 64)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(isVulSelected ? Color.red : Color.black)
                        .frame(width: 300, height: 70, alignment: .trailing)
                        .position(CGPoint(x: widthLayar * 0.6, y: heightLayar * 0.25))
                }
            }
        }
        
        else if isIMPSselected == true {
            ZStack{
                // kotak kalkulator
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 423, height: 537)
                    .background(isLightMode ?
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ) :
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
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.1), radius: 35, x: 0, y: -5)
                    .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.83))
                
                createTabLabels()
                
                Image("Rectangle 4")
                    .frame(width: 73, height: 160)
                    .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
                    .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.66))

                Image("akar-icons_backspace")
                    .frame(width: 28, height: 33)
                    .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.61))
                    .onTapGesture {
                        if !selected.isEmpty {
                            selected.removeLast()
                        }
                        if selected.isEmpty {
                            selected = "0"
                        }
                    }

                Text("AC")
                    .font(
                        Font.custom("Poppins", size: 26)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(isLightMode ? Color(red: 0.04, green: 0.04, blue: 0.04) : .white)
                    .frame(width: 70, height: 70, alignment: .center)
                    .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.712))
                    .onTapGesture {
                        selectedNumber = 0
                        selected = "0"
                    }

                createNumberButton(1, positionX: 0.12, positionY: 0.61)
                createNumberButton(2, positionX: 0.37, positionY: 0.61)
                createNumberButton(3, positionX: 0.61, positionY: 0.61)
                createNumberButton(4, positionX: 0.12, positionY: 0.712)
                createNumberButton(5, positionX: 0.37, positionY: 0.712)
                createNumberButton(6, positionX: 0.61, positionY: 0.712)
                createNumberButton(7, positionX: 0.12, positionY: 0.814)
                createNumberButton(8, positionX: 0.37, positionY: 0.814)
                createNumberButton(9, positionX: 0.61, positionY: 0.814)
                createNumberButton(0, positionX: 0.86, positionY: 0.814)

                Text("=")
                    .font(
                        Font.custom("Poppins", size: 26)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 70, height: 70, alignment: .center)
                    .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.45))
                
                Text(convertSelectedToInt(selected: selected))
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 165, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.45))
                
                
                Text(selected)
                    .font(
                        Font.custom("Poppins", size: 64)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 500, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.3, y: heightLayar * 0.35))
            }
            .background(isLightMode ? .white : .black)
        }
        else
        {
            ZStack{
                // kotak kalkulator
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 423, height: 537)
                    .background(isLightMode ?
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ) :
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
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.1), radius: 35, x: 0, y: -5)
                    .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.83))
                
                Image("Rectangle 4")
                    .frame(width: 73, height: 160)
                    .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
                    .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.66))
                
                createTabLabels()
                
                Image("akar-icons_backspace")
                    .frame(width: 28, height: 33)
                    .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.61))
                    .onTapGesture {
                        if isBoardsSelected == true {
                            if !selected.isEmpty {
                                selected.removeLast()
                            }
                            if selected.isEmpty {
                                selected = "0"
                            }
                        }
                        else {
                            if !selected1.isEmpty {
                                selected1.removeLast()
                            }
                            if selected1.isEmpty {
                                selected1 = "0"
                            }
                        }
                    }

                Text("AC")
                    .font(
                        Font.custom("Poppins", size: 26)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(isLightMode ? Color(red: 0.04, green: 0.04, blue: 0.04) : .white)
                    .frame(width: 70, height: 70, alignment: .center)
                    .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.712))
                    .onTapGesture {
                        selected = "0"
                        selected1 = "0"
                    }

                createNumberButtonn(1, positionX: 0.12, positionY: 0.61)
                createNumberButtonn(2, positionX: 0.37, positionY: 0.61)
                createNumberButtonn(3, positionX: 0.61, positionY: 0.61)
                createNumberButtonn(4, positionX: 0.12, positionY: 0.712)
                createNumberButtonn(5, positionX: 0.37, positionY: 0.712)
                createNumberButtonn(6, positionX: 0.61, positionY: 0.712)
                createNumberButtonn(7, positionX: 0.12, positionY: 0.814)
                createNumberButtonn(8, positionX: 0.37, positionY: 0.814)
                createNumberButtonn(9, positionX: 0.61, positionY: 0.814)
                createNumberButtonn(0, positionX: 0.86, positionY: 0.814)

                Text("=")
                    .font(
                        Font.custom("Poppins", size: 26)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 70, height: 70, alignment: .center)
                    .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.45))
                
                Text((calculateVP(board: selected, imp: selected1)))
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 300, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.6, y: heightLayar * 0.45))

                Text("IMPs")
                    .font(
                        Font.custom("Poppins", size: 32)
                            .weight(.semibold)
                    )
                    .foregroundColor(isLightMode ?.black:.white)
                    .frame(width: 150, height: 70, alignment: .leading)
                    .position(CGPoint(x: widthLayar * 0.25, y: heightLayar * 0.3))
                
                Text(selected1)
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isIMPSelected ? .yellow : (isLightMode ? .black : .white))
                    .frame(width: 165, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.3))
                    .onTapGesture {
                        // Ubah warna teks menjadi kuning
                        isIMPSelected = true
                        isBoardsSelected = false
                    }

                Text("Boards")
                    .font(
                        Font.custom("Poppins", size: 32)
                            .weight(.semibold)
                    )
                    .foregroundColor(isLightMode ? .black:.white)
                    .frame(width: 150, height: 70, alignment: .leading)
                
                    .position(CGPoint(x: widthLayar * 0.25, y: heightLayar * 0.2))
                
                Text(selected)
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isBoardsSelected ? .yellow : .black)
                    .frame(width: 165, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.2))
                    .onTapGesture {
                        isIMPSelected = false
                        isBoardsSelected = true
                    }
            }
            .background(isLightMode ? .white : .black)
        
        }
    }
    
// ------------------------------------------------------------------------
    func resetVariables() {
        isVulSelected = false
        selectedCardType = ""
        selectedNumber = 0
        selectedNumberString = ""
        selected = "0"
        selectedInt = 0
        countVul = 0
        selectedOperation = ""
        isDoubleSelected = false
        isRedoubleSelected = false
        selectedResult = 0
        selectedResultString = ""
        Result = ""
        Result2 = ""
        selectedNumber1 = 0
        selectedNumberString1 = ""
        selected1 = "0"
        selectedInt1 = 0
        isBoardsSelected = true
        isIMPSelected = false
    }
    
    func createTabLabels() -> some View {
        ZStack {
//            Image("back")
//                .frame(width: 29, height: 29)
//                .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.012))
            
            Text("Calculator")
                .font(
                    Font.custom("Poppins", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 150, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * 0.3, y: heightLayar * 0.012))
            
            Text("IMP")
                .font(
                    Font.custom("Poppins", size: isIMPSselected ? 20 : 16)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 150, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * 0.83, y: heightLayar * 0.012))
                .onTapGesture{
                    resetVariables()
                    isScoreSelected = false
                    isIMPSselected = true
                    isVPSelected = false
                }
            
            Text("SCORE")
                .font(
                    Font.custom("Poppins", size: isScoreSelected ? 20 : 16)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 150, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * 0.68, y: heightLayar * 0.012))
                .onTapGesture{
                    resetVariables()
                    isScoreSelected = true
                    isIMPSselected = false
                    isVPSelected = false
                }
            
            Text("VP")
                .font(
                    Font.custom("Poppins", size: isVPSelected ? 20 : 16)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 150, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * 0.93, y: heightLayar * 0.012))
                .onTapGesture{
                    resetVariables()
                    isScoreSelected = false
                    isIMPSselected = false
                    isVPSelected = true
                }
        }
    }
    func createCardImage(imageName: String, cardType: String, positionX: CGFloat, positionY: CGFloat) -> some View {
        let imageSize: CGSize = CGSize(width: 71, height: 169)
        
        return ZStack {
            Image("RECTANGLE2")
                .frame(width: imageSize.width, height: imageSize.height)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: imageSize.width - 2, height: imageSize.height - 40) // Adjust size if needed
                .background(
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: imageSize.width - 2, height: imageSize.height - 40) // Adjust size if needed
                        .clipped()
                )
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
                .onTapGesture {
                    selectedCardType = cardType
                    selected = "\(selectedNumber)\(selectedCardType)"
                    calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)

                }
        }
    }

    func createNumberButton(_ number: Int, selectedCardType: String, imageName: String, positionX: CGFloat, positionY: CGFloat) -> some View {
        ZStack {
            Image(imageName)
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
            
            Text("\(number)")
                .font(
                    Font.custom("Poppins", size: 26)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 70, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
                .onTapGesture {
                    selectedNumber = number
                    selected = "\(selectedNumber)\(selectedCardType)"
                    calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)

                }
        }
    }

// ------------------------------------------------------------------------
    func createCalculationButton(_ number: Int, posX: CGFloat, posY: CGFloat) -> some View {
        return ZStack {
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * posX, y: heightLayar * posY))
            
            Text("\(number)")
                .font(
                    Font.custom("Poppins", size: 26)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 70, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * posX, y: heightLayar * posY))
                .onTapGesture {
                    if number == 0
                    {
                        angkascore = 0
                    }
                    else if number == 1
                    {
                        angkascore = 1
                    }
                    else if number == 2
                    {
                        angkascore = 2
                    }
                    else if number == 3
                    {
                        angkascore = 3
                    }
                    else if number == 4
                    {
                        angkascore = 4
                    }
                    else if number == 5
                    {
                        angkascore = 5
                    }
                    else if number == 6
                    {
                        angkascore = 6
                    }
                    else if number == 7
                    {
                        angkascore = 7
                    }
                    else if number == 8
                    {
                        angkascore = 8
                    }
                    else if number == 9
                    {
                        angkascore = 9
                    }
                    else if number == 10
                    {
                        angkascore = 10
                    }
                    else if number == 11
                    {
                        angkascore = 11
                    }
                    else if number == 12
                    {
                        angkascore = 12
                    }
                    else if number == 13
                    {
                        angkascore = 13
                    }
                    
                    if isDoubleSelected == true {
                        if ((selectedNumber == 5 || selectedNumber == 6 || selectedNumber == 7)) && selectedOperation == "-" {
                            if selectedResult == 0 {
                                if number == 1 {
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                                else if number >= 2 && number <= 9 { // Hanya menerima angka 2 hingga 9
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            } else {
                                let maxAllowedValue: Int
                                switch selectedNumber {
                                case 5: maxAllowedValue = 11
                                case 6: maxAllowedValue = 12
                                case 7: maxAllowedValue = 13
                                default: maxAllowedValue = 0
                                }
                                
                                if selectedResult >= 1 && selectedResult * 10 + number <= maxAllowedValue {
                                    selectedResult = selectedResult * 10 + number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            }
                        }
                        else
                        {
                            switch (selectedNumber, selectedOperation) {
                            case (1, "+"):
                                if number <= 6 { // Hanya 1 hingga 6
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (1, "-"):
                                if number <= 7 { // Hanya 1 hingga 7
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (2, "+"):
                                if number <= 5 { // Hanya 1 hingga 5
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (2, "-"):
                                if number <= 8 { // Hanya 1 hingga 8
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (3, "+"):
                                if number <= 4 { // Hanya 1 hingga 4
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (3, "-"):
                                if number <= 9 { // Hanya 1 hingga 9
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (4, "+"):
                                if number <= 3 { // Hanya 1 hingga 3
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (4, "-"):
                                if number <= 10 { // Hanya 1 hingga 10
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (5, "+"):
                                if number <= 2 { // Hanya 1 hingga 2
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (5, "-"):
                                if number <= 11 || (selectedNumber == 6 && number <= 12) || (selectedNumber == 7 && number <= 13) {
                                    // 1 hingga 11 untuk selectedNumber = 5, 1 hingga 12 untuk selectedNumber = 6, dan 1 hingga 13 untuk selectedNumber = 7
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (6, "+"):
                                if number == 1 { // Hanya 1
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (6, "-"):
                                if number <= 12 { // Hanya 1 hingga 12
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (7, "-"):
                                if number <= 13 { // Hanya 1 hingga 13
                                    selectedResult = number
                                    Result = selected + "X" + selectedOperation + String(selectedResult)
                                }
                            case (7, "+"):
                                Result = selected + "X" + selectedOperation + "0"
                                
                            default:
                                break
                            }
                        }
                    }
                    else if isRedoubleSelected == true {
                        if (selectedNumber == 5 || selectedNumber == 4 || selectedNumber == 6 || selectedNumber == 7) && selectedOperation == "-" {
                            if selectedResult == 0 {
                                if number == 1 {
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                                else if number >= 2 && number <= 9 { // Hanya menerima angka 2 hingga 9
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            } else {
                                let maxAllowedValue: Int
                                switch selectedNumber {
                                case 4: maxAllowedValue = 10
                                case 5: maxAllowedValue = 11
                                case 6: maxAllowedValue = 12
                                case 7: maxAllowedValue = 13
                                default: maxAllowedValue = 0
                                }
                                
                                if selectedResult >= 1 && selectedResult * 10 + number <= maxAllowedValue {
                                    selectedResult = selectedResult * 10 + number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            }
                        }
                        else
                        {
                            switch (selectedNumber, selectedOperation) {
                            case (1, "+"):
                                if number <= 6 { // Hanya 1 hingga 6
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (1, "-"):
                                if number <= 7 { // Hanya 1 hingga 7
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (2, "+"):
                                if number <= 5 { // Hanya 1 hingga 5
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (2, "-"):
                                if number <= 8 { // Hanya 1 hingga 8
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (3, "+"):
                                if number <= 4 { // Hanya 1 hingga 4
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (3, "-"):
                                if number <= 9 { // Hanya 1 hingga 9
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (4, "+"):
                                if number <= 3 { // Hanya 1 hingga 3
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (4, "-"):
                                if number <= 10 { // Hanya 1 hingga 10
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (5, "+"):
                                if number <= 2 { // Hanya 1 hingga 2
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (5, "-"):
                                if number <= 11 || (selectedNumber == 6 && number <= 12) || (selectedNumber == 7 && number <= 13) {
                                    // 1 hingga 11 untuk selectedNumber = 5, 1 hingga 12 untuk selectedNumber = 6, dan 1 hingga 13 untuk selectedNumber = 7
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (6, "+"):
                                if number == 1 { // Hanya 1
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (6, "-"):
                                if number <= 12 { // Hanya 1 hingga 12
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (7, "-"):
                                if number <= 13 { // Hanya 1 hingga 13
                                    selectedResult = number
                                    Result = selected + "XX" + selectedOperation + String(selectedResult)
                                }
                            case (7, "+"):
                                Result = selected + "XX" + selectedOperation + "0"
                                
                            default:
                                break
                            }
                        }
                    }
                    else {
                        if (selectedNumber == 5 || selectedNumber == 6 || selectedNumber == 7) && selectedOperation == "-" {
                            if selectedResult == 0 {
                                if number == 1 {
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                                else if number >= 2 && number <= 9 { // Hanya menerima angka 2 hingga 9
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            } else {
                                let maxAllowedValue: Int
                                switch selectedNumber {
                                case 5: maxAllowedValue = 11
                                case 6: maxAllowedValue = 12
                                case 7: maxAllowedValue = 13
                                default: maxAllowedValue = 0
                                }
                                
                                if selectedResult >= 1 && selectedResult * 10 + number <= maxAllowedValue {
                                    selectedResult = selectedResult * 10 + number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            }
                        }
                        else
                        {
                            switch (selectedNumber, selectedOperation) {
                            case (1, "+"):
                                if number <= 6 { // Hanya 1 hingga 6
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (1, "-"):
                                if number <= 7 { // Hanya 1 hingga 7
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (2, "+"):
                                if number <= 5 { // Hanya 1 hingga 5
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (2, "-"):
                                if number <= 8 { // Hanya 1 hingga 8
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (3, "+"):
                                if number <= 4 { // Hanya 1 hingga 4
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (3, "-"):
                                if number <= 9 { // Hanya 1 hingga 9
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (4, "+"):
                                if number <= 3 { // Hanya 1 hingga 3
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (4, "-"):
                                if number <= 10 { // Hanya 1 hingga 10
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (5, "+"):
                                if number <= 2 { // Hanya 1 hingga 2
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (5, "-"):
                                if number <= 11 || (selectedNumber == 6 && number <= 12) || (selectedNumber == 7 && number <= 13) {
                                    // 1 hingga 11 untuk selectedNumber = 5, 1 hingga 12 untuk selectedNumber = 6, dan 1 hingga 13 untuk selectedNumber = 7
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (6, "+"):
                                if number == 1 { // Hanya 1
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (6, "-"):
                                if number <= 12 { // Hanya 1 hingga 12
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (7, "-"):
                                if number <= 13 { // Hanya 1 hingga 13
                                    selectedResult = number
                                    Result = selected + selectedOperation + String(selectedResult)
                                }
                            case (7, "+"):
                                Result = selected + selectedOperation + "0"
                                
                            default:
                                break
                            }
                        }
                    }
                    calculateScore(selectedNumber: selectedNumber, selectedOperation: selectedOperation, angkaScore: angkascore, selectedResult: selectedResult, selected: selectedCardType, isDoubleSelected: isDoubleSelected, isRedoubleSelected: isRedoubleSelected, isVulSelected: isVulSelected)

                }
        }
    }

// ------------------------------------------------------------------------
    func convertSelectedToInt(selected: String) -> String {
        if let selectedInt = Int(selected) {
            let selectedChar: String
            switch selectedInt {
            case 0...19:
                selectedChar = "0"
            case 20...49:
                selectedChar = "1"
            case 50...89:
                selectedChar = "2"
            case 90...129:
                selectedChar = "3"
            case 130...169:
                selectedChar = "4"
            case 170...219:
                selectedChar = "5"
            case 220...269:
                selectedChar = "6"
            case 270...319:
                selectedChar = "7"
            case 320...369:
                selectedChar = "8"
            case 370...429:
                selectedChar = "9"
            case 430...499:
                selectedChar = "10"
            case 500...599:
                selectedChar = "11"
            case 600...749:
                selectedChar = "12"
            case 750...899:
                selectedChar = "13"
            case 900...1099:
                selectedChar = "14"
            case 1100...1299:
                selectedChar = "15"
            case 1300...1499:
                selectedChar = "16"
            case 1500...1749:
                selectedChar = "17"
            case 1750...1999:
                selectedChar = "18"
            case 2000...2249:
                selectedChar = "19"
            case 2250...2499:
                selectedChar = "20"
            case 2500...2999:
                selectedChar = "21"
            case 3000...3499:
                selectedChar = "22"
            case 3500...3999:
                selectedChar = "23"
            default:
                selectedChar = "24"
            }
            return selectedChar
        } else {
            return "Not a valid number"
        }
    }
    
    func createNumberButton(_ number: Int, positionX: CGFloat, positionY: CGFloat) -> some View {
        return ZStack {
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
            
            Text("\(number)")
                .font(
                    Font.custom("Poppins", size: 26)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 70, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
                .onTapGesture {
                    selectedNumber = number
                    selected = selected + String(selectedNumber)
                    if selected.first == "0" {
                        selected.removeFirst()
                    }
                }
        }
    }
// ------------------------------------------------------------------------
    func createNumberButtonn(_ number: Int, positionX: CGFloat, positionY: CGFloat) -> some View {
        return ZStack {
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
            
            Text("\(number)")
                .font(
                    Font.custom("Poppins", size: 26)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black:.white)
                .frame(width: 70, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
                .onTapGesture {
                    selectedNumber = number
                    selectedNumber1 = number
                    if isBoardsSelected == true {
                        selected = selected + String(selectedNumber)
                        if selected.first == "0" {
                            selected.removeFirst()
                        }
                    } else {
                        selected1 = selected1 + String(selectedNumber1)
                        if selected1.first == "0" {
                            selected1.removeFirst()
                        }
                    }
                }
        }
    }
    
    func calculateScore(selectedNumber: Int,
                        selectedOperation: String,
                        angkaScore: Int,
                        selectedResult: Int,
                        selected: String,
                        isDoubleSelected: Bool,
                        isRedoubleSelected: Bool,
                        isVulSelected: Bool) -> Int {
        
            if selectedOperation == "-" && selectedResult != 0
            {
                if isVulSelected == true
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 200 + ((selectedResult - 1) * 300)
                    }
                    else if isRedoubleSelected == true
                    {
                        hitungscore = 400 + ((selectedResult - 1) * 600)
                    }
                    else
                    {
                        hitungscore = selectedResult * 100
                    }
                    
                }
                else
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 100 + ((selectedResult - 1) * 200)
                    }
                    else if isRedoubleSelected == true
                    {
                        hitungscore = 200 + ((selectedResult - 1) * 400)
                    }
                    else
                    {
                        hitungscore = selectedResult * 50
                    }
                }
            }
            else if selectedOperation == "+" && angkascore != 0 && (selectedNumber + angkascore) < 8
        {
            hitungscore = selectedNumber + angkascore
            if selected.contains("♠️") || selected.contains("♥️")
            {
                if selectedNumber == 1 || selectedNumber == 2  || selectedNumber == 3
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 160 + ((hitungscore - 1) * 100)
                    }
                    else if isRedoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 720 + ((hitungscore - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 520 + ((hitungscore - 1) * 200)
                        }
                    }
                    else
                    {
                        hitungscore = 80 + ((hitungscore - 1) * 30)
                    }
                }
                else if selectedNumber == 4 || selectedNumber == 5
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 790 + ((hitungscore - 4) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1080 + ((hitungscore - 4) * 400)
                        }
                        else
                        {
                            hitungscore = 620 + ((hitungscore - 4) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 590 + ((hitungscore - 4) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 880 + ((hitungscore - 4) * 200)
                        }
                        else
                        {
                            hitungscore = 420 + ((hitungscore - 4) * 30)
                        }
                    }
                }
                else if selectedNumber == 6
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1660 + ((hitungscore - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2070 + ((hitungscore - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1430 + ((hitungscore - 6) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1210 + ((hitungscore - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1620 + ((hitungscore - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 980 + ((hitungscore - 1) * 30)
                        }
                    }
                }
                else if selectedNumber == 7
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2470
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2940
                        }
                        else
                        {
                            hitungscore = 2210
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1770
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2240
                        }
                        else
                        {
                            hitungscore = 1510
                        }
                    }
                }
                
            }
            else if selected.contains("♦️") || selected.contains("♣️")
            {
                if selectedNumber == 1 || selectedNumber == 2  || selectedNumber == 3 || selectedNumber == 4
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 140 + ((hitungscore - 1) * 100)
                    }
                    else if isRedoubleSelected == true
                    {
                        hitungscore = 230 + ((hitungscore - 1) * 200)
                    }
                    else
                    {
                        hitungscore = 70 + ((hitungscore - 1) * 20)
                    }
                }
                else if selectedNumber == 5
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 750 + ((hitungscore - 5) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1000 + ((hitungscore - 5) * 400)
                        }
                        else
                        {
                            hitungscore = 600 + ((hitungscore - 5) * 20)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 550 + ((hitungscore - 5) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 800 + ((hitungscore - 5) * 200)
                        }
                        else
                        {
                            hitungscore = 400 + ((hitungscore - 5) * 20)
                        }
                    }
                }
                else if selectedNumber == 6
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1540 + ((hitungscore - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1830 + ((hitungscore - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1370 + ((hitungscore - 6) * 20)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1090 + ((hitungscore - 6) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1380 + ((hitungscore - 6) * 200)
                        }
                        else
                        {
                            hitungscore = 920 + ((hitungscore - 6) * 20)
                        }
                    }
                }
                else if selectedNumber == 7
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2330
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2660
                        }
                        else
                        {
                            hitungscore = 2140
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1630
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1960
                        }
                        else
                        {
                            hitungscore = 1440
                        }
                    }
                }
            }
            else
            {
                if selectedNumber == 1 || selectedNumber == 2
                {
                    if isDoubleSelected == true
                    {
                        hitungscore = 180 + ((hitungscore - 1) * 100)
                    }
                    else if isRedoubleSelected == true
                    {
                        if isVulSelected == true
                        {
                            hitungscore = 760 + ((hitungscore - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 560 + ((hitungscore - 1) * 200)
                        }
                    }
                    else
                    {
                        hitungscore = 90 + ((hitungscore - 1) * 30)
                    }
                }
                else if selectedNumber == 4 || selectedNumber == 5 || selectedNumber == 3
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 750 + ((hitungscore - 3) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1000 + ((hitungscore - 3) * 400)
                        }
                        else
                        {
                            hitungscore = 600 + ((hitungscore - 3) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 550 + ((hitungscore - 3) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 800 + ((hitungscore - 3) * 200)
                        }
                        else
                        {
                            hitungscore = 400 + ((hitungscore - 3) * 30)
                        }
                    }
                }
                else if selectedNumber == 6
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1680 + ((hitungscore - 6) * 200)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2110 + ((hitungscore - 6) * 400)
                        }
                        else
                        {
                            hitungscore = 1440 + ((hitungscore - 6) * 30)
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1230 + ((hitungscore - 6) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 1660 + ((hitungscore - 6) * 200)
                        }
                        else
                        {
                            hitungscore = 990 + ((hitungscore - 6) * 30)
                        }
                    }
                }
                else if selectedNumber == 7
                {
                    if isVulSelected == true
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 2490
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2980
                        }
                        else
                        {
                            hitungscore = 2220
                        }
                    }
                    else
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 1790
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 2280
                        }
                        else
                        {
                            hitungscore = 1520
                        }
                    }
                }
                
            }
        }
                
            else
            {
                hitungscore = selectedNumber
                if selected.contains("♠️") || selected.contains("♥️")
                {
                    if selectedNumber == 1 || selectedNumber == 2  || selectedNumber == 3
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 160 + ((hitungscore - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            if isVulSelected == true
                            {
                                hitungscore = 720 + ((hitungscore - 1) * 200)
                            }
                            else
                            {
                                hitungscore = 520 + ((hitungscore - 1) * 200)
                            }
                        }
                        else
                        {
                            hitungscore = 80 + ((hitungscore - 1) * 30)
                        }
                    }
                    else if selectedNumber == 4 || selectedNumber == 5
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 790 + ((hitungscore - 4) * 200)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1080 + ((hitungscore - 4) * 400)
                            }
                            else
                            {
                                hitungscore = 620 + ((hitungscore - 4) * 30)
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 590 + ((hitungscore - 4) * 100)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 880 + ((hitungscore - 4) * 200)
                            }
                            else
                            {
                                hitungscore = 420 + ((hitungscore - 4) * 30)
                            }
                        }
                    }
                    else if selectedNumber == 6
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1660 + ((hitungscore - 6) * 200)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2070 + ((hitungscore - 6) * 400)
                            }
                            else
                            {
                                hitungscore = 1430 + ((hitungscore - 6) * 30)
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1210 + ((hitungscore - 1) * 100)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1620 + ((hitungscore - 1) * 200)
                            }
                            else
                            {
                                hitungscore = 980 + ((hitungscore - 1) * 30)
                            }
                        }
                    }
                    else if selectedNumber == 7
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 2470
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2940
                            }
                            else
                            {
                                hitungscore = 2210
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1770
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2240
                            }
                            else
                            {
                                hitungscore = 1510
                            }
                        }
                    }
                    
                }
                else if selected.contains("♦️") || selected.contains("♣️")
                {
                    if selectedNumber == 1 || selectedNumber == 2  || selectedNumber == 3 || selectedNumber == 4
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 140 + ((hitungscore - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            hitungscore = 230 + ((hitungscore - 1) * 200)
                        }
                        else
                        {
                            hitungscore = 70 + ((hitungscore - 1) * 20)
                        }
                    }
                    else if selectedNumber == 5
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 750 + ((hitungscore - 5) * 200)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1000 + ((hitungscore - 5) * 400)
                            }
                            else
                            {
                                hitungscore = 600 + ((hitungscore - 5) * 20)
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 550 + ((hitungscore - 5) * 100)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 800 + ((hitungscore - 5) * 200)
                            }
                            else
                            {
                                hitungscore = 400 + ((hitungscore - 5) * 20)
                            }
                        }
                    }
                    else if selectedNumber == 6
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1540 + ((hitungscore - 6) * 200)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1830 + ((hitungscore - 6) * 400)
                            }
                            else
                            {
                                hitungscore = 1370 + ((hitungscore - 6) * 20)
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1090 + ((hitungscore - 6) * 100)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1380 + ((hitungscore - 6) * 200)
                            }
                            else
                            {
                                hitungscore = 920 + ((hitungscore - 6) * 20)
                            }
                        }
                    }
                    else if selectedNumber == 7
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 2330
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2660
                            }
                            else
                            {
                                hitungscore = 2140
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1630
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1960
                            }
                            else
                            {
                                hitungscore = 1440
                            }
                        }
                    }
                }
                else
                {
                    if selectedNumber == 1 || selectedNumber == 2
                    {
                        if isDoubleSelected == true
                        {
                            hitungscore = 180 + ((hitungscore - 1) * 100)
                        }
                        else if isRedoubleSelected == true
                        {
                            if isVulSelected == true
                            {
                                hitungscore = 760 + ((hitungscore - 1) * 200)
                            }
                            else
                            {
                                hitungscore = 560 + ((hitungscore - 1) * 200)
                            }
                        }
                        else
                        {
                            hitungscore = 90 + ((hitungscore - 1) * 30)
                        }
                    }
                    else if selectedNumber == 4 || selectedNumber == 5 || selectedNumber == 3
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 750 + ((hitungscore - 3) * 200)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1000 + ((hitungscore - 3) * 400)
                            }
                            else
                            {
                                hitungscore = 600 + ((hitungscore - 3) * 30)
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 550 + ((hitungscore - 3) * 100)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 800 + ((hitungscore - 3) * 200)
                            }
                            else
                            {
                                hitungscore = 400 + ((hitungscore - 3) * 30)
                            }
                        }
                    }
                    else if selectedNumber == 6
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1680 + ((hitungscore - 6) * 200)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2110 + ((hitungscore - 6) * 400)
                            }
                            else
                            {
                                hitungscore = 1440 + ((hitungscore - 6) * 30)
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1230 + ((hitungscore - 6) * 100)
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 1660 + ((hitungscore - 6) * 200)
                            }
                            else
                            {
                                hitungscore = 990 + ((hitungscore - 6) * 30)
                            }
                        }
                    }
                    else if selectedNumber == 7
                    {
                        if isVulSelected == true
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 2490
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2980
                            }
                            else
                            {
                                hitungscore = 2220
                            }
                        }
                        else
                        {
                            if isDoubleSelected == true
                            {
                                hitungscore = 1790
                            }
                            else if isRedoubleSelected == true
                            {
                                hitungscore = 2280
                            }
                            else
                            {
                                hitungscore = 1520
                            }
                        }
                    }
                    
                }
            }

        return hitungscore
    }
    
    func calculateVP(board: String, imp: String) -> String {
        if let boards = Double(board), let imps = Double(imp) {
            let tau = (sqrt(5) - 1) / 2
            let b = 15 * sqrt(boards)
            let power = pow(tau, 3 * imps / b)
            var win = 10 + 10 * ((1 - power) / (1 - pow(tau, 3)))
            win = win > 20 ? 20 : win
            var lawan = 20 - win
            
            // Check if win and lawan have decimal points
            let winString = String(format: "%.2f", win)
            let lawanString = String(format: "%.2f", lawan)
            
            // Combine win and lawan strings
            let formattedWin = "\(winString) - \(lawanString)"
            return formattedWin
        } else {
            // Handle cases where conversion from string to Double fails
            // You might want to return an appropriate default value or throw an error here
            return "0" // Default value, change as per your requirement
        }
    }



}
//
//#Preview {
//    Calculator()
//}
