import SwiftUI
import shared

struct ContentView: View {
	private let performanceCalculator = PerformanceCalculator()

    @State private var time: Double?

    var body: some View {
        NavigationView{
            VStack {

                Button("Run FannkuchRedux") {
                    self.benchFannkuchRedux()
                }

                Button("Run NBody") {
                    self.benchNBody()
                }

            }.navigationTitle("BenchRunner")
        }
        .padding()
    }

    func benchFannkuchRedux() {
        DispatchQueue.main.async {
            performanceCalculator.start()
        }
        DispatchQueue.global().async {
            print("Benchmarking FannkuchRedux")
            print("Kotlin Converted starting")
            for i in 0...2 {
                let timeStampBefore = ProcessInfo.processInfo.systemUptime
                FannkuchReduxConverted().runBenchmark(n: Int32(10))
                let timeStampAfter = ProcessInfo.processInfo.systemUptime
                self.time = timeStampAfter - timeStampBefore
                print("Execution time (iteration \(i+1)): \(time!)")
            }
            print("Kotlin Idiomatic starting")
            for i in 0...2 {
                let timeStampBefore = ProcessInfo.processInfo.systemUptime
                FannkuchReduxIdiomatic().runBenchmark(n: Int32(10))
                let timeStampAfter = ProcessInfo.processInfo.systemUptime
                self.time = timeStampAfter - timeStampBefore
                print("Execution time (iteration \(i+1)): \(time!)")
            }
            performanceCalculator.pause()
        }
    }

    func benchNBody() {
            DispatchQueue.main.async {
                performanceCalculator.start()
            }
            DispatchQueue.global().async {
                print("Benchmarking NBody")
                print("Kotlin Converted starting")
                for i in 0...2 {
                    let timeStampBefore = ProcessInfo.processInfo.systemUptime
                    NBodyConverted().runBenchmark(n: 350000)
                    let timeStampAfter = ProcessInfo.processInfo.systemUptime
                    self.time = timeStampAfter - timeStampBefore
                    print("Execution time (iteration \(i+1)): \(time!)")
                }
                print("Kotlin Idiomatic starting")
                for i in 0...2 {
                    let timeStampBefore = ProcessInfo.processInfo.systemUptime
                    NBodyIdiomatic().runBenchmark(n: 350000)
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
