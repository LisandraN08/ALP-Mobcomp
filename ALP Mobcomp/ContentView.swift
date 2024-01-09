//import SwiftUI
//
//struct ContentView: View {
//    @State private var showFirstLogo = true
//    @State private var showSecondLogo = false
//    @State private var showHomePage = false // State untuk menunjukkan apakah harus menampilkan BiddingView
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                // Elips pertama
//                Image("ellipse1")
//                    .resizable()
//                    .position(x: 180, y: 325)
//                
//                // Elips kedua
//                Image("ellipse2")
//                    .resizable()
//                    .position(x: 200, y: 550)
//                
//                // LogoBC1
//                Image("logoBC1")
//                    .resizable()
//                    .frame(width: 350, height: 350)
//                    .opacity(showFirstLogo ? 1 : 0) // Menampilkan logoBC1 jika showFirstLogo adalah true
//                
//                // LogoBC2
//                Image("logoBC2")
//                    .resizable()
//                    .frame(width: 350, height: 350)
//                    .opacity(showSecondLogo ? 1 : 0) // Menampilkan logoBC2 jika showSecondLogo adalah true
//            }
//            .onAppear {
//                // Mengatur Timer untuk menampilkan logoBC2 setelah 3 detik
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    showFirstLogo = false
//                    showSecondLogo = true
//                }
//
//                // Mengatur Timer untuk menampilkan BiddingView setelah 6 detik
//                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//                    showSecondLogo = false
//                    showHomePage = true
//                }
//            }
//            .background(
//                // NavigationLink  yang akan memicu peralihan ke BiddingView saat showBiddingView mejadi true
//                
//                NavigationLink(
//                    destination: HomePage(),
//                    isActive: $showHomePage,
//                    label: { EmptyView() }
//                )
//                .hidden()
//            )
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
