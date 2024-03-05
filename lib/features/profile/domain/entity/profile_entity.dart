class ProfileEntity {
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAdmin;
  String? image;

  ProfileEntity({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAdmin,
    this.image,
  });

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        email,
        isAdmin,
        image,
      ];
}
