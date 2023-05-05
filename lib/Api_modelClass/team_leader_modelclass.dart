class TeamleaderModelClass {
  List<Users>? users;

  TeamleaderModelClass({this.users});

  TeamleaderModelClass.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  String? type;
  String? teamLeaderId;
  String? username;
  String? emailVerifiedAt;
  String? image;
  String? status;
  String? addedBy;
  String? updateBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
      this.name,
      this.email,
      this.type,
      this.teamLeaderId,
      this.username,
      this.emailVerifiedAt,
      this.image,
      this.status,
      this.addedBy,
      this.updateBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    teamLeaderId = json['team_leader_id'];
    username = json['username'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    status = json['status'];
    addedBy = json['added_by'];
    updateBy = json['update_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['type'] = this.type;
    data['team_leader_id'] = this.teamLeaderId;
    data['username'] = this.username;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image'] = this.image;
    data['status'] = this.status;
    data['added_by'] = this.addedBy;
    data['update_by'] = this.updateBy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}