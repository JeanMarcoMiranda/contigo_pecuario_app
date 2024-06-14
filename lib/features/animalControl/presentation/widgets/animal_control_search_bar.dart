import 'package:flutter/material.dart';

class AnimalControlSearchBar extends StatelessWidget {
  AnimalControlSearchBar ({super.key});
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
              border: OutlineInputBorder()
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {
              //TODO
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Filtros'),
                Image.asset(
                  'assets/icons/filter.png',
                  width: 18,
                  height: 18,
                  fit: BoxFit.fill,
                  color: Color(0xFF153750),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
