import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/property/1.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.flag),
                  label: const Text('India')),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.home_work_rounded),
                  label: const Text('Mall'))
            ],
          ),
          const Text(
            'Token S1',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
