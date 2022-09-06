import 'dart:io';

import 'package:flutter/material.dart';
import 'package:coffe_app/models/util.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Color(0x10808080)),
          ],
          gradient: postGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://static.toiimg.com/photo/92751252.cms'))),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  '5 Coffe Beans You Must Try!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ));
  }
}
