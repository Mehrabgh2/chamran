import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class LiveSPLineChart extends StatelessWidget {
  LiveSPLineChart({this.xCount = 8, required this.color});

  List<_ChartData> chartData = [_ChartData(0, 0)];
  int count = 1;
  ChartSeriesController? _chartSeriesController;
  final int xCount;
  final Color color;
  late SfCartesianChart chart;
  int totalChartDataCount = 0;

  @override
  Widget build(BuildContext context) {
    return _buildLiveLineChart(MediaQuery.of(context).size);
  }

  Widget _buildLiveLineChart(Size size) {
    chart = createChart();
    return chart;
  }

  SfCartesianChart createChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          labelStyle: TextStyle(fontSize: 11),
          majorTickLines: const MajorTickLines(width: 0),
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          isVisible: false),
      primaryYAxis: NumericAxis(
          labelStyle: TextStyle(fontSize: 11),
          minimum: -5,
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          isVisible: false),
      series: <SplineSeries<_ChartData, int>>[
        SplineSeries<_ChartData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: chartData,
          color: color,
          cardinalSplineTension: 0.8,
          splineType:
              chartData.length > 2 ? SplineType.cardinal : SplineType.natural,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
        ),
      ],
    );
  }

  void addLine(double? x1) {
    if (x1 != null) {
      totalChartDataCount++;
      chartData.add(_ChartData(count, x1));
      if (chartData.length == xCount + 1) {
        chartData.removeAt(0);
        _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0],
        );
      } else {
        _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
        );
      }
      count++;
    }
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final int x;
  final double y;
}
