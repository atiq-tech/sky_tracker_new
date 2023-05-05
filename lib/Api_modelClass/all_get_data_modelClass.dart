class AllGetDataModelClass {
  List<DataLists>? dataLists;

  AllGetDataModelClass({this.dataLists});

  AllGetDataModelClass.fromJson(Map<String, dynamic> json) {
    if (json['dataLists'] != null) {
      dataLists = <DataLists>[];
      json['dataLists'].forEach((v) {
        dataLists!.add(new DataLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataLists != null) {
      data['dataLists'] = this.dataLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataLists {
  int? id;
  String? name;
  String? mobile;
  String? newSim;
  String? appInstall;
  String? toffee;
  String? sellPackage;
  String? sellGb;
  String? rechargePackage;
  String? rechargeAmount;
  String? gift;
  String? giftName;
  String? areaId;
  String? location;
  String? program;
  String? experience;
  String? appExperience;
  String? gaming;
  String? event;
  String? service;
  String? future;
  String? image;
  String? status;
  String? ipAddress;
  String? otp;
  String? addedBy;
  String? updateBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Area? area;

  DataLists(
      {this.id,
      this.name,
      this.mobile,
      this.newSim,
      this.appInstall,
      this.toffee,
      this.sellPackage,
      this.sellGb,
      this.rechargePackage,
      this.rechargeAmount,
      this.gift,
      this.giftName,
      this.areaId,
      this.location,
      this.program,
      this.experience,
      this.appExperience,
      this.gaming,
      this.event,
      this.service,
      this.future,
      this.image,
      this.status,
      this.ipAddress,
      this.otp,
      this.addedBy,
      this.updateBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.area});

  DataLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    newSim = json['new_sim'];
    appInstall = json['app_install'];
    toffee = json['toffee'];
    sellPackage = json['sell_package'];
    sellGb = json['sell_gb'];
    rechargePackage = json['recharge_package'];
    rechargeAmount = json['recharge_amount'];
    gift = json['gift'];
    giftName = json['gift_name'];
    areaId = json['area_id'];
    location = json['location'];
    program = json['program'];
    experience = json['experience'];
    appExperience = json['app_experience'];
    gaming = json['gaming'];
    event = json['event'];
    service = json['service'];
    future = json['future'];
    image = json['image'];
    status = json['status'];
    ipAddress = json['ip_address'];
    otp = json['otp'];
    addedBy = json['added_by'];
    updateBy = json['update_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['new_sim'] = this.newSim;
    data['app_install'] = this.appInstall;
    data['toffee'] = this.toffee;
    data['sell_package'] = this.sellPackage;
    data['sell_gb'] = this.sellGb;
    data['recharge_package'] = this.rechargePackage;
    data['recharge_amount'] = this.rechargeAmount;
    data['gift'] = this.gift;
    data['gift_name'] = this.giftName;
    data['area_id'] = this.areaId;
    data['location'] = this.location;
    data['program'] = this.program;
    data['experience'] = this.experience;
    data['app_experience'] = this.appExperience;
    data['gaming'] = this.gaming;
    data['event'] = this.event;
    data['service'] = this.service;
    data['future'] = this.future;
    data['image'] = this.image;
    data['status'] = this.status;
    data['ip_address'] = this.ipAddress;
    data['otp'] = this.otp;
    data['added_by'] = this.addedBy;
    data['update_by'] = this.updateBy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
