
import SwiftUI

extension Color {
    static let gold = Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
}

struct CharactersView: View {
    @State var viewModel: CharactersViewModel
    @Environment(Router.self) private var router
    
    init(charactersViewModel: CharactersViewModel) {
        self.viewModel = charactersViewModel
    }
    
    var body: some View {
        List(viewModel.charactersState.characters, id: \.id) { character in
            HStack() {
                if let imageUrl = character.imageUrl {
                    let url = URL(string: imageUrl)
                    
                    AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.metallicGold, lineWidth: 2)
                        )
                        .padding(.all, 10)
                }
                
                Text(character.name)
                    .foregroundStyle(.metallicGold)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.metallicGold, lineWidth: 2)
            )
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            .listRowBackground(Color.black.ignoresSafeArea())
            .onTapGesture {
                router.navigate(to: .characterDetails(characterId: "todo"))
            }
        }
        .listStyle(.plain)
        .background(Color.black.ignoresSafeArea())
        .task {
            await viewModel.getCharacters()
        }
    }
}

