import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalControlAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AnimalControlAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF153750),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: Color(0xFF0ba293),
        onPressed: () {
          //TODO
        },
      ),
      title: const Center(
          child: Text(
        'Control Animal',
        style: TextStyle(color: Color(0xFF0ba293)),
      )),
      actions: [
        IconButton(
          onPressed: () {
            //TODO
          },
          icon: const Icon(Icons.more_vert),
          color: Color(0xFF0ba293),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
