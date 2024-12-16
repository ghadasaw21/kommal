//
//  splash.swift
//  kommal
//
//  Created by Ghada al ajmi on 15/06/1446 AH.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: .init(colors: [.blu1,.blu2,.blu3,.blu4]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
           
            VStack{
                Circle()
                    .fill(Color.circle.opacity(0.19)) // شفافية 50%
                                .frame(width: 562, height: 612).offset(y:-225) // حجم الدائرة
                            
                
            }
            ZStack{
                Circle()
                    .fill(Color.circle.opacity(0.19)) // شفافية 50%
                                .frame(width: 562, height: 612).offset(y:200)// حجم الدائرة
                            
            }
            
        }
       
        
        
        
        
    }}
#Preview {
    Splash()
}
