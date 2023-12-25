//
//  Calculator.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 24/12/23.
//

import SwiftUI

struct CALCULATORVP: View {
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isBoardsSelected = true
    @State private var isIMPSelected = false
    @State private var selectedNumber: Int = 0
    @State private var selectedNumberString: String = ""
    @State private var selected: String = "0"
    @State private var selectedInt: Int = 0
    
    @State private var selectedNumber1: Int = 0
    @State private var selectedNumberString1: String = ""
    @State private var selected1: String = "0"
    @State private var selectedInt1: Int = 0
    var body: some View {
        ZStack{

            
            // kotak kalkulator
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 423, height: 537)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.62, green: 0.91, blue: 1).opacity(0), location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )
              .cornerRadius(30)
              .shadow(color: .black.opacity(0.1), radius: 35, x: 0, y: -5)
              .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.83))
            
            
            Image("back")
            .frame(width: 29, height: 29)
            .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.012))
            
            
            Image("RECTANGLE2")
            .frame(width: 73, height: 10)
            .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.66))
            
            
            Text("Calculator")
              .font(
                Font.custom("Poppins", size: 20)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 150, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.3, y: heightLayar * 0.012))
            
            
            Text("IMP")
              .font(
                Font.custom("Poppins", size: 14)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 150, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.83, y: heightLayar * 0.012))
            
            
            Text("SCORE")
              .font(
                Font.custom("Poppins", size: 16)
                    .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 150, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.68, y: heightLayar * 0.012))
            
            
            Text("VP")
              .font(
                Font.custom("Poppins", size: 14)
                    .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 150, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.93, y: heightLayar * 0.012))
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.61)) //OKE
            Text("1")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.61)) //OKE
              .onTapGesture {
                  selectedNumber = 1
                  selectedNumber1 = 1
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.61))
            Text("2")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.61))
              .onTapGesture {
                  selectedNumber = 2
                  selectedNumber1 = 2
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.61))
            Text("3")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.61))
              .onTapGesture {
                  selectedNumber = 3
                  selectedNumber1 = 3
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            
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
            
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.712)) //OKE
            Text("4")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.712)) //OKE
              .onTapGesture {
                  selectedNumber = 4
                  selectedNumber1 = 4
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.712))
            Text("5")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.712))
              .onTapGesture {
                  selectedNumber = 5
                  selectedNumber1 = 5
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.712))
            Text("6")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.712))
              .onTapGesture {
                  selectedNumber = 6
                  selectedNumber1 = 6
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            Text("AC")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.712))
              .onTapGesture {
                  selected = "0"
                  selected1 = "0"
              }
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.814)) //OKE
            Text("7")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.814)) //OKE
              .onTapGesture {
                  selectedNumber = 7
                  selectedNumber1 = 7
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.814))
            Text("8")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.814))
              .onTapGesture {
                  selectedNumber = 8
                  selectedNumber1 = 8
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.814))
            Text("9")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.814))
              .onTapGesture {
                  selectedNumber = 9
                  selectedNumber1 = 9
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            Image("CIRCLE")
                .frame(width: 70, height: 70)
                .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.814))
            Text("0")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.814))
              .onTapGesture {
                  selectedNumber = 0
                  selectedNumber1 = 0
                  if isBoardsSelected == true {
                      selected = selected + String(selectedNumber)
                      if selected.first == "0" {
                          selected.removeFirst()
                      }
                  }
                  else {
                      selected1 = selected1 + String(selectedNumber1)
                      if selected1.first == "0" {
                          selected1.removeFirst()
                      }
                  }
              }
            
            
            Text("=")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.45))
            
            Text("0")
              .font(
                Font.custom("Poppins", size: 40)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.trailing)
              .foregroundColor(.black)
              .frame(width: 165, height: 70, alignment: .trailing)
              .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.45))
            
            
            Text("IMPs")
              .font(
                Font.custom("Poppins", size: 32)
                  .weight(.semibold)
              )
              .foregroundColor(.black)
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
              .foregroundColor(.black)
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

#Preview {
    CALCULATORVP()
}
