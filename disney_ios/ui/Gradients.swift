
import SwiftUI

extension ShapeStyle where Self == LinearGradient {
    static var metallicGold: LinearGradient {
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.61, green: 0.44, blue: 0.08), location: 0.0),  // Deep shadow
                Gradient.Stop(color: Color(red: 0.84, green: 0.69, blue: 0.22), location: 0.2),  // Base gold
                Gradient.Stop(color: Color(red: 1.0, green: 0.98, blue: 0.75), location: 0.5),   // Bright highlight
                Gradient.Stop(color: Color(red: 0.84, green: 0.69, blue: 0.22), location: 0.8),  // Base gold
                Gradient.Stop(color: Color(red: 0.71, green: 0.54, blue: 0.15), location: 1.0)   // Darker edge
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

extension UIColor {
    static let metallicGold = UIColor(red: 0.83, green: 0.69, blue: 0.22, alpha: 1.0)
}
