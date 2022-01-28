import './gift.dart';
import './occasion.dart';

class Person {
  String name;
  DateTime? birthday;
  // key is occasion name.
  var giftMap = <String, List<Gift>>{};

  Person({required this.name, this.birthday});

  //TODO: Need this?
  Person copy() => Person(name: name, birthday: birthday);

  void addGift({required Occasion occasion, required Gift gift}) {
    var giftList = giftMap[occasion.name];
    giftList ??= giftMap[occasion.name] = <Gift>[];
    giftList.add(gift);
  }

  void deleteGift({required Occasion occasion, required Gift gift}) {
    var giftList = giftMap[occasion.name];
    if (giftList != null) giftList.remove(gift);
  }

  @override
  String toString() {
    return '$name $birthday';
  }
}