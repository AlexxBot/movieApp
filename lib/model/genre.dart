class Genre{
  final String id;
  final String name;

  Genre(
     this.id, this.name
  );

  Genre.fromJson(Map<String,dynamic> json): id = json["id"], name = json["name"];
}