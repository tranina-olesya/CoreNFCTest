// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Поднесите телефон к метке
  internal static let nfcAlertMessage = L10n.tr("Localizable", "NFCAlertMessage")

  internal enum MainTabBarScreen {
    internal enum ReadTab {
      /// Чтение
      internal static let title = L10n.tr("Localizable", "MainTabBarScreen.ReadTab.Title")
    }
    internal enum WriteTab {
      /// Запись
      internal static let title = L10n.tr("Localizable", "MainTabBarScreen.WriteTab.Title")
    }
  }

  internal enum ReadTagScreen {
    /// Отсканировать метку
    internal static let scanButtonTitle = L10n.tr("Localizable", "ReadTagScreen.scanButtonTitle")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
