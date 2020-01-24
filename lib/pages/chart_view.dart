import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pengantar_so/model/riwayat.dart';
import 'package:pengantar_so/services/riwayat_service.dart';

class ChartView extends StatefulWidget {
  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  RiwayatService service = RiwayatService();
  Future<List<Riwayat>> data;

  List<charts.Series<Riwayat, String>> _seriesBarData;

  @override
  void initState() {
    super.initState();
    data = service.getRiwayat();
  }

  List<Riwayat> myData;

  _generatedData(myData) {
    _seriesBarData = List<charts.Series<Riwayat, String>>();
    _seriesBarData.add(
      charts.Series<Riwayat, String>(
        domainFn: (Riwayat riwayat, _) => riwayat.namaBulan,
        measureFn: (Riwayat riwayat, _) => riwayat.total,
        colorFn: (Riwayat riwayat, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(riwayat.color))),
        data: myData,
        labelAccessorFn: (Riwayat row, _) => '${row.namaBulan}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Riwayat> data = snapshot.data;
          return _buildChart(context, data);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Connection problem!'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Riwayat> data) {
    myData = data;
    _generatedData(myData);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text('Data Per bulan'),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: charts.BarChart(
                _seriesBarData,
                animate: true,
                animationDuration: Duration(seconds: 1),
                behaviors: [
                  charts.DatumLegend(
                    entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.purple.shadeDefault,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
