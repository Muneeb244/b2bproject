import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final Function() fn;
  final String title;
  const BasicButton({
    Key? key,
    required this.title,
    required this.fn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 40, top: 20),
      child: GestureDetector(
        onTap: fn,
        child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
