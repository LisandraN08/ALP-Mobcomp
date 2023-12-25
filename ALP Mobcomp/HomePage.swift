import SwiftUI

struct HomePage: View {
    @State private var isBiddingViewActive = false
    @State private var isCalculatorViewActive = false
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isLightMode = true // State untuk menunjukkan mode gambar (light/dark)

    var body: some View {
        NavigationView {
            ZStack {
                // Background Images
                Image(isLightMode ? "ellipse1" : "ellipse3")
                    .resizable()
                    .position(x: 180, y: 325)
                
                
                Image(isLightMode ? "ellipse2" : "ellipse4")
                    .resizable()
                    .position(x: 200, y: 550)
                
                // Content
                VStack {
                    Text("Welcome!")
                        .font(.title)
                        .foregroundColor(isLightMode ? .black : .white)
                    Text("It's Bridge Count!")
                        .font(.title)
                        .foregroundColor(isLightMode ? .black : .white)
                    
                    HStack {
                        Spacer()
                        Image("profileImage")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.trailing, 20)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Button(action: {
                            // Action untuk Calculator
                        }) {
                            // Placeholder untuk button Calculator
                            EmptyView()
                        }
                        
                        NavigationLink(destination: Calculator(), isActive: $isCalculatorViewActive) {
                            Button(action: {
                                isCalculatorViewActive = true
                            }) {
                                ZStack {
                                    Image(isLightMode ? "Rectangle 294" : "Rectangle 294-2")
                                        .position(CGPoint(x: widthLayar * 0.47, y: heightLayar * 0.1))
                                    
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 114, height: 170)
                                      .background(
                                        Image("side view of white calculator")
                                          .resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(width: 114, height: 170)
                                          .clipped()
                                      )
                                      .shadow(color: .black.opacity(0.25), radius: 4, x: 6, y: 7)
                                      .position(CGPoint(x: widthLayar * 0.2, y: heightLayar * 0.09))
                                    
                                    Text("Calculator")
                                      .font(
                                        Font.custom("Poppins", size: 32)
                                          .weight(.semibold)
                                      )
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(isLightMode ? .black : .white)
                                      .position(CGPoint(x: widthLayar * 0.6, y: heightLayar * 0.09))
                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Untuk menghilangkan default button style
                        }
                        
                        // NavigationLink ke BiddingView saat button Bidding ditekan
                        NavigationLink(destination: BiddingView(), isActive: $isBiddingViewActive) {
                            Button(action: {
                                isBiddingViewActive = true
                            }) {
                                ZStack {
                                    Image(isLightMode ? "Rectangle 294" : "Rectangle 294-2")
                                        .position(CGPoint(x: widthLayar * 0.47, y: heightLayar * 0.15))
                                    
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 235, height: 228)
                                      .background(
                                        Image("image 6")
                                          .resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(width: 235, height: 228)
                                          .clipped()
                                      )
                                      .shadow(color: .black.opacity(0.25), radius: 3.55, x: -5, y: 8)
                                      .position(CGPoint(x: widthLayar * 0.65, y: heightLayar * 0.13))
                                    
                                    Text("Bidding")
                                      .font(
                                        Font.custom("Poppins", size: 32)
                                          .weight(.semibold)
                                      )
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(isLightMode ? .black : .white)
                                      .position(CGPoint(x: widthLayar * 0.25, y: heightLayar * 0.13))

                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Untuk menghilangkan default button style
                        }
                        .onTapGesture {
                            isLightMode.toggle() // Mengubah mode gambar saat ditekan
                        }

                        Spacer()
                        Spacer()
                        
                        Button(action: {
                            // Action untuk Light/Dark toggle
                            isLightMode.toggle()
                        }) {
                            HStack {
                                Image(isLightMode ? "light" : "dark")
                                    .resizable()
                                    .frame(width: 140, height: 70)
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // Untuk menghilangkan default button style
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(isLightMode ? Color.white: Color.black)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
