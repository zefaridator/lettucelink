import 'package:flutter/material.dart';
import '../../../models/models.dart';

class AddGardenWidget extends StatefulWidget {
  const AddGardenWidget({super.key});

  @override
  State<AddGardenWidget> createState() => _AddGardenWidgetState();
}

class _AddGardenWidgetState extends State<AddGardenWidget> {
  int _currentStep = 0 ;

   List<Step> _steps = [
    Step(
      title: Text("Nom du jardin"),
      content: Text("Contenu")
    ),
    Step(
      title: Text("Localisation"),
      content: Text("Contenu")
    ),
    Step(
      title: Text("Plants"),
      content: Text("Contenu")
    ),
     Step(
      title: Text("Résumé"),
      content: Text("Contenu")
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un nouveau jardin"),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step){
          setState( () {
            _currentStep=step ;
          });
        },
      steps: _steps),
    );
  }
}