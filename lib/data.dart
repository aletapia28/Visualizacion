import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Data {
  List _datos = List<charts.Series<Poblacion, String>>();

  static final dataVer = [
    new Poblacion(7, "Para ver con anteojos", 14471),
    new Poblacion(22, "Para ver con anteojos", 30661),
    new Poblacion(44, "Para ver con anteojos", 117509),
    new Poblacion(62, "Para ver con anteojos", 22374),
    new Poblacion(69, "Para ver con anteojos", 34089),
    new Poblacion(82, "Para ver con anteojos", 28368),
    new Poblacion(90, "Para ver con anteojos", 3992),
  ];

  static final dataOir = [
    new Poblacion(7, "Para oir", 3339),
    new Poblacion(22, "Para oir", 4983),
    new Poblacion(44, "Para oir", 20643),
    new Poblacion(62, "Para oir", 5409),
    new Poblacion(69, "Para oir", 12858),
    new Poblacion(82, "Para oir", 19258),
    new Poblacion(90, "Para oir", 4219),
  ];

  static final dataHablar = [
    new Poblacion(7, "Para hablar", 7331),
    new Poblacion(22, "Para hablar", 4810),
    new Poblacion(44, "Para hablar", 8359),
    new Poblacion(62, "Para hablar", 1210),
    new Poblacion(69, "Para hablar", 2469),
    new Poblacion(82, "Para hablar", 4126),
    new Poblacion(90, "Para hablar", 1108),
  ];

  static final dataCaminar = [
    new Poblacion(7, "Para caminar o subir gradas", 4749),
    new Poblacion(22, "Para caminar o subir gradas", 8350),
    new Poblacion(44, "Para caminar o subir gradas", 48919),
    new Poblacion(62, "Para caminar o subir gradas", 13790),
    new Poblacion(69, "Para caminar o subir gradas", 26710),
    new Poblacion(82, "Para caminar o subir gradas", 32221),
    new Poblacion(90, "Para caminar o subir gradas", 5641),
  ];

  static final dataBrazos = [
    new Poblacion(7, "Para utilizar brazos", 2202),
    new Poblacion(22, "Para utilizar brazos", 3953),
    new Poblacion(44, "Para utilizar brazos", 19530),
    new Poblacion(62, "Para utilizar brazos", 4766),
    new Poblacion(69, "Para utilizar brazos", 8216),
    new Poblacion(82, "Para utilizar brazos", 8588),
    new Poblacion(90, "Para utilizar brazos", 1604),
  ];

  static final dataIntelectual = [
    new Poblacion(7, "Tipo Intelectual", 9571),
    new Poblacion(22, "Tipo Intelectual", 11395),
    new Poblacion(44, "Tipo Intelectual", 10867),
    new Poblacion(62, "Tipo Intelectual", 766),
    new Poblacion(69, "Tipo Intelectual", 1204),
    new Poblacion(82, "Tipo Intelectual", 1331),
    new Poblacion(90, "Tipo Intelectual", 282),
  ];

  static final dataMental = [
    new Poblacion(7, "Tipo Mental", 2624),
    new Poblacion(22, "Tipo Mental", 4957),
    new Poblacion(44, "Tipo Mental", 11258),
    new Poblacion(62, "Tipo Mental", 1429),
    new Poblacion(69, "Tipo Mental", 2476),
    new Poblacion(82, "Tipo Mental", 3514),
    new Poblacion(90, "Tipo Mental", 713),
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
        id: 'Discapacidad para Caminar',
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
}

class Poblacion {
  int edad;
  String condicion;
  int cantidad;

  Poblacion(this.edad, this.condicion, this.cantidad);
}
