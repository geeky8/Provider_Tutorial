class UserModel {
  UserModel({
    required this.name,
    required this.phoneNo,
    required this.board,
    required this.city,
    required this.country,
    required this.email,
    required this.gender,
    required this.grade,
    required this.parentEmail,
    required this.whatAmIDoing,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNo,
    String? country,
    String? city,
    String? gender,
    String? whatAmIDoing,
    String? parentEmail,
    String? grade,
    String? board,
  }) {
    return UserModel(
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      board: board ?? this.board,
      city: city ?? this.city,
      country: country ?? this.country,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      grade: grade ?? this.grade,
      parentEmail: parentEmail ?? this.parentEmail,
      whatAmIDoing: whatAmIDoing ?? this.whatAmIDoing,
    );
  }

  final String name;
  final String email;
  final String phoneNo;
  final String country;
  final String city;
  final String gender;
  final String whatAmIDoing;
  final String parentEmail;
  final String grade;
  final String board;
}
