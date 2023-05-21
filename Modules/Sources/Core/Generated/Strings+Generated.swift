// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// About me
  public static let aboutMeTitle = L10n.tr("Localizable", "about_me_title", fallback: "About me")
  /// An error ocurred
  public static let errorDescription = L10n.tr("Localizable", "error_description", fallback: "An error ocurred")
  /// Fork
  public static let fork = L10n.tr("Localizable", "fork", fallback: "Fork")
  /// Home
  public static let homeTab = L10n.tr("Localizable", "home_tab", fallback: "Home")
  /// My name is Juan Carlos Carbajal Ipenza. I am an iOS developer and master of computer science. If you want to know more about me, follow me on my [linkedin](https://www.linkedin.com/in/juan-carlos-carbajal-ipenza-168bab127/).
  public static let meDescription = L10n.tr("Localizable", "me_description", fallback: "My name is Juan Carlos Carbajal Ipenza. I am an iOS developer and master of computer science. If you want to know more about me, follow me on my [linkedin](https://www.linkedin.com/in/juan-carlos-carbajal-ipenza-168bab127/).")
  /// Organizations
  public static let orgsTab = L10n.tr("Localizable", "orgs_tab", fallback: "Organizations")
  /// Organizations
  public static let orgsTitle = L10n.tr("Localizable", "orgs_title", fallback: "Organizations")
  /// Private
  public static let `private` = L10n.tr("Localizable", "private", fallback: "Private")
  /// Profile
  public static let profileTab = L10n.tr("Localizable", "profile_tab", fallback: "Profile")
  /// Public
  public static let `public` = L10n.tr("Localizable", "public", fallback: "Public")
  /// Repositories
  public static let reposTab = L10n.tr("Localizable", "repos_tab", fallback: "Repositories")
  /// Repositories
  public static let reposTitle = L10n.tr("Localizable", "repos_title", fallback: "Repositories")
  /// See All
  public static let seeAll = L10n.tr("Localizable", "see_all", fallback: "See All")
  /// Tap
  public static let tap = L10n.tr("Localizable", "tap", fallback: "Tap")
  /// Under Construction
  public static let underConstructionDescription = L10n.tr("Localizable", "under_construction_description", fallback: "Under Construction")
  /// Users
  public static let usersTab = L10n.tr("Localizable", "users_tab", fallback: "Users")
  /// Users
  public static let usersTitle = L10n.tr("Localizable", "users_title", fallback: "Users")
  /// We're sorry...
  public static let warningTitle = L10n.tr("Localizable", "warning_title", fallback: "We're sorry...")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
