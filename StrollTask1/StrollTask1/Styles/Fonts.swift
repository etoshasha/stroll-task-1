import SwiftUI

// MARK: — Proxima Nova with Dynamic Type support
extension Font {
  /// Returns a Proxima Nova font at `size`, scaled by Dynamic Type.
  static func proximaNova(
    size: CGFloat,
    weight: ProximaWeight = .regular
  ) -> Font {
    let name: String
    switch weight {
    case .regular:
      name = AppFonts.ProximaNova.regular
    case .semibold:
      name = AppFonts.ProximaNova.semibold
    case .bold:
      name = AppFonts.ProximaNova.bold
    case .italic:
      name = AppFonts.ProximaNova.italic
    }

    guard let uiFont = UIFont(name: name, size: size) else {
      return .system(size: size)
    }
    let scaled = UIFontMetrics.default.scaledFont(for: uiFont)
    return Font(scaled)
  }

  /// Returns an Inter font at `size`, scaled by Dynamic Type.
  static func interBold(size: CGFloat) -> Font {
    let name = AppFonts.Inter.bold
    guard let uiFont = UIFont(name: name, size: size) else {
      return .system(size: size)
    }
    let scaled = UIFontMetrics.default.scaledFont(for: uiFont)
    return Font(scaled)
  }
}

// MARK: — Proxima Nova weight enum
enum ProximaWeight {
  case regular, semibold, bold, italic
}


// MARK: — Font file (PostScript) names
enum AppFonts {
  enum ProximaNova {
    static let regular  = "ProximaNova-Regular"
    static let semibold = "ProximaNova-Semibold"
    static let bold     = "ProximaNova-Bold"
    static let italic   = "ProximaNovaCond-RegularIt"
  }

  enum Inter {
    static let bold    = "Inter-Bold"
  }
}
