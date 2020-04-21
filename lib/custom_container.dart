import 'package:flutter/material.dart';
import 'package:password_generator/constant.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final Widget child;

  CustomContainer({
    @required this.title,
    @required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: Constant.MAX_WIDTH,
        minWidth: Constant.MIN_WIDTH,
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(8, 8)
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text(title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),

            Divider(),

            child
          ],
        ),
      ),
    );
  }
}