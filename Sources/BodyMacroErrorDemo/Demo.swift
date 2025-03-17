@attached(body)
public macro NoOpBodyMacro() = #externalMacro(module: "BodyMacro", type: "NoOpBodyMacro")

class Demo {
	@NoOpBodyMacro // removing this makes it compile! 🤯
	func demo() {
		Task { [weak self] in // removing [weak self] makes it compile! 🤯
			// no-op, just the capture above is enough to trigger the build error
		}
	}
}
