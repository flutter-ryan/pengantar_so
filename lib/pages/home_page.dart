import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:material_search/material_search.dart';
import 'package:pengantar_so/pages/input_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _names = ['500030', '500031', '500032', '500034'];
  String _name = 'No one';

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Cari Nomor RM',
              results: _names
                  .map(
                    (String v) => new MaterialSearchResult<String>(
                      icon: Icons.open_in_new,
                      value: v,
                      text: v,
                    ),
                  )
                  .toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim().contains(
                      new RegExp(
                        criteria.toLowerCase().trim(),
                      ),
                    );
              },
              onSelect: (dynamic value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => InputPage(),
                ),
              ),
              onSubmit: (String value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => InputPage(),
                ),
              ),
            ),
          );
        });
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: false,
        title: Text('Dashboard'),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18.0, right: 18.0),
        child: FloatingActionButton(
          elevation: 8.0,
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF89C2CB),
                    Color(0xFFB2A67E),
                  ],
                ),
              ),
              child: Image.asset(
                'images/ic_search_white.png',
                scale: 1.3,
              )),
          tooltip: 'Searching',
          onPressed: () {
            _showMaterialSearch(context);
          },
        ),
      ),
    );
  }
}
