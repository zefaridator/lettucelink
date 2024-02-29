import 'package:flutter/material.dart';
import '../../../models/models.dart';

class GardenWidget extends StatelessWidget {
  final Garden garden;

  const GardenWidget({Key? key, required this.garden}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(garden.name),
      subtitle: Text(' ${garden.description} '),
      onTap: () {
        // Action when garden is tapped => update it
      },
    );
  }
}
