import Foundation
import Observation


struct CharactersState {
    let isLoading: Bool = true
    var characters = [Character]()
}

@Observable
@MainActor
class CharactersViewModel {
    let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    var charactersState: CharactersState = CharactersState()
    
    func getCharacters() async {
        do {
            let result = try await charactersRepository.getCharacters()
            charactersState.characters = result
        } catch {
            print(error)
        }
    }
}
