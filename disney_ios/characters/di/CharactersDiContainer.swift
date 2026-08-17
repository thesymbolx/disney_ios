

import Foundation

@Observable
final class CharactersDiContainer {
    func getCharactersDataStore() -> CharactersRemoteDataSource {
        return CharactersRemoteDataSource()
    }
    
    func getCharactersRepository() -> CharactersRepository {
        return CharactersRepository(charactersRemoteDataSource: getCharactersDataStore())
    }
    
    func getCharactersViewModel() -> CharactersViewModel {
        return CharactersViewModel(charactersRepository: getCharactersRepository())
    }
}
