import Dispatch

@attached(body)
public macro NoOpBodyMacro() = #externalMacro(module: "BodyMacro", type: "NoOpBodyMacro")

class Demo {
	@NoOpBodyMacro
	func demo() {
		let doSomething = { [weak self] in
			// no-op
		}
	}
}
