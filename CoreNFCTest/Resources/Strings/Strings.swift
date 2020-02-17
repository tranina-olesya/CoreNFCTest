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

  internal enum NFCWriter {
    /// Запись добавлена
    internal static let successMessage = L10n.tr("Localizable", "NFCWriter.successMessage")
    internal enum Error {
      /// Не удалось определить NDEF статус.
      internal static let failedDetermineNDEFStatus = L10n.tr("Localizable", "NFCWriter.Error.failedDetermineNDEFStatus")
      /// Неудалось записать. Попробуйте еще раз
      internal static let failedWrite = L10n.tr("Localizable", "NFCWriter.Error.failedWrite")
      /// Формат метки не поддерживается.
      internal static let notSupported = L10n.tr("Localizable", "NFCWriter.Error.notSupported")
      /// Для этой метки запись невозможна.
      internal static let notWritable = L10n.tr("Localizable", "NFCWriter.Error.notWritable")
      /// Недостаточно места. Необходимо %@ байт.
      internal static func smallCapacity(_ p1: String) -> String {
        return L10n.tr("Localizable", "NFCWriter.Error.smallCapacity", p1)
      }
      /// Найдено больше одной метки. Поднесите только одну.
      internal static let tooManyTags = L10n.tr("Localizable", "NFCWriter.Error.tooManyTags")
    }
  }

  internal enum NavigationBar {
    /// Готово
    internal static let ready = L10n.tr("Localizable", "NavigationBar.ready")
  }

  internal enum ReadTagScreen {
    /// Отсканировать метку
    internal static let scanButtonTitle = L10n.tr("Localizable", "ReadTagScreen.scanButtonTitle")
  }

  internal enum URLMessageInput {
    internal enum TypeLabel {
      /// Тип
      internal static let title = L10n.tr("Localizable", "URLMessageInput.typeLabel.Title")
    }
    internal enum UrlLabel {
      /// Ссылка
      internal static let title = L10n.tr("Localizable", "URLMessageInput.urlLabel.Title")
    }
  }

  internal enum WriteTagScreen {
    /// Записать сообщения
    internal static let writeButtonTitle = L10n.tr("Localizable", "WriteTagScreen.writeButtonTitle")
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
