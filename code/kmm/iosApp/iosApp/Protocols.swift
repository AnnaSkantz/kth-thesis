//
// Copyright © 2017 Gavrilov Daniil
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// Modified by Anna Skantz, 2023.
// Source: https://github.com/dani-gavrilov/GDPerformanceView-Swift/blob/master/GDPerformanceView-Swift/GDPerformanceMonitoring/Protocols.swift
//
import Foundation

/// Memory usage tuple. Contains used and total memory in bytes.
public typealias MemoryUsage = (used: Double, total: Double)

/// Performance report tuple. Contains CPU usage in percentages and memory usage.
public typealias PerformanceReport = (cpuUsage: Double, memoryUsage: MemoryUsage)
