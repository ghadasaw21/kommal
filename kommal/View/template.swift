//
//  template.swift
//  kommal
//
//  Created by hailah alsaudi on 17/06/1446 AH.
//
import SwiftUI

struct template: View {
    var body: some View {
        TabView{
            ZStack {
                Color.bg.ignoresSafeArea()
                
                VStack {
                    // الشريط العلوي
                    HStack {
                        // زر العودة
                        Button(action: {
                            print("Back tapped")
                        }) {
                            
                            Image(systemName: "chevron.backward") // أيقونة العودة
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            
                        }
                        
                        Spacer()
                        
                        // النص أو الصورة للملف الشخصي
                        HStack {
                            
                            Button(action: {
                                print("chevron.backward")
                            }) {
                                Image(systemName: "person.circle.fill") // صورة الملف الشخصي
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)  .foregroundColor(.white).padding()
                                // إضافة مسافة صغيرة بين الأيقونة والنص
                            }
                        }
                        
                    }
                    .frame(height: 60) // تقليص حجم الشريط العلوي
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .blu4, location: -0.2),
                                .init(color: .blu2, location: 0.50),
                                .init(color: .blu2, location: 0.50),
                                .init(color: .blu1, location: 1.0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ).ignoresSafeArea()
                    ) // لون الشريط العلوي
                    
                    
                    
                    
                    Spacer() // محتوى التطبيق الرئيسي
                    Text("Main Content")
                        .font(.largeTitle)
                    Spacer()
                    
                    
                    
                    
                    
                    
                    // الشريط السفلي
                    // خلفية الشريط السفلي
                }
            }.tabItem {
                Image(systemName: "mappin.and.ellipse") // Icon for this tab
                Text("Map") // Title for the tab
            }
            
            // Second tab: Profile or other content screen
            VStack {
                Text("Browse")
                    .font(.largeTitle)
                    .padding()
                // Add more content for the Profile tab here
            }
            .tabItem {
                Image(systemName: "square.grid.2x2.fill") // Icon for this tab
                Text("Browse") // Title for the tab
            }
            
            // Third tab: Settings or other content screen
            VStack {
                Text("Chat")
                    .font(.largeTitle)
                    .padding()
                // Add more content for the Settings tab here
            }
            .tabItem {
                Image(systemName: "apple.intelligence")
                    // Icon for this tab
                Text("Chat with AI") // Title for the tab
            }
        }
        .accentColor(.circle)
        .background(Color.white)
        }
}

#Preview {
    template()
}
