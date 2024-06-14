
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalControlTabBar extends StatelessWidget {
  final TabController tabController;

  const AnimalControlTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0a2a41),
      child: TabBar(
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 16.5),
        unselectedLabelColor: Colors.blueGrey,
        controller: tabController,
        tabs: const <Widget>[
          Tab(text: 'ACTIVOS'),
          Tab(text: 'INACTIVOS/MUERTOS',)
        ],
      ),
    );
  }
}