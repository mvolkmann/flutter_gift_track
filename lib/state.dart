import 'package:flutter/material.dart';

import './models/gift.dart';
import './models/occasion.dart';
import './models/person.dart';

class AppState extends ChangeNotifier {
  final _occasions = <Occasion>[];
  final _people = <Person>[];

  List<Occasion> get occasions => _occasions;

  List<Person> get people => _people;

  void addGift({
    required Person person,
    required Occasion occasion,
    required Gift gift,
  }) {
    person.addGift(occasion: occasion, gift: gift);
    notifyListeners();
  }

  void addOccasion(Occasion o) {
    _occasions.add(o);
    notifyListeners();
  }

  void addPerson(Person p) {
    _people.add(p);
    notifyListeners();
  }

  void deleteGift({
    required Person person,
    required Occasion occasion,
    required Gift gift,
  }) {
    person.deleteGift(occasion: occasion, gift: gift);
    notifyListeners();
  }

  void deleteOccasion(Occasion o) {
    _occasions.remove(o);
    notifyListeners();
  }

  void deletePerson(Person p) {
    _people.remove(p);
    notifyListeners();
  }
}