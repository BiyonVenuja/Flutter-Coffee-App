import 'package:flutter/material.dart';
import 'package:coffe_app/models/util.dart';

class DescriptionBox extends StatefulWidget {
  final String descritionText;
  DescriptionBox({required this.descritionText});
  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  bool read = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Description',
          style: TextStyle(
              color: textAccentColor,
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            Text(
              widget.descritionText,
              softWrap: true,
              maxLines: read ? null : 2,
              overflow: TextOverflow.fade,
              style: TextStyle(height: 1.5, fontSize: 16),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    read = !read;
                  });
                },
                child: Text(
                  read ? 'Read Less' : 'Read More',
                  style: TextStyle(color: accentColor),
                ))
          ],
        ),
      ],
    );
  }
}
