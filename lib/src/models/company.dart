class Company{
  final String name;

  Company({this.name});

  Company.fromJson(Map<dynamic,dynamic> parsedJson)
    : name = parsedJson['name'];
}