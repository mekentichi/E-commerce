class UsersViewModel {
  String? usersId;
  String? usersUsername;
  String? usersEmail;
  String? usersPhone;
  String? usersVerifycode;
  String? usersApprove;
  String? usersCreate;
  String? usersPassword;
  String? usersEtats;

  UsersViewModel(
      {this.usersId,
      this.usersUsername,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifycode,
      this.usersApprove,
      this.usersCreate,
      this.usersPassword,
      this.usersEtats});

  UsersViewModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersUsername = json['users_username'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
    usersEtats = json['users_etats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_username'] = this.usersUsername;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['users_password'] = this.usersPassword;
    data['users_etats'] = this.usersEtats;
    return data;
  }
}