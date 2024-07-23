import 'package:flutter/material.dart';

class AnimalControlSearchBar extends StatelessWidget {
  AnimalControlSearchBar({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Identificador',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 2,
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 120), // Ajusta el valor según sea necesario
            child: ElevatedButton(
              onPressed: () {
                // TODO
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Filtros', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 4),
                  Image.asset(
                    'assets/icons/filter.png',
                    width: 14,
                    height: 14,
                    fit: BoxFit.fill,
                    color: Color(0xFF153750),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
