//
//  Calculator.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 24/12/23.
//

import SwiftUI

struct CalculatorIMP: View {
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var selectedNumber: Int = 0
    @State private var selectedNumberString: String = ""
    @State private var selected: String = "0"
    @State private var selectedInt: Int = 0
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
            
            
            Image("Rectangle 4")
            .frame(width: 73, height: 160)
            .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
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
                  .weight(.bold)
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
                  .weight(.semibold)
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
                  }
              }
            
            
            
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selectedNumber = 0
                  selected = "0"
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
                  selected = selected + String(selectedNumber)
                  if selected.first == "0" {
                      selected.removeFirst()
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
            
            Text(selected)
              .font(
                Font.custom("Poppins", size: 40)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.trailing)
              .foregroundColor(.black)
              .frame(width: 165, height: 70, alignment: .trailing)
              .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.45))
            
            
            Text("0")
              .font(
                Font.custom("Poppins", size: 64)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.trailing)
              .foregroundColor(.black)
              .frame(width: 165, height: 70, alignment: .trailing)
              .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.35))
            
            

            
        }
        
        
    }
}

#Preview {
    CalculatorIMP()
}
