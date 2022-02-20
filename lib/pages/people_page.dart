import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './my_page.dart';
import './person_page.dart';
import '../app_state.dart';
import '../extensions/widget_extensions.dart';
import '../models/person.dart';
import '../util.dart' show formatDate;
import '../widgets/my_fab.dart';
import '../widgets/my_list_tile.dart';

class PeoplePage extends StatelessWidget {
  static const route = '/people';

  const PeoplePage({Key? key}) : super(key: key);

  void _add(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PersonPage(person: Person(name: '')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: 'People',
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final people = appState.sortedPeople;

    final body = appState.isLoaded
        ? ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return MyListTile(
                onTap: () => _edit(context, person),
                title: person.name,
                subtitle: formatDate(person.birthday),
              );
            },
          )
        : CircularProgressIndicator();

    return Scaffold(
      floatingActionButton: MyFab(icon: CupertinoIcons.add, onPressed: _add),
      body: body.center.padding(20),
    );
  }

  void _edit(BuildContext context, Person person) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PersonPage(person: person),
      ),
    );
  }
}
