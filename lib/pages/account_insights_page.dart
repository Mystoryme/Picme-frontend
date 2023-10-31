import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AccountInsightsPage extends StatefulWidget {
  const AccountInsightsPage({super.key});

  @override
  State<AccountInsightsPage> createState() => _AccountInsightsPageState();
}

class _AccountInsightsPageState extends State<AccountInsightsPage> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 150,
                  // ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Account Insights',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SfCartesianChart(
                title: ChartTitle(text: 'Overview Account'),
                legend: const Legend(
                    isVisible: true, position: LegendPosition.bottom),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  StackedLineSeries<ExpenseData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData exp, _) => exp.expenseWeek,
                    yValueMapper: (ExpenseData exp, _) => exp.reach,
                    name: 'Reach',
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                  StackedLineSeries<ExpenseData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData exp, _) => exp.expenseWeek,
                    yValueMapper: (ExpenseData exp, _) => exp.engaged,
                    name: 'Engaged',
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                ],
                primaryXAxis: CategoryAxis(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('Week 1', 32, 50),
      ExpenseData('Week 2', 55, 80),
      ExpenseData('Week 3', 24, 44),
      ExpenseData('Week 4', 36, 56),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(this.expenseWeek, this.reach, this.engaged);
  final String expenseWeek;
  final num reach;
  final num engaged;
}
