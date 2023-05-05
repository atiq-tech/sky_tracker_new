class AllGetAreaModelClass {
  List<Areas>? areas;
  AllGetAreaModelClass({this.areas});

  AllGetAreaModelClass.fromJson(Map<String, dynamic> json) {
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  int? id;
  String? name;
  String? latitude;
  String? longitude;
  String? zipCode;
  String? status;
  String? ipAddress;
  String? addedBy;
  String? updateBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Areas(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.zipCode,
      this.status,
      this.ipAddress,
      this.addedBy,
      this.updateBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    zipCode = json['zip_code'];
    status = json['status'];
    ipAddress = json['ip_address'];
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
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['zip_code'] = this.zipCode;
    data['status'] = this.status;
    data['ip_address'] = this.ipAddress;
    data['added_by'] = this.addedBy;
    data['update_by'] = this.updateBy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
