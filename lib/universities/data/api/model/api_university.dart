class ApiUniversity {
  const ApiUniversity({
    required this.name,
    required this.country,
  });

  final String country;
  final String name;

  factory ApiUniversity.fromJson(Map<String, dynamic> json) => ApiUniversity(
        name: json['name'],
        country: json['country'],
      );
}
