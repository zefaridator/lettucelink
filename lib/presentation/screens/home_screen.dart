import 'package:flutter/material.dart';
import '../widgets/GardenTile/GardenTile.dart';
import '../../models/models.dart';
import '../widgets/Dialogs/addgardenwizard_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage('https://i.pravatar.cc/402'),
              ),
              SizedBox(width: 8.0),
              Text('Let\'s rock !'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Show the AddGardenWidget
                showDialog(
                  context: context,
                  builder: (_) => const AddGardenWidget(),
                );
                print('Ajouter un nouveau jardin');
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
            ),
            child: ListView.builder(
              itemCount: 5, // Ajustez itemCount
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      // Éditer les propriétés du jardin ici
                      print('Éditer le jardin');
                      return false; // Ne pas supprimer lors de l'édition
                    } else {
                      bool confirm = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmation"),
                            content: const Text(
                                "Voulez-vous vraiment supprimer ce jardin ?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("Annuler"),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Supprimer"),
                              ),
                            ],
                          );
                        },
                      );
                      return confirm ?? false;
                    }
                  },
                  onDismissed: (direction) {
                    // Supprimer le jardin ici
                    print('Supprimer le jardin');
                  },
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.blue, // Couleur pour l'édition
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.edit, color: Colors.white, size: 36.0),
                    ),
                  ),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red, // Couleur pour la suppression
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          Icon(Icons.delete, color: Colors.white, size: 36.0),
                    ),
                  ),
                  child: GestureDetector(
                    onLongPress: () {
                      // Ajouter la logique pour modifier le jardin ici
                      print('Modifier le jardin');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GardenTile(
                          garden:
                              index.isEven ? mockGardenHome2 : mockGardenHome),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
