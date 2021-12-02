// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:demo/share_password.dart';
import 'package:flutter/material.dart';

class SingleListItem extends StatefulWidget {
  var passwordItem;

  SingleListItem({
    Key? key,
    required this.passwordItem,
  }) : super(key: key);

  @override
  State<SingleListItem> createState() => _SingleListItemState();
}

class _SingleListItemState extends State<SingleListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 6),
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: statusColorBox(widget.passwordItem.status),
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.passwordItem.websiteName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.passwordItem.userName,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SharePassword(),
                    ),
                  ),
              icon: const Icon(Icons.open_in_new))
        ],
      ),
    );
  }

  Color statusColorBox(status) {
    if (status == "healthy")
      return Colors.deepPurple.shade300;
    else if (status == "reused")
      return Colors.red.shade300;
    else
      return Colors.pink.shade300;
  }
}
