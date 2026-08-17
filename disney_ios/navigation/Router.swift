import SwiftUI


enum AppRoute: Hashable, Equatable {
    case characterDetails(characterId: String)
}

@Observable
class Router {
    var path = NavigationPath()
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty { path.removeLast() }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

