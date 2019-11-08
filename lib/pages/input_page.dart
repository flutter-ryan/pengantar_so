import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pengantar_so/common/bloc/pasien_bloc.dart';
import 'package:pengantar_so/common/widget_builder/input_so.dart';
import 'package:pengantar_so/model/pasien.dart';
import 'package:pengantar_so/services/pasien_service.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key, this.norm}) : super(key: key);

  final String norm;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  PasienService pasien = PasienService();
  String norm;

  @override
  void initState() {
    super.initState();
    norm = widget.norm;
  }

  final String dataInfoPasien = 'none';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: GradientAppBar(
        elevation: 0.0,
        centerTitle: false,
        titleSpacing: 1.0,
        title: Text('Back'),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xFF89C2CB),
            Color(0xFFB2A67E),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: pasien.getPasien(norm),
          builder: (context, AsyncSnapshot<Pasien> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData &&
                snapshot.data != null) {
              Pasien pasien = snapshot.data;
              return _buildIdentitas(pasien);
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error.toString()}',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildText(String title, Color color, double size, FontWeight weight) {
    return Text(
      title,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }

  Widget _buildCardData(
      String noreg, String unit, String tgl, RaisedButton raisedButton) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(
          18.0,
        ),
        child: ListTile(
          title: Text(
            noreg,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22.0,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                tgl,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                'cara bayar',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          trailing: raisedButton,
        ),
      ),
    );
  }

  Widget _buildIdentitas(Pasien pasien) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xFF89C2CB),
            Color(0xFFB2A67E),
          ],
        ),
        boxShadow: [
          BoxShadow(blurRadius: 4.0, color: Colors.grey[700]),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 64.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/ic_profile.jpg'),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 22.0,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildText(
                          '$pasien.norm', Colors.black, 32.0, FontWeight.w700),
                      SizedBox(
                        height: 8.0,
                      ),
                      _buildText(
                          '$pasien.nama', Colors.black, 18.0, FontWeight.w500),
                      SizedBox(
                        height: 4.0,
                      ),
                      _buildText('$pasien.tglLahir', Colors.black, 18.0,
                          FontWeight.w500),
                      SizedBox(
                        height: 4.0,
                      ),
                      _buildText('$pasien.jenisKelamin.jk', Colors.black, 18.0,
                          FontWeight.w500),
                      SizedBox(
                        height: 4.0,
                      ),
                      _buildText('$pasien.alamat', Colors.black, 18.0,
                          FontWeight.w500),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kunjungan',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  ListView.builder(
                    itemCount: pasien.register.length,
                    itemBuilder: (context, index) {
                      return _buildCardData(
                        '201004051011101000010',
                        'Interna',
                        '05-04-2010 08:58:07',
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            return showGeneralDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionBuilder: (context, a1, a2, widget) {
                                  final curvedValue =
                                      Curves.easeInOutBack.transform(a1.value) -
                                          1.0;
                                  return Transform(
                                    transform: Matrix4.translationValues(
                                        0.0, curvedValue * 200, 0.0),
                                    child: Opacity(
                                      opacity: a1.value,
                                      child: AlertDialog(
                                        title: Text(
                                          'Input Pengantar Rawat Inap',
                                        ),
                                        titlePadding: EdgeInsets.fromLTRB(
                                            32.0, 24.0, 32.0, 18.0),
                                        contentPadding: EdgeInsets.all(0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4.0),
                                          ),
                                        ),
                                        content: FormPengantarSo(),
                                        actions: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                32.0, 8.0, 18.0, 16.0),
                                            child: Row(
                                              children: <Widget>[
                                                FlatButton(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 24.0,
                                                      vertical: 12.0),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'CLOSE',
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.0,
                                                ),
                                                RaisedButton(
                                                  color: Colors.blue,
                                                  textColor: Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 24.0,
                                                      vertical: 12.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Text("SIMPAN"),
                                                  onPressed: () {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      _formKey.currentState
                                                          .save();
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                transitionDuration: Duration(milliseconds: 300),
                                barrierLabel: '',
                                context: context,
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        (null));
                          },
                          child: Text('Create'),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
