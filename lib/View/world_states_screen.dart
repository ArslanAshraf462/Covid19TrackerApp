import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  // List<Color> colorList = [
  //   const Color(0xff4285F4),
  //   const Color(0xff1aa260),
  //   const Color(0xffde5246),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const PieChart(
                 chartRadius: 132,
                  dataMap: {
                  'Total' : 20,
                  'Recovered': 15,
                  'Deaths' : 5,
                },
                animationDuration: Duration(microseconds: 1200),
                  chartType: ChartType.ring,
                  legendOptions: LegendOptions(
                    legendPosition: LegendPosition.left,
                  ),
                  colorList:[
                    const Color(0xff4285F4),
                    const Color(0xff1aa260),
                    const Color(0xffde5246),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06),
                  child: Card(
                    child: Column(
                      children: [
                        ReusableRow(title: 'Total', value: '200'),
                        ReusableRow(title: 'Total', value: '200'),
                        ReusableRow(title: 'Total', value: '200'),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff1aa260),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Track Countries'),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      right: 10,
      top: 10,
      bottom: 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
        ],
      ),
    );
  }
}
