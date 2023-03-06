import SwiftUI
import os.signpost

struct ContentView: View {
    private let performanceCalculator = PerformanceCalculator()
    
    @State private var time: Double?
    
    var body: some View {
        NavigationView{
            VStack {

                Button("Run Benchmark") {
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
            for i in 0...20 {
                let timeStampBefore = ProcessInfo.processInfo.systemUptime
                //FannkuchRedux().runBenchmark(n: 10)
                NBody().runBenchmark(n: 350000)
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
