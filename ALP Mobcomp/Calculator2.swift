//
//  Calculator.swift
//  ALP Mobcomp
//
//  Created by MacBook Pro on 24/12/23.
//

import SwiftUI

struct Calculator2: View {
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
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
              .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.73))
            
            
            Image("back")
            .frame(width: 29, height: 29)
            .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.012))
            
            Image("rectangle6")
            .frame(width: 69, height: 259)
            .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
            .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.6))
            
            
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
                    .weight(.bold)
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
            
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 270, height: 70)
              .background(.white.opacity(0.3))
              .cornerRadius(40)
              .shadow(color: .black.opacity(0.05), radius: 7.5, x: 0, y: 3)
              .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.498)) //OKE
            
            
            
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
              .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.61)) //OK
            
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
            
            Text("+")
              .font(
                Font.custom("Poppins", size: 48)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.12, y: heightLayar * 0.495))
            
            Text("-")
              .font(
                Font.custom("Poppins", size: 48)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.37, y: heightLayar * 0.495))
            
            Text("=")
              .font(
                Font.custom("Poppins", size: 48)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.61, y: heightLayar * 0.495))
            
            Image("akar-icons_backspace-2")
            .frame(width: 28, height: 33)
            .background(.black.opacity(0))
            .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.51))
            
            
            Text("X")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 1, green: 0, blue: 0))
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.61))
            
            
            
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
            
            
            Text("XX")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0, green: 0.16, blue: 1))
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.86, y: heightLayar * 0.712))
            
            
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
            
            
            Text("=")
              .font(
                Font.custom("Poppins", size: 26)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 70, height: 70, alignment: .center)
              .position(CGPoint(x: widthLayar * 0.1, y: heightLayar * 0.35))
            
            Text("0")
              .font(
                Font.custom("Poppins", size: 40)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.trailing)
              .foregroundColor(.black)
              .frame(width: 165, height: 70, alignment: .trailing)
              .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.35))
            
            
            Text("0")
              .font(
                Font.custom("Poppins", size: 64)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.trailing)
              .foregroundColor(.black)
              .frame(width: 300, height: 70, alignment: .trailing)
              .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.25))
            
            

            
        }
        
    }
}

#Preview {
    Calculator2()
}
