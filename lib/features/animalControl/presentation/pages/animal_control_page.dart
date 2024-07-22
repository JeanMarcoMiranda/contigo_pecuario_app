import 'package:contigo_pecuario/features/animalControl/data/models/animal_control_entity_model.dart';
import 'package:contigo_pecuario/features/animalControl/data/models/dead_animal_control_entity_model.dart';
import 'package:contigo_pecuario/features/animalControl/presentation/widgets/animal_control_item_card.dart';
import 'package:contigo_pecuario/features/animalControl/presentation/widgets/animal_control_tabbar.dart';
import 'package:contigo_pecuario/features/animalControl/presentation/widgets/animal_control_appbar.dart';
import 'package:contigo_pecuario/features/animalControl/presentation/widgets/animal_control_search_bar.dart';
import 'package:contigo_pecuario/features/animalControl/presentation/widgets/milk_drop_icon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AnimalControlPage extends StatefulWidget {
  const AnimalControlPage({super.key});

  @override
  State<AnimalControlPage> createState() => _AnimalControlPageState();
}

class _AnimalControlPageState extends State<AnimalControlPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<List<AnimalControlEntityModel>> getAnimalControl() async {
    final response = await Dio().post(
        'https://api.contigopecuario.com/api/animal/ListByAgribusiness',
        data: {"agribusinessId": "665f708679462e00083edcde"});

    return (response.data[0] as List)
        .map((item) => AnimalControlEntityModel.fromJson(item))
        .toList();
  }

  Future<List<DeadAnimalControlEntityModel>> getDeadAnimalControl() async {
    final response = await Dio().post(
        'https://api.contigopecuario.com/api/animal/ListDeadsByAgribusiness',
        data: {"agribusinessId": "665f708679462e00083edcde"});

    return (response.data[0] as List)
        .map((item) => DeadAnimalControlEntityModel.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AnimalControlAppbar(),
      body: Column(
        children: [
          AnimalControlTabBar(tabController: _tabController),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      AnimalControlSearchBar(),
                      Expanded(
                          child: FutureBuilder<List<AnimalControlEntityModel>>(
                        future: getAnimalControl(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator()));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentData = snapshot.data![index];

                                return AnimalControlItemCard(
                                  id: currentData.id,
                                  name: currentData.name,
                                );
                              },
                            );
                          }
                        },
                      ))
                    ],
                  ),
                  Column(
                    children: [
                      AnimalControlSearchBar(),
                      Expanded(
                          child:
                              FutureBuilder<List<DeadAnimalControlEntityModel>>(
                        future: getDeadAnimalControl(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator()),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentData = snapshot.data![index];

                                return AnimalControlItemCard(
                                  id: currentData.id,
                                  name: currentData.name,
                                );
                              },
                            );
                          }
                        },
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0.0,
        backgroundColor: Color(0xFF0a2a41),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? MilkDropIcon(
                      icon: Image.asset(
                        'assets/icons/home.png',
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      color: Color(0xFF0ba293))
                  : Image.asset('assets/icons/home.png', height: 20, width: 20),
              label: 'Inicio'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? MilkDropIcon(
                      icon: Image.asset(
                        'assets/icons/calendar.png',
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      color: Color(0xFF0ba293))
                  : Image.asset('assets/icons/calendar.png',
                      height: 20, width: 20),
              label: 'Calendario'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const MilkDropIcon(
                      icon: Icon(Icons.search, color: Colors.white),
                      color: Color(0xFF0ba293))
                  : const Icon(Icons.search, color: Colors.blueGrey),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? MilkDropIcon(
                      icon: Image.asset(
                        'assets/icons/bell.png',
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      color: Color(0xFF0ba293))
                  : Image.asset('assets/icons/bell.png', height: 20, width: 20),
              label: 'Notificaciones'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? const MilkDropIcon(
                      icon: Icon(Icons.book, color: Colors.white),
                      color: Color(0xFF0ba293))
                  : const Icon(Icons.book, color: Colors.blueGrey),
              label: 'Agenda'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
