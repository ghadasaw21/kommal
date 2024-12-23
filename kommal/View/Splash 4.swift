//
//  Splash 4.swift
//  kommal
//
//  Created by hailah alsaudi on 21/06/1446 AH.
//


import SwiftUI
import AVKit

struct Splash: View {
    
    // حالة للتحكم في الانتقال
    @State private var isActive = false
    // متغير لتخزين مشغل الفيديو
    private var player: AVPlayer {
        // استرجاع الفيديو من Bundle
        guard let videoPath = Bundle.main.path(forResource: "video", ofType: "mp4") else {
            fatalError("فيديو غير موجود في الـ Bundle.")
        }
        let url = URL(fileURLWithPath: videoPath)
        return AVPlayer(url: url)
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                // تدرج لوني خلفي
                LinearGradient(gradient: .init(colors: [.blue, .purple, .pink]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                // عرض الفيديو باستخدام AVPlayer
                VStack {
                    // هنا نستخدم VideoPlayer لعرض الفيديو
                    VideoPlayer(player: player)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // تأكد من أن الفيديو يغطي كامل الشاشة
                        .onAppear {
                            player.play() // تشغيل الفيديو عند ظهوره
                        }
                        .clipped() // لضمان أن الفيديو يغطي الشاشة بالكامل بدون ترك أي فراغات
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
            // الانتقال بعد التفعيل
            .navigationDestination(isPresented: $isActive) {
                MainScreen()
            }
        }
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
