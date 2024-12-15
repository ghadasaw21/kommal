import SwiftUI

struct Splash: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

// MARK: - ContentView (Explore Tab)
struct ContentView: View {
    @State private var selectedCategory: String = "entertainment"

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                    .padding(.leading)

                Spacer()
            }
            .padding(.vertical)

            Divider()

            // Category Tabs with Dynamic Scaling
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(["restaurant", "coffee", "entertainment", "other"], id: \.self) { category in
                        VStack {
                            Image(systemName: categoryIcon(for: category))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: selectedCategory == category ? 50 : 40,
                                       height: selectedCategory == category ? 50 : 40)
                                .foregroundColor(selectedCategory == category ? .blue : .gray)
                                .scaleEffect(selectedCategory == category ? 1.2 : 1.0)
                                .animation(.spring(), value: selectedCategory)
                            
                            Text(category.capitalized)
                                .font(selectedCategory == category ? .headline : .subheadline)
                                .foregroundColor(selectedCategory == category ? .blue : .gray)
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = category
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)

            Divider()

            // Horizontal ScrollView for Selected Category
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(cards(for: selectedCategory)) { card in
                        CardView(
                            image: card.image,
                            title: card.title,
                            rating: card.rating,
                            reviews: card.reviews,
                            views: card.views
                        )
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(.systemGray6))
            .padding(.vertical)

            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    private func categoryIcon(for category: String) -> String {
        switch category {
        case "restaurant": return "fork.knife"
        case "coffee": return "cup.and.saucer.fill"
        case "entertainment": return "film.fill"
        case "other": return "ellipsis.circle.fill"
        default: return "circle.fill"
        }
    }

    private func cards(for category: String) -> [Card] {
        switch category {
        case "restaurant":
            return [
                Card(image: "restaurant_1", title: "Gourmet Bistro", rating: 4.6, reviews: 890, views: 1400),
                Card(image: "restaurant_2", title: "Fine Dining", rating: 4.8, reviews: 1200, views: 1600)
            ]
        case "coffee":
            return [
                Card(image: "coffee_shop_1", title: "Cozy Cafe", rating: 4.5, reviews: 560, views: 800),
                Card(image: "coffee_shop_2", title: "Java Junction", rating: 4.7, reviews: 900, views: 1300)
            ]
        case "entertainment":
            return [
                Card(image: "boulevard_world", title: "Boulevard World", rating: 4.8, reviews: 1268, views: 2560),
                Card(image: "entertainment_park", title: "Entertainment Park", rating: 4.5, reviews: 1020, views: 1980)
            ]
        case "other":
            return [
                Card(image: "miscellaneous_1", title: "Event Space", rating: 4.3, reviews: 450, views: 700),
                Card(image: "miscellaneous_2", title: "Art Gallery", rating: 4.9, reviews: 980, views: 1500)
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

// MARK: - Card View
struct CardView: View {
    var image: String
    var title: String
    var rating: Double
    var reviews: Int
    var views: Int

    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .bottomLeading) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 287, height: 200)
                    .cornerRadius(12)
                    .clipped()

                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .cornerRadius(12)

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding([.leading, .bottom], 8)
            }

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Label("\(views)", systemImage: "eye")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Spacer()

                    Label("\(reviews)", systemImage: "heart.fill")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }

                HStack(spacing: 2) {
                    ForEach(0..<5) { star in
                        Image(systemName: star < Int(rating) ? "star.fill" : "star")
                            .foregroundColor(star < Int(rating) ? .yellow : .gray)
                    }
                    Text(String(format: "%.1f", rating))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding([.horizontal, .bottom], 10)
        }
        .frame(width: 287, height: 447)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

// MARK: - Favorites View
struct FavoritesView: View {
    var body: some View {
        Text("Favorites Tab")
            .font(.title)
            .padding()
    }
}

// MARK: - Profile View
struct ProfileView: View {
    var body: some View {
        Text("Profile Tab")
            .font(.title)
            .padding()
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
