import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Task, String>> _seriesPieData;
  Data data = new Data();

  _generateData() {
    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();

    _generateData();
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
              ],
            ),
            title: Text('Personas con discapacidad en CR '),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Total de personas con discapacidad según su edad ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
                            textAlign: TextAlign.center,
                      ),
                      Expanded(
                          child: charts.ScatterPlotChart(
                        Data.createDataBubble(),
                        animate: true,
                        animationDuration: Duration(seconds: 3),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Total de personas según su edad y condición',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Raleway'),
                            textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: charts.BarChart(
                          Data.createDataBars(),
                          animate: true,
                          barGroupingType: charts.BarGroupingType.stacked,
                          barRendererDecorator:
                              new charts.BarLabelDecorator<String>(),
                          animationDuration: Duration(seconds: 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cantidad de personas con discapacidad visual según su edad',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
                            textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: charts.PieChart(
                          Data.createDataPie(),
                          animate: true,
                          animationDuration: Duration(seconds: 3),
                          behaviors: [

                            new charts.DatumLegend(
                              outsideJustification:
                                  charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.gray.shadeDefault,
                                  fontFamily: 'Raleway',
                                  fontSize: 14),
                            )
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 100,                              
                              arcRendererDecorators: [
                                new charts.ArcLabelDecorator(
                                    labelPosition:
                                        charts.ArcLabelPosition.inside)
                              ])
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ])),
    ));
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
