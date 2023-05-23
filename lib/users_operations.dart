class User {
  String email;
  User(this.email);
}

class AdminUser extends User with mailServer {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin mailServer on User {
  String getMailSystem() {
    return email.split('@')[1];
  }
}

class UserManager<T extends User> {
  List<T> users = [];
  void addUser(user) {
    users.add(user);
  }

  void deleteUser(user) {
    users.remove(user);
  }

  List<String> usersMailList() {
    return users
        .map((e) => e is AdminUser ? e.getMailSystem() : e.email)
        .toList();
  }
}
