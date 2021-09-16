import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  final String image;

  const ImageItemWidget(
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}
