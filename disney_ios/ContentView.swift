import SwiftUI

struct ContentView: View {
    let container = CharactersDiContainer()
    @State private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            CharactersView(charactersViewModel: container.getCharactersViewModel())
                .navigationTitle("Disney Characters")
                .navigationBarStyle(.goldAndBlack)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .characterDetails(let id):
                        CharacterDetailView()
                    }
                }
        }
        .environment(container)
        .environment(router)
        .background(Color.black.ignoresSafeArea())
    }
}
