import SwiftUI

// MARK: - Main Splash View
struct MainScreen: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Background Color

            VStack(spacing: 0) {
                // Content Area
                TabView {
                    ContentView()
                        .tabItem {
                            Label("Main", systemImage: "square.grid.2x2.fill") // Main Page Icon
                        }
                    MapView()
                        .tabItem {
                            Label("Map", systemImage: "mappin.and.ellipse") // Map Icon
                        }
                    AIView()
                        .tabItem {
                            Label("AI", systemImage: "questionmark.circle") // AI Icon
                        }
                }
                .background(Color.black.ignoresSafeArea(edges: .bottom))
            }
        }
    }
}

// MARK: - ContentView (Main Tab)
struct ContentView: View {
    @State private var selectedCategory: String = "entertainment"
    @State private var selectedCard: UUID? = nil

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 9) {
                // Header
                HStack {
                    Image(systemName: "magnifyingglass") // Search Icon
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                        .padding(.leading, 16)

                    Spacer()

                    Image(systemName: "person.circle.fill") // Profile Icon
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.blue)
                        .padding(.trailing, 16)
                }
                .padding(.vertical, 15)
               

                // Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(["restaurant", "coffee", "entertainment", "other"], id: \.self) { category in
                            VStack {
                                Rectangle()
                                    .fill(selectedCategory == category ? Color.blue : Color.gray.opacity(0.3))
                                    .frame(
                                        width: selectedCategory == category ? 166 : 130,
                                        height: selectedCategory == category ? 80 : 62
                                    )
                                    .overlay(
                                        Text(category.capitalized)
                                            .font(.headline)
                                            .foregroundColor(selectedCategory == category ? .white : .black)
                                    )
                                    .cornerRadius(12)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedCategory = category
                                        
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                


                }

                // Cards Section
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(cards(for: selectedCategory)) { card in
                            CardView(
                                card: card,
                                isSelected: card.id == selectedCard
                            )
                            .frame(
                                width: card.id == selectedCard ? 300 : 250,
                                height: card.id == selectedCard ? 450 : 390
                            )
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedCard = (selectedCard == card.id ? nil : card.id)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 70)
                
// Ensure minimal padding to the bottom
            }
        }
    }

    private func cards(for category: String) -> [Card] {
        switch category {
        case "restaurant":
            return [
                Card(image: "restaurant_1", title: "Gourmet Bistro", rating: 4.6, reviews: 890, views: 1400),
                Card(image: "restaurant_2", title: "Fine Dining", rating: 4.8, reviews: 1200, views: 1600),
                Card(image: "restaurant_3", title: "Casual Eats", rating: 4.3, reviews: 560, views: 900)
            ]
        case "coffee":
            return [
                Card(image: "coffee_shop_1", title: "Cozy Cafe", rating: 4.5, reviews: 560, views: 800),
                Card(image: "coffee_shop_2", title: "Java Junction", rating: 4.7, reviews: 900, views: 1300),
                Card(image: "coffee_shop_3", title: "Espresso Haven", rating: 4.4, reviews: 430, views: 720)
            ]
        case "entertainment":
            return [
                Card(image: "boulevard_world", title: "Boulevard World", rating: 4.8, reviews: 1268, views: 2560),
                Card(image: "entertainment_park", title: "Entertainment Park", rating: 4.5, reviews: 1020, views: 1980),
                Card(image: "music_festival", title: "Music Festival", rating: 4.9, reviews: 1540, views: 3400)
            ]
        case "other":
            return [
                Card(image: "miscellaneous_1", title: "Event Space", rating: 4.3, reviews: 450, views: 700),
                Card(image: "miscellaneous_2", title: "Art Gallery", rating: 4.9, reviews: 980, views: 1500),
                Card(image: "miscellaneous_3", title: "Cultural Center", rating: 4.6, reviews: 670, views: 1020)
            ]
        default:
            return []
            
        }
    }
}

// MARK: - Card Model
struct Card: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let rating: Double
    let reviews: Int
    let views: Int
}

struct CardView: View {
    let card: Card
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomLeading) {
                // Card Image
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: isSelected ? 300 : 250, height: isSelected ? 250 : 200)
                    .cornerRadius(12)
                    .clipped()

                // Gradient Overlay
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(10), Color.black]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .cornerRadius(12)

                // Card Title
                Text(card.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding([.leading, .bottom], 8)
            }

            // Card Details: Rating, Reviews, Views
            HStack(spacing: 7) {
                // Rating
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", card.rating))
                        .font(.subheadline)
                        .foregroundColor(.black)
                }

                // Reviews
                HStack {
                    Image(systemName: "message.fill")
                        .foregroundColor(.blue)
                    Text("\(card.reviews) Reviews")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }

                // Views
                HStack {
                    Image(systemName: "eye.fill")
                        .foregroundColor(.gray)
                    Text("\(card.views) Views")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 8)

            // "Review" Button
            Button(action: {
                print("Review button tapped")
            }) {
                Text("Review")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(
            Color.pink
                .cornerRadius(12)
                
        )
    }
}

// MARK: - Map View & AI View
struct MapView: View { var body: some View { Color.white } }
struct AIView: View { var body: some View { Color.white } }

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
