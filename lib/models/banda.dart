class Bands {
  // Propiedades
  String? id;
  String name;
  String votes;

  Bands({
    this.id,
    required this.name,
    required this.votes,
  });

  // cremos un contructor co nnombre de tipo
//  factory,
// factory devuelde una nueva intanci de la clase
  // recive un bojeto de tipo map
  factory Bands.fromMap(Map<String, dynamic> obj) =>
      Bands(id: obj['id'], name: obj['name'], votes: obj['votes']);
}
