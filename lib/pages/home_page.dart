import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pengantar_so/pages/input_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: _buildSearchAppbar(context),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xFF89C2CB),
            Color(0xFFB2A67E),
          ],
        ),
        actions: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 50.0,
                child: Icon(Icons.more_vert),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 4.0,
              child: Container(
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildSearchAppbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 0.0, color: Colors.white),
          ),
          hintText: 'Cari nomor RM',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        onSubmitted: (value) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => InputPage(norm: value),
          ));
        },
      ),
    );
  }
}
