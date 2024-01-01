//
//  Calculator.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 24/12/23.
//

import SwiftUI

struct Calculator: View {
    @Binding var isLightMode: Bool
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isVulSelected = false
    @State private var selectedCardType: String = ""
    @State private var selectedNumber: Int = 0
    @State private var selectedNumberString: String = ""
    @State private var selected: String = ""
    @State private var selectedInt: Int = 0
    @State private var countVul: Int = 0
    @State private var selectedOperation: String = ""
    @State private var isDoubleSelected = false
    @State private var isRedoubleSelected = false
    @State private var selectedResult: Int = 0
    @State private var selectedResultString: String = ""
    @State private var Result: String = ""
    @State private var selectedNumber1: Int = 0
    @State private var selectedNumberString1: String = ""
    @State private var selected1: String = "0"
    @State private var selectedInt1: Int = 0
    @State private var isBoardsSelected = true
    @State private var isIMPSelected = false
    
    @State private var isScoreSelected = true
    @State private var isIMPSselected = false
    @State private var isVPSelected = false
    var body: some View {
        
        if isScoreSelected == true {
            if countVul == 0 || selectedNumber == 0 || selectedCardType == ""
            {
                ZStack{
                    //background
                    Image("Ellipse 1")
                        .frame(width: 1277.08508, height: 862.28662)
                        .background( isLightMode ?
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.26, green: 0.52, blue: 0.61), location: 0.02),
                                    Gradient.Stop(color: Color(red: 0.16, green: 0.49, blue: 0.63), location: 0.28),
                                    Gradient.Stop(color: Color(red: 0.13, green: 0.31, blue: 0.57), location: 0.65),
                                    Gradient.Stop(color: Color(red: 0, green: 0.07, blue: 0.25), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 1, y: 0.18),
                                endPoint: UnitPoint(x: 0.15, y: 0.83)
                            ) : LinearGradient(
                                stops: [
                                Gradient.Stop(color: Color(red: 0.15, green: 0.15, blue: 0.16), location: 0.23),
                                Gradient.Stop(color: Color(red: 0, green: 0.01, blue: 0.03), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: 0),
                                endPoint: UnitPoint(x: 1, y: 1)
                                )
                        )
                        .blur(radius: 182)
                        .rotationEffect(Angle(degrees: -15))
                        .position(CGPoint(x: widthLayar * 0.9, y: heightLayar * 0.7))
                    
                    
                    // kotak kalkulator
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 423, height: 537)
                        .background( isLightMode ?
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            ) : LinearGradient(
                                stops: [
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
                        .background(isLightMode ? .white.opacity(0.3) : Color(red: 0, green: 0.13, blue: 0.21).opacity(0.4))
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
                        }
                    
                    Text(selected)
                        .font(
                            Font.custom("Poppins", size: 35)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(isVulSelected ? Color.red : Color.black)
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
                        }
                    createCardImage(imageName: "SPADE", cardType: "♠️", positionX: 0.873, positionY: 0.767)
                    createCardImage(imageName: "DIAMOND", cardType: "♦️", positionX: 0.632, positionY: 0.767)
                    createCardImage(imageName: "HEART", cardType: "♥️", positionX: 0.37, positionY: 0.767)
                    createCardImage(imageName: "CLUB", cardType: "♣️", positionX: 0.126, positionY: 0.767)
                }
            }
            else
            {
                ZStack{
                    // kotak kalkulator
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 423, height: 537)
                        .background( isLightMode ?
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            ) : LinearGradient(
                                stops: [
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
                        .background(isLightMode ? .white.opacity(0.3) : Color(red: 0.02, green: 0.02, blue: 0.02).opacity(0.3))
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
                            Result = selected + selectedOperation + String(selectedResult)
                            if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                                Result = selected + selectedOperation + String(selectedResult)
                            }
                            else {
                                Result = selected + selectedOperation
                            }
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
                            if isDoubleSelected == true {
                                Result = selected + "X" + selectedOperation + String(selectedResult)

                            }
                            else if isRedoubleSelected == true {
                                Result = selected + "XX" + selectedOperation + String(selectedResult)

                            }
                            else {
                                Result = selected + selectedOperation + String(selectedResult)
                            }
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
                            if isDoubleSelected == true {
                                Result = selected + "X" + selectedOperation + String(selectedResult)

                            }
                            else if isRedoubleSelected == true {
                                Result = selected + "XX" + selectedOperation + String(selectedResult)

                            }
                            else {
                                Result = selected + selectedOperation + String(selectedResult)

                            }
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
                            if isDoubleSelected == true {
                                Result = selected + "X" + selectedOperation

                            }
                            else if isRedoubleSelected == true {
                                Result = selected + "XX" + selectedOperation

                            }
                            else {
                                Result = selected + selectedOperation

                            }
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
                            
                            isDoubleSelected = true
                            isRedoubleSelected = false
                            if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                                Result = selected + "X" + selectedOperation + String(selectedResult)
                            }
                            else {
                                Result = selected + "X" + selectedOperation
                            }
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
                            isDoubleSelected = false
                            isRedoubleSelected = true
                            if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                                Result = selected + "XX" + selectedOperation + String(selectedResult)
                            }
                            
                            else {
                                Result = selected + "XX" + selectedOperation
                            }
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
                    
                    Text(Result)
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
                        ) : LinearGradient(
                            stops: [
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
                    .foregroundColor(isLightMode ? Color(red: 0.04, green: 0.04, blue: 0.04) : Color(red: 0.98, green: 0.98, blue: 0.98))
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
                
                Text(selected)
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 165, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.45))
                
                
                Text("0")
                    .font(
                        Font.custom("Poppins", size: 64)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 165, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.35))
            }
        }
        else
        {
            ZStack{
                // kotak kalkulator
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 423, height: 537)
                    .background( isLightMode ?
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ) : LinearGradient(
                            stops: [
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
                
                Image("RECTANGLE2")
                    .frame(width: 73, height: 10)
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
                    .foregroundColor(isLightMode ? Color(red: 0.04, green: 0.04, blue: 0.04) : Color(red: 0.98, green: 0.98, blue: 0.98))
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
                
                Text("0")
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 165, height: 70, alignment: .trailing)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.45))

                Text("IMPs")
                    .font(
                        Font.custom("Poppins", size: 32)
                            .weight(.semibold)
                    )
                    .foregroundColor(isLightMode ? .black : .white)
                    .frame(width: 150, height: 70, alignment: .leading)
                    .position(CGPoint(x: widthLayar * 0.25, y: heightLayar * 0.3))
                
                Text(selected1)
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(isIMPSelected ? .yellow : .black)
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
                    .foregroundColor(isLightMode ? .black : .white)
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
                .foregroundColor(isLightMode ? .black : .white)
                .frame(width: 150, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * 0.3, y: heightLayar * 0.012))
            
            Text("IMP")
                .font(
                    Font.custom("Poppins", size: 14)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black : .white)
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
                    Font.custom("Poppins", size: 16)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black : .white)
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
                    Font.custom("Poppins", size: 14)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isLightMode ? .black : .white)
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
                .foregroundColor(isLightMode ? .black : .white)
                .frame(width: 70, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * positionX, y: heightLayar * positionY))
                .onTapGesture {
                    selectedNumber = number
                    selected = "\(selectedNumber)\(selectedCardType)"
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
                .foregroundColor(isLightMode ?.black:.white)
                .frame(width: 70, height: 70, alignment: .center)
                .position(CGPoint(x: widthLayar * posX, y: heightLayar * posY))
                .onTapGesture {
                    if !Result.contains("=") { // Memeriksa apakah operator "=" sudah ada
                        selectedResult = number
                        if isDoubleSelected == true {
                            Result = selected + "X" + selectedOperation + String(selectedResult)
                        } else if isRedoubleSelected == true {
                            Result = selected + "XX" + selectedOperation + String(selectedResult)
                        } else {
                            Result = selected + selectedOperation + String(selectedResult)
                        }
                    }
                    
                    if selectedNumber == 1 {
                        
                    }
                }
        }
    }
// ------------------------------------------------------------------------

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
                .foregroundColor(isLightMode ?.black : .white)
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
                .foregroundColor(isLightMode ? .black : .white)
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
}
//
//#Preview {
//    Calculator()
//}
