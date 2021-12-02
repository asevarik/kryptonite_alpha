import 'package:flutter/material.dart';

class HeaderBarSettingsIcon extends StatelessWidget {
  const HeaderBarSettingsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        // ignoconst re: prefer_const_constructors
        child: const Icon(
          Icons.settings,
          size: 26.0,
        ),
      ),
    );
  }
}
