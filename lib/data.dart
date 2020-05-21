import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Data {


  static final dataVer = [
    new Poblacion(7, "Para ver con anteojos", 14471,Color(0xff990099)),
    new Poblacion(22, "Para ver con anteojos", 30661,Color(0xff3366cc)),
    new Poblacion(44, "Para ver con anteojos", 117509,Color(0xff109618)),
    new Poblacion(62, "Para ver con anteojos", 22374, Color(0xfffdbe19)),
    new Poblacion(69, "Para ver con anteojos", 34089,Color(0xffff9900)),
    new Poblacion(82, "Para ver con anteojos", 28368,Color(0xffdc3912)),
    new Poblacion(90, "Para ver con anteojos", 3992,Color(0xffff00ff)),
  ];


  static final dataOir = [
    new Poblacion(7, "Para oir", 3339,Color(0xff990099)),
    new Poblacion(22, "Para oir", 4983,Color(0xff3366cc)),
    new Poblacion(44, "Para oir", 20643,Color(0xff109618)),
    new Poblacion(62, "Para oir", 5409,Color(0xfffdbe19)),
    new Poblacion(69, "Para oir", 12858,Color(0xffff9900)),
    new Poblacion(82, "Para oir", 19258,Color(0xffdc3912)),
    new Poblacion(90, "Para oir", 4219,Color(0xffff00ff)),
  ];

  static final dataHablar = [
    new Poblacion(7, "Para hablar", 7331,Color(0xff990099)),
    new Poblacion(22, "Para hablar", 4810,Color(0xff3366cc)),
    new Poblacion(44, "Para hablar", 8359,Color(0xff109618)),
    new Poblacion(62, "Para hablar", 1210,Color(0xfffdbe19)),
    new Poblacion(69, "Para hablar", 2469,Color(0xffff9900)),
    new Poblacion(82, "Para hablar", 4126,Color(0xffdc3912)),
    new Poblacion(90, "Para hablar", 1108,Color(0xffff00ff)),
  ];

  //Color(0xff990099))
  //Color(0xff3366cc)),
  //Color(0xff109618)),
  //Color(0xfffdbe19)),
  //Color(0xffff9900)),
  //Color(0xffdc3912)),
  //Color(0xffff00ff)),

  static final dataCaminar = [
    new Poblacion(7, "Para caminar o subir gradas", 4749,Color(0xff990099)),
    new Poblacion(22, "Para caminar o subir gradas", 8350,Color(0xff990099)),
    new Poblacion(44, "Para caminar o subir gradas", 48919,Color(0xff990099)),
    new Poblacion(62, "Para caminar o subir gradas", 13790,Color(0xff990099)),
    new Poblacion(69, "Para caminar o subir gradas", 26710,Color(0xff990099)),
    new Poblacion(82, "Para caminar o subir gradas", 32221,Color(0xff990099)),
    new Poblacion(90, "Para caminar o subir gradas", 5641,Color(0xff990099)),
  ];

  static final dataBrazos = [
    new Poblacion(7, "Para utilizar brazos", 2202,Color(0xffff9900)),
    new Poblacion(22, "Para utilizar brazos", 3953,Color(0xffff9900)),
    new Poblacion(44, "Para utilizar brazos", 19530,Color(0xffff9900)),
    new Poblacion(62, "Para utilizar brazos", 4766,Color(0xffff9900)),
    new Poblacion(69, "Para utilizar brazos", 8216,Color(0xffff9900)),
    new Poblacion(82, "Para utilizar brazos", 8588,Color(0xffff9900)),
    new Poblacion(90, "Para utilizar brazos", 1604,Color(0xffff9900)),
  ];

  static final dataIntelectual = [
    new Poblacion(7, "Tipo Intelectual", 9571,Color(0xffdc3912)),
    new Poblacion(22, "Tipo Intelectual", 11395,Color(0xffdc3912)),
    new Poblacion(44, "Tipo Intelectual", 10867,Color(0xffdc3912)),
    new Poblacion(62, "Tipo Intelectual", 766,Color(0xffdc3912)),
    new Poblacion(69, "Tipo Intelectual", 1204,Color(0xffdc3912)),
    new Poblacion(82, "Tipo Intelectual", 1331,Color(0xffdc3912)),
    new Poblacion(90, "Tipo Intelectual", 282,Color(0xffdc3912)),
  ];

  static final dataMental = [
    new Poblacion(7, "Tipo Mental", 2624,Color(0xff109618)),
    new Poblacion(22, "Tipo Mental", 4957,Color(0xff109618)),
    new Poblacion(44, "Tipo Mental", 11258,Color(0xff109618)),
    new Poblacion(62, "Tipo Mental", 1429,Color(0xff109618)),
    new Poblacion(69, "Tipo Mental", 2476,Color(0xff109618)),
    new Poblacion(82, "Tipo Mental", 3514,Color(0xff109618)),
    new Poblacion(90, "Tipo Mental", 713,Color(0xff109618)),
  ];

  static List<charts.Series<Poblacion, String>> createDataBars() {
    return [
      new charts.Series<Poblacion, String>(
          id: 'Discapacidad para ver',
          colorFn: (Poblacion poblacion, _) {
            return charts.MaterialPalette.cyan.shadeDefault;
          },
          domainFn: (Poblacion cantidad, _) => cantidad.condicion,
          measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
           data: dataVer,
          labelAccessorFn: (Poblacion poblacion, _) => '${poblacion.edad}'),

      new charts.Series<Poblacion, String>(
        id: 'Discapacidad para oir',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.condicion,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
       data: dataOir,
       labelAccessorFn: (Poblacion poblacion, _) => '${poblacion.edad}'

      ),
      new charts.Series<Poblacion, String>(
        id: 'Discapacidad para caminar',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.deepOrange.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.condicion,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
       data: dataCaminar,
       labelAccessorFn: (Poblacion poblacion, _) => '${poblacion.edad}'

      ),
    ];
  }

  static List<charts.Series<Poblacion, int>> createDataBubble() {
    return [
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad para ver',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.red.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataVer,
      ),
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad para oir',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataOir,
      ),
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad para hablar',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.cyan.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataHablar,
      ),
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad para Caminar',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.deepOrange.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataCaminar,
      ),
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad para mover los brazos',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.yellow.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataBrazos,
      ),
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad Intelectual',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.green.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataIntelectual,
      ),
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad mental',
        colorFn: (Poblacion poblacion, _) {
          return charts.MaterialPalette.purple.shadeDefault;
        },
        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        radiusPxFn: (Poblacion cantidad, _) => cantidad.edad / 10,
        data: dataMental,
      ),
    ];
  }


  static List<charts.Series<Poblacion, int>> createDataPie() {

     return [
      new charts.Series<Poblacion, int>(
        id: 'Discapacidad para ver',

        domainFn: (Poblacion cantidad, _) => cantidad.edad,
        measureFn: (Poblacion cantidad, _) => cantidad.cantidad,
        colorFn: (Poblacion cantidad, _) {
          return charts.ColorUtil.fromDartColor(cantidad.colorval);

        },
        data: dataVer,
        labelAccessorFn: (Poblacion poblacion, _) => '${poblacion.cantidad}',



      ),    
    ];
  }
}

  

class Poblacion {
  int edad;
  String condicion;
  int cantidad;
  Color colorval;

  Poblacion(this.edad, this.condicion, this.cantidad, this.colorval);
}
