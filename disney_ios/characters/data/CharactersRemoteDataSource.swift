import SwiftUI

class CharactersRemoteDataSource {
    
    func getCharacters() async throws -> CharactersContainer {
        guard let url = URL(string: "https://api.disneyapi.dev/character") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.unknown(URLError(.badServerResponse))
            }
                        
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            }
            
            let decoder = JSONDecoder()
            let characters = try decoder.decode(CharactersContainer.self, from: data)
            return characters
        } catch {
            throw NetworkError.unknown(error)
        }
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case serverError(statusCode: Int)
    case decodingFailed
    case unknown(Error)
}
