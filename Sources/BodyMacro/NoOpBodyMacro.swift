import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct NoOpBodyMacro: BodyMacro {
	public static func expansion(
		of node: AttributeSyntax,
		providingBodyFor declaration: some DeclSyntaxProtocol & WithOptionalCodeBlockSyntax,
		in context: some MacroExpansionContext
	) throws -> [CodeBlockItemSyntax] {
		guard
			let functionDecl = declaration.as(FunctionDeclSyntax.self),
			let body = functionDecl.body
		else {
			fatalError()
		}

		return Array(body.statements)
	}
}

@main
struct UIKitNavigationBreaksMacroDemoPlugin: CompilerPlugin {
	let providingMacros: [Macro.Type] = [
		NoOpBodyMacro.self,
	]
}
