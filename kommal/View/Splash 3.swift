//
//  Splash 3.swift
//  kommal
//
//  Created by hailah alsaudi on 18/06/1446 AH.
//


import SwiftUI

struct Splash: View {
    
    // حالة للتحكم في الانتقال
    @State private var isActive = false
    
    var body: some View {
        
        ZStack {
            // تدرج لوني خلفي
            LinearGradient(gradient: .init(colors: [.blue, .purple, .pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            // عرض الشعار
            VStack {
                Image("logo") // اسم الملف logo.pdf (يجب أن يتطابق مع اسم الملف)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // حجم الشعار
                    .opacity(0.7) // شفافية الشعار
                
                Spacer()
            }
            
            // دائرة شفافة
            Circle()
                .fill(Color.white.opacity(0.2)) // شفافية الدائرة
                .frame(width: 562, height: 612)
                .offset(y: -225) // حركة الدائرة
            
            // دائرة أخرى
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 562, height: 612)
                .offset(y: 200)
        }
        .onAppear {
            // الانتقال بعد 3 ثوانٍ
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .background(
            NavigationLink(destination: MainScreen(), isActive: $isActive) {
                EmptyView()
            }
        )
    }
}

struct MainScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Main Screen")
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    Splash()
}
