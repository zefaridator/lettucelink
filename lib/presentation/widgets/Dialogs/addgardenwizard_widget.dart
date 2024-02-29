import 'package:flutter/material.dart';
import '../../../models/models.dart';

class AddGardenWidget extends StatefulWidget {
  const AddGardenWidget({Key? key}) : super(key: key);

  @override
  State<AddGardenWidget> createState() => _AddGardenWidgetState();
}

class _AddGardenWidgetState extends State<AddGardenWidget> {
  int _currentStep = 0;
  final TextEditingController _gardenNameController = TextEditingController();
  final TextEditingController _cpController = TextEditingController();
  String _gardenName = "";

  late List<Step> _steps;

  @override
  void initState() {
    super.initState();
    _steps = [
      Step(
        title: Text("Nom du jardin"),
        content: TextField(
          controller: _gardenNameController,
          decoration: const InputDecoration(labelText: 'Nom du jardin'),
          onChanged: null,
        ),
      ),
      Step(
        title: Text("code postal"),
        content: TextField(
           controller: _cpController,
          decoration: const InputDecoration(labelText: 'Code postal'),
          onChanged: null,
        ),
      ),
      Step(
        title: Text("Planches"),
        content: Text("Contenu"),
      ),
      Step(
        title: Text("Résumé"),
        content: Text("Contenu"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un nouveau jardin"),
      ),
      body: Stepper(
        controlsBuilder: (ctx, details) {
          return Container();
        },
        currentStep: _currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        steps: _steps,
      ),
    );
  }
}
