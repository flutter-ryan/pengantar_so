import 'package:flutter/material.dart';

class ShowLoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        child: Container(
          height: 200.0,
          width: 200.0,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: 80.0,
                    width: 80.0,
                    child: CircularProgressIndicator()),
                SizedBox(height: 24.0),
                Text(
                  'Please wait!',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
