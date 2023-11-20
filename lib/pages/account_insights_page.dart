import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/insight.dart';
import 'package:picme/models/insights.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AccountInsightsPage extends StatefulWidget {
  const AccountInsightsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountInsightsPage> createState() => _AccountInsightsPageState();
}

class _AccountInsightsPageState extends State<AccountInsightsPage> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  Insights insights = Insights(insights: [Insight(views: 0, likes: 0),Insight(views: 0, likes: 0),Insight(views: 0, likes: 0),Insight(views: 0, likes: 0)]);

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
    load();
  }

  load() async {
    // String uri = "/post/post_get";

    Caller.dio
        .get(
      "/insight/",
    )
        .then((response) {
      print('aaaaa');
      setState(() {
        print(response.data["data"]);
        insights = Insights.fromJson(response.data["data"]);
        _chartData = getChartData();
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
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
                  LineSeries<ExpenseData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData exp, _) => exp.expenseWeek,
                    yValueMapper: (ExpenseData exp, _) => exp.reach,
                    name: 'Reach',
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                  LineSeries<ExpenseData, String>(
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
    print(insights?.insights);
    final List<ExpenseData> chartData = [
      ExpenseData('Week 1', insights?.insights[0].views ?? 0,
          insights?.insights[0].likes ?? 0),
      ExpenseData('Week 2', insights?.insights[1].views ?? 0,
          insights?.insights[1].likes ?? 0),
      ExpenseData('Week 3', insights?.insights[2].views ?? 0,
          insights?.insights[2].likes ?? 0),
      ExpenseData('Week 4', insights?.insights[3].views ?? 0,
          insights?.insights[3].likes ?? 0),
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
