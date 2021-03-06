import './named.dart';

class Occasion extends Named {
  DateTime? date;
  int id;

  Occasion({
    required String name,
    this.id = 0,
    this.date,
  }) : super(name: name);

  Occasion get clone => Occasion(id: id, name: name, date: date);

  Map<String, dynamic> toMap() {
    return {
      'date': date?.millisecondsSinceEpoch,
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Occasion: $id $name $date';
  }
}
