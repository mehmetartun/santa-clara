class AuthUser {
  String? displayName;
  String? email;
  String? imageUrl;
  String? uid;
  bool? emailVerified;

  AuthUser({
    this.displayName,
    this.email,
    this.imageUrl,
    this.uid,
    this.emailVerified,
  });

  bool get isNull {
    if (uid == null) {
      return true;
    }
    return false;
  }
}
