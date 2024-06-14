import 'package:flutter/material.dart';

class AnimalControlItemCard extends StatelessWidget {
  final String id;
  final String name;

  const AnimalControlItemCard(
      {super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/cow-default.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const Icon(Icons.star_border_outlined)
          ],
        ),
        title: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Column(
                  children: [const Text("Identificador"), Text(id)],
                ))),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [const Text("Nombre"), Text(name)],
                ),
              ),
            )
          ],
        ),
        children: const [Text("Buenas")],
      ),
    );
  }
}
