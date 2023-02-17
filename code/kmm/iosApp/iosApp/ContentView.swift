import SwiftUI
import shared

struct ContentView: View {
	@State private var count = 0
	@State private var n = Int32(10)

	var body: some View {
		NavigationView{
            VStack {

                Button("Run benchmark") {
                    self.inc()
                    self.bench() // Run the benchmark
                }

                Text("\(self.count)")

            }.navigationTitle("BenchRunner")
        }
        .padding()
	}

	func bench() {
	    let before = ProcessInfo.processInfo.systemUptime
	    FannkuchRedux().runBenchmark(n: self.n)
	    let after = ProcessInfo.processInfo.systemUptime
        let time = after - before
        print("Execution time: \(time)")
	}

	func inc() {
        count += 1
   }

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}