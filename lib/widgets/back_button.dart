
import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 8, left: 8),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 14, 13, 13),
          borderRadius: BorderRadius.circular(8)),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          )),
    );
  }
}
