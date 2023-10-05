class Category {
  // final String id;
  final String video;
  final String name;
  final String type;

  Category({
    // required this.id,
    required this.video,
    required this.name,
    required this.type,
  });

  factory Category.fromJSON(Map<String, dynamic> json) => Category(
        // id: json['id'] as String,
        name: json['name'] as String,
        video: json['video'] as String,
        type: json['type'] as String,
      );

  Map<String, String> toMap() {
    return {
      // 'id': id,
      'video': video,
      'name': name,
      'type': type,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }

  where(Function(dynamic item) param0) {}
}
