

//
//  MainScreen1.swift
//  kommal
//
//  Created by hailah alsaudi on 22/06/1446 AH.
//
import SwiftUI

struct MainScreen1: View {
  @State private var selectedCategory: String? = nil // الحالة لتحديد التصنيف المختار
  @State private var places: [Place] = Place.samplePlaces // بيانات الأماكن

  var body: some View {
      TabView {
          ZStack {
              LinearGradient(
                  gradient: Gradient(stops: [
                      .init(color: .blu4, location: -0.00),
                      .init(color: .blu2, location: 0.110),
                      .init(color: .blu2, location: 0.110),
                      .init(color: .bg, location: 0.40),
                  ]),
                  startPoint: .top,
                  endPoint: .bottom
              )
              .ignoresSafeArea()
              
              VStack {
                  // الشريط العلوي
                  HStack {
                      // زر البحث
                      NavigationLink(destination: ReviewPage()) {
                          HStack {
                              Image(systemName: "magnifyingglass") // أيقونة البحث
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 30, height: 30)
                                  .foregroundColor(.white)
                          }
                      }
                      
                      Spacer()
                          
                      // النص أو الصورة للملف الشخصي
                      Button(action: {
                          
                      }) { //note
                          NavigationLink(destination: Profile()) {
                              Image(systemName: "person.circle.fill") // صورة الملف الشخصي
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 44, height: 44)
                                  .foregroundColor(.white)
                                  .padding(.vertical, 10.0)
                          }
                         
                      }
                  }
                  .padding()
                  .padding(.horizontal, 17)
                  .padding(.top, 10)
                  
                  // أزرار الفلاتر
                  HStack(spacing: 10) { // استخدام HStack مع مسافات متساوية
                      ForEach(["Coffee", "Restaurant", "Fun", "Other"], id: \.self) { category in
                          VStack {
                              // مربع فارغ
                              RoundedRectangle(cornerRadius: 8)
                                  .fill(selectedCategory == category ? Color.blu1 : Color.bg)
                                  .frame(width: selectedCategory == category ? 140 : 62, // العرض
                                         height: selectedCategory == category ? 80 : 50) // الارتفاع
                                  .onTapGesture {
                                      withAnimation(.spring()) {
                                          selectedCategory = category
                                      }
                                  }
                              
                              // اسم التصنيف أسفل المربع
                              Text(getCategoryName(category: category))
                                  .font(selectedCategory == category ? .headline : .caption)
                                  .foregroundColor(selectedCategory == category ? .blu1 : .white)
                                  .padding(.top, 5)
                          }
                      }
                      .frame(maxWidth: .infinity) // لجعل العناصر متساوية
                  }
                  .padding(.horizontal, 16)
                  
                  // الكروت (Cards) للأماكن الأعلى تقييمًا
                  ScrollView(.horizontal, showsIndicators: false) {
                      HStack(spacing: 20) {
                          ForEach(places.filter { selectedCategory == nil || $0.category == selectedCategory }) { place in
                              PlaceCardView(place: place)
                                  .frame(width: 250, height: 400)
                          }
                      }
                      .padding(.horizontal, 16)
                  }
                  Spacer()
              }
          }
          .tabItem {
              Image(systemName: "square.grid.2x2.fill")
              Text("Browse")
          }
          
          NavigationView {
              MapScreen()
          }
          .tabItem {
              Image(systemName: "mappin.and.ellipse")
              Text("Map")
          }
          
          NavigationView {
              OpenAI()
          }
          .tabItem {
              Image(systemName: "apple.intelligence")
              Text("Chat with AI")
          }
      }
      .accentColor(.circle)
      .navigationBarBackButtonHidden(true)
}
  
  // تحويل أسماء التصنيفات للغة العربية
  func getCategoryName(category: String) -> String {
      switch category {
      case "Coffee": return "Coffee"
      case "Restaurant": return "Restaurant"
      case "Fun": return "Fun"
      case "Other": return "Other"
      default: return category
      }
  }
}

// نموذج الكروت
struct Place: Identifiable {
  let id = UUID()
  let name: String
  let category: String
  let rating: Double

  static let samplePlaces: [Place] = [
      Place(name: "Pizza Palace", category: "Food", rating: 4.5),
      Place(name: "Sushi World", category: "Food", rating: 4.8),
      Place(name: "Gourmet Restaurant", category: "Restaurant", rating: 4.9),
      Place(name: "Fun Land", category: "Entertainment", rating: 4.7),
      Place(name: "Coffee Shop", category: "Coffee", rating: 4.2),
  ]
}

// عرض الكروت
struct PlaceCardView: View {
  let place: Place

  var body: some View {
     
      VStack {
          Text(place.name)
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.black)
              .padding(.top, 16)
          
          Spacer()
          
          Text("Rating: \(place.rating, specifier: "%.1f")")
              .foregroundColor(.black)
              .padding(.bottom, 16)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(
          RoundedRectangle(cornerRadius: 20)
              .fill(Color.white)
      )
  }
}

#Preview {
  MainScreen1()
}
