// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class DashBoard extends StatefulWidget {
//   const DashBoard({super.key});

//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
// late List<ExpenseData> _chartData;

// @override
//   void initState() {
//     _chartData = getChartData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SfCartesianChart(
//         series: <ChartSeries>[
//           StackedLineSeries<ExpenseData, String>(
//           dataSource: _chartData, 
//           xValueMapper: (ExpenseData exp, _) => exp.expenseWeek, 
//           yValueMapper: (ExpenseData exp, _) => exp.reach)
//         ],
//         primaryXAxis: CategoryAxis(),
//       ),
//     );
//   }

//   List<ExpenseData> getChartData(){
//     final List<ExpenseData> chartData = [
//       ExpenseData('Week 1', 32, 50),
//       ExpenseData('Week 2', 55, 80),
//       ExpenseData('Week 3', 24, 44),
//       ExpenseData('Week 4', 36, 56),
//     ];
//     return chartData;
//   }

// }

// class ExpenseData{
//   ExpenseData(this.expenseWeek, this.reach, this.engaged);
//   final String expenseWeek;
//   final num reach;
//   final num engaged;
// }