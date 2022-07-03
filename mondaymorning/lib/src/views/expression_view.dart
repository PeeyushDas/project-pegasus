import 'package:flutter/material.dart';

/// Expression View widget of the app.
class ExpressionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.network(
              'https://mir-s3-cdn-cf.behance.net/project_modules/disp/fbc00f81999693.5d10c08723f94.gif',
              fit: BoxFit.cover,
            ),
            Text(
              'Coming Soon..',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
