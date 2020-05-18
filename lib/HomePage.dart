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
  List _seriesData = List<charts.Series<Pollution, String>>();
  List<charts.Series<Task, String>> _seriesPieData;

  List _datos = List<charts.Series<Poblacion, String>>();

  Data data = new Data();
  _generateData() {
    var data3 = [
      new Pollution(1985, 'USAFFF', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1985, 'Europe', 180),
    ];
    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];
    final dataVer = [
      new Poblacion(7, "Para ver con anteojos", 14471),
      new Poblacion(22, "Para ver con anteojos", 30661),
      new Poblacion(44, "Para ver con anteojos", 117509),
      new Poblacion(62, "Para ver con anteojos", 22374),
      new Poblacion(69, "Para ver con anteojos", 34089),
      new Poblacion(82, "Para ver con anteojos", 28368),
      new Poblacion(90, "Para ver con anteojos", 3992),
    ];
    final dataOir = [
      new Poblacion(7, "Para oir", 3339),
      new Poblacion(22, "Para oir", 4983),
      new Poblacion(44, "Para oir", 20643),
      new Poblacion(62, "Para oir", 5409),
      new Poblacion(69, "Para oir", 12858),
      new Poblacion(82, "Para oir", 19258),
      new Poblacion(90, "Para oir", 4219),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

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

    _datos.add(
      charts.Series(
          domainFn: (Poblacion cantidad, _) => cantidad.condicion,
          measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
          id: 'Ver',
          data: dataVer),
    );

    _datos.add(
      charts.Series(
          domainFn: (Poblacion cantidad, _) => cantidad.condicion,
          measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
          fillColorFn: (Poblacion cantidad, _) =>
              charts.ColorUtil.fromDartColor(Color(0xffff9900)),
          id: 'Oir',
          data: dataOir),
    );
  }



  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
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
            backgroundColor: Colors.teal,
            //backgroundColor: Color(0xff308e1c),
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
            title: Text('Visualizacion de la informacion '),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Grafico de Burbujas",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: charts.ScatterPlotChart(
                         Data.createDataBubble(),
                        
                        animate: true,
                        // barGroupingType: charts.BarGroupingType.grouped,
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
                        'Grafico de barras',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.BarChart(
                          _datos,
                          animate: true,
                          barGroupingType: charts.BarGroupingType.grouped,
                          //behaviors: [new charts.SeriesLegend()],
                          animationDuration: Duration(seconds: 5),
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
                        'Grafico circular',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: charts.PieChart(_seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification:
                                    charts.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                desiredMaxRows: 2,
                                cellPadding: new EdgeInsets.only(
                                    right: 4.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts
                                        .MaterialPalette.purple.shadeDefault,
                                    fontFamily: 'Georgia',
                                    fontSize: 11),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 100,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.inside)
                                ])),
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

class LinearSales {
  final int year;
  final int sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}

class Poblacion {
  int edad;
  String condicion;
  int cantidad;

  Poblacion(this.edad, this.condicion, this.cantidad);
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
