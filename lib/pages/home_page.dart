import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:material_search/material_search.dart';
import 'package:pengantar_so/pages/input_page.dart';
import 'package:pengantar_so/services/pasien_service.dart';

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
          child: Container(
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
          ),
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
    );
  }
}
