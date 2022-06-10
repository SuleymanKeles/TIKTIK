class User {
  final String userID;
  final String mailAddress;
  final String password;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String photo;
  final String address;
  final String biography;

  const User(
      {required this.userID,
      required this.mailAddress,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.biography,
      required this.photo,
      required this.address});
}
