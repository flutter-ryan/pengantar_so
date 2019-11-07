import 'package:flutter/material.dart';

class FormPengantarSo extends StatefulWidget {
  @override
  _FormPengantarSoState createState() => _FormPengantarSoState();
}

class _FormPengantarSoState extends State<FormPengantarSo> {
  final _formKey = GlobalKey<FormState>();

  bool radVal = false;
  bool labVal = false;
  bool preAnasVal = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(28.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                builTextFormField('Nomor Registrasi', 1),
                builTextFormField('Diagnosa', null),
                buildCheckBox(),
                buildRadioBHP(),
                buildRadioScale(),
                builTextFormField('Treatment Plan', null),
                builTextFormField('More Explanation', null),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget builTextFormField(String label, int line) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: TextFormField(
        maxLines: line,
        validator: (value) {
          if (value.isEmpty) {
            return 'Input required';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          labelText: label,
        ),
      ),
    );
  }

  Widget buildRadioBHP() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'BHP/AMHP',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 0,
              ),
              Text('Lengkap'),
              SizedBox(
                width: 18.0,
              ),
              Radio(
                value: 0,
              ),
              Text('Tidak lengkap'),
              SizedBox(
                width: 18.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('View BHP/AMHP'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildRadioScale() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Priority',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 0,
              ),
              Text('Urgent'),
              SizedBox(
                width: 18.0,
              ),
              Radio(
                value: 0,
              ),
              Text('Less Urgent'),
              SizedBox(
                width: 18.0,
              ),
              Radio(
                value: 0,
              ),
              Text('Non Urgent'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCheckBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Pre-operatif',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: radVal,
              onChanged: (bool value) {
                setState(() {
                  radVal = value;
                });
              },
            ),
            Text('Radiologi'),
            SizedBox(
              width: 18.0,
            ),
            Checkbox(
              value: labVal,
              onChanged: (bool value) {
                setState(() {
                  labVal = value;
                });
              },
            ),
            Text('Laboratorium'),
            SizedBox(
              width: 22.0,
            ),
            Checkbox(
              value: preAnasVal,
              onChanged: (bool value) {
                setState(() {
                  preAnasVal = value;
                });
              },
            ),
            Text('Perianestesi'),
            SizedBox(
              width: 22.0,
            ),
          ],
        )
      ],
    );
  }
}
