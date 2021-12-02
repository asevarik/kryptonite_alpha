import 'dart:developer';

import 'package:flutter/material.dart';

class ManageSync extends StatefulWidget {
  const ManageSync({Key? key}) : super(key: key);

  @override
  State<ManageSync> createState() => _ManageSyncState();
}

class _ManageSyncState extends State<ManageSync> {
  @override
  Widget build(BuildContext context) {
    bool? _checked = true;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(
                        0x112400FF,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Manage Sync",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Cloud backup allows you to store your passwords online in an encrypted space such that it becomes available on your other devices.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                CheckboxListTile(
                  value: _checked,
                  title: const Text("Enable Cloud Data Sync"),
                  onChanged: (bool? value) {
                    setState(
                      () {
                        _checked = value;
                      },
                    );
                  },
                  activeColor: Colors.deepPurple.shade300,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  child: const Text("Delete Data on the Cloud"),
                  onPressed: () => log("Delete Data Pressed"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pink.shade300),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(15),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("Sync Now"),
                  onPressed: () => log("Sync Now Pressed"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(15),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
