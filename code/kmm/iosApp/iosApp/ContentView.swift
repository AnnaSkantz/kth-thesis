import SwiftUI
import shared

struct ContentView: View {
	private let performanceCalculator = PerformanceCalculator()

        private let n = Int32(10)
        @State private var time: Double?

        var body: some View {
            NavigationView{
                VStack {

                    Button("Run benchmark") {
                        self.benchPerformance()
                    }

                }.navigationTitle("BenchRunner")
            }
            .padding()
        }

        func benchPerformance() {
            DispatchQueue.main.async {
                performanceCalculator.start()
            }
            DispatchQueue.global().async {
                for i in 0...4 {
                    let timeStampBefore = ProcessInfo.processInfo.systemUptime
                    FannkuchRedux().runBenchmark(n: self.n)
                    let timeStampAfter = ProcessInfo.processInfo.systemUptime
                    self.time = timeStampAfter - timeStampBefore
                    print("Execution time (iteration \(i+1)): \(time!)")
                }
                performanceCalculator.pause()
            }
        }

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
