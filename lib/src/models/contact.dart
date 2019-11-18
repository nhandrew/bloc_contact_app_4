class Contact {
  final int id;
  final String name;
  final String username;
  final String email;

  Contact({this.id,this.name,this.username,this.email});

  Contact.fromJson(Map<String,dynamic> parsedJson)
    : id = parsedJson['id'],
     name = parsedJson['name'],
     username = parsedJson['username'],
     email = parsedJson['email'];
}