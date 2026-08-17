
import SwiftUI



@MainActor
@Observable
class CharactersRepository {
    var charactersRemoteDataSource: CharactersRemoteDataSource
    
    init(charactersRemoteDataSource: CharactersRemoteDataSource) {
        self.charactersRemoteDataSource = charactersRemoteDataSource
    }
    
    func getCharacters() async throws -> [Character] {
        return try await charactersRemoteDataSource.getCharacters().data
    }
}
