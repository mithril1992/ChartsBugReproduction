//
//  ViewController.swift
//  ChartsBugReproduction
//
//  Created by mithril1992 on 2024/03/13.
//

import UIKit
import DGCharts

class ViewController: UIViewController {

    @IBOutlet var chartView: CandleStickChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        var base = Int.random(in: 1000...2000)

        var entries = [CandleChartDataEntry]()

        for idx in 0 ... 200 {
            let highRatio = Double.random(in: 0.00 ... 0.05)
            let high = Double(base) * (1 + highRatio)

            let lowRatio = Double.random(in: 0.00 ... 0.05)
            let low = Double(base) * (1 - lowRatio)

            let open = Double.random(in: low ... high)
            let close = Double.random(in: low ... high)

            let entry = CandleChartDataEntry(
                x: Double(idx),
                shadowH: high,
                shadowL: low,
                open: open,
                close: close
            )

            entries.append(entry)

            base = Int.random(in: Int(low) ... Int(high))
        }

        let dataSet = CandleChartDataSet(entries: entries)
        dataSet.decreasingColor = .red
        dataSet.decreasingFilled = true
        dataSet.increasingColor = .green
        dataSet.increasingFilled = true
        dataSet.neutralColor = .gray
        dataSet.shadowColorSameAsCandle = true
        let data = CandleChartData(dataSet: dataSet)

        self.chartView.data = data
        self.chartView.autoScaleMinMaxEnabled = true
        self.chartView.setVisibleXRange(minXRange: 25, maxXRange: 25)
        self.chartView.dragXEnabled = true
        self.chartView.dragYEnabled = false
    }


}

