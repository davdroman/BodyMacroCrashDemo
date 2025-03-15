// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
	name: "BodyMacroCrashDemo",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
	],
	products: [
		.library(
			name: "BodyMacroCrashDemo",
			targets: ["BodyMacroCrashDemo"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/swiftlang/swift-syntax", "509.0.0"..<"602.0.0"),
	],
	targets: [
		.target(name: "BodyMacroCrashDemo", dependencies: ["BodyMacro",]),

		.macro(
			name: "BodyMacro",
			dependencies: [
				.product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
				.product(name: "SwiftCompilerPlugin", package: "swift-syntax")
			]
		),
	]
)
