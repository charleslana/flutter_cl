class Detail {
  String? id;
  String name;
  String email;
  String? avatar;

  Detail({
    this.id,
    required this.name,
    required this.email,
    this.avatar,
  });
}
