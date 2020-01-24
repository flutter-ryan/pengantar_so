import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pengantar_so/model/urgensi.dart';
import 'package:pengantar_so/services/urgensi_service.dart';

class UrgensiChart extends StatefulWidget {
  @override
  _UrgensiChartState createState() => _UrgensiChartState();
}

class _UrgensiChartState extends State<UrgensiChart> {
  UrgensiService service = UrgensiService();
  Future<List<Urgensi>> data;

  List<charts.Series<Urgensi, String>> _seriesDonutData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = service.getUrgensi();
  }

  List<Urgensi> myData;

  _generatedData(mydata) {
    _seriesDonutData = List<charts.Series<Urgensi, String>>();
    _seriesDonutData.add(
      charts.Series<Urgensi, String>(
          domainFn: (Urgensi urgensi, _) => urgensi.skalaPrioritas.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
