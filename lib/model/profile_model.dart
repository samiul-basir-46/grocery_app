class ProfileModel {
  final String email;
  final String displayName;

  ProfileModel({required this.email, required this.displayName});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      email: json['email'],
      displayName: json['display_name'],
    );
  }
}
