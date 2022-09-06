import 'package:flutter/material.dart';
import 'package:coffe_app/models/util.dart';
import 'package:coffe_app/models/product_size.dart';

class SizeSelectorBox extends StatefulWidget {
  final Function(String) callback;
  const SizeSelectorBox(this.callback);

  @override
  State<SizeSelectorBox> createState() => _SizeSelectorBoxState();
}

class _SizeSelectorBoxState extends State<SizeSelectorBox> {
  final List<ProductSize> sizes = [
    ProductSize('S'),
    ProductSize('M'),
    ProductSize('L'),
  ];
  String callback() {
    String item = '';
    sizes.forEach((element) {
      if (element.isSelected) {
        item = element.name;
      }
      ;
    });
    return item;
  }

  List<Widget> sizeBuilder({required List<ProductSize> sizes}) {
    List<Widget> widgets = [];
    sizes.forEach((element) {
      widgets.add(
        TextButton(
          onPressed: () {
            setState(() {
              element.toggleSelected();
              sizes.forEach((item) {
                if (item != element && item.isSelected == true) {
                  item.toggleSelected();
                }
                ;
              });
            });
            widget.callback(callback());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              element.name,
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    side: element.isSelected
                        ? BorderSide(width: 1, color: accentColor)
                        : BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                element.isSelected ? Colors.transparent : Color(0xff202533)),
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => element.isSelected ? accentColor : textAccentColor),
          ),
        ),
      );
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: sizeBuilder(sizes: sizes),
      ),
    );
  }
}
