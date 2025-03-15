@attached(body)
public macro NoOpBodyMacro() = #externalMacro(module: "BodyMacro", type: "NoOpBodyMacro")

@resultBuilder
public struct SumCollector {
	public static func buildBlock(_ components: Int...) -> Int {
		0 // no-op, not relevant for this demo
	}
}

extension Int {
	func add(@SumCollector _ other: () -> Int) {
		// no-op, not relevant for this demo
	}
}

struct Model {
	var number: Int // changing var to let makes it compile! 🤯
}

@propertyWrapper
@dynamicMemberLookup
struct Wrapper<T> {
	var wrappedValue: T
	var projectedValue: Self { self }

	// implementing the WritableKeyPath variation instead makes no difference here
	subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> U {
		wrappedValue[keyPath: keyPath]
	}
}

struct Container {
	@Wrapper var model: Model

	@NoOpBodyMacro // removing this makes it compile! 🤯
	func sum() {
		5.add {
			$model.number // changing this to model.number makes it compile! 🤯
		}
	}
}
