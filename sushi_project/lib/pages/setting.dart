import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Expanded(
          // Add an Expanded widget here
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView(
              children: [
                const Text('Options',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'News & goddies from SOAR',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                const Text(
                  'Join our Newsletter',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Help',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.only(left: 0)),
                  ),
                  child: const Text(
                    'Contact Support',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.only(left: 0)),
                  ),
                  child: const Text(
                    'Legal & Licenses',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
