class UserModel {
  String? id;
  String? nickname;
  String? openid;
  String? province;
  String? gender;
  String? city;
  String? country;
  String? avatarurl;
  String? unionid;
  String? createdAt;
  String? phone;
  String? sId;
  String? inviteUnionid;
  String? weweId;
  String? position;
  String? deptname;
  String? channelId;
  String? isDeleted;
  String? password;
  String? score;
  String? loginToken;
  String? code;
  String? realname;
  String? cId;
  String? uid;
  String? lastLogin;
  String? deal;

  UserModel(
      {this.id,
      this.nickname,
      this.openid,
      this.province,
      this.gender,
      this.city,
      this.country,
      this.avatarurl,
      this.unionid,
      this.createdAt,
      this.phone,
      this.sId,
      this.inviteUnionid,
      this.weweId,
      this.position,
      this.deptname,
      this.channelId,
      this.isDeleted,
      this.password,
      this.score,
      this.loginToken,
      this.code,
      this.realname,
      this.cId,
      this.uid,
      this.lastLogin,
      this.deal});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    openid = json['openid'];
    province = json['province'];
    gender = json['gender'];
    city = json['city'];
    country = json['country'];
    avatarurl = json['avatarurl'];
    unionid = json['unionid'];
    createdAt = json['created_at'];
    phone = json['phone'];
    sId = json['s_id'];
    inviteUnionid = json['invite_unionid'];
    weweId = json['wewe_id'];
    position = json['position'];
    deptname = json['deptname'];
    channelId = json['channel_id'];
    isDeleted = json['is_deleted'];
    password = json['password'];
    score = json['score'];
    loginToken = json['login_token'];
    code = json['code'];
    realname = json['realname'];
    cId = json['c_id'];
    uid = json['uid'];
    lastLogin = json['last_login'];
    deal = json['deal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['openid'] = this.openid;
    data['province'] = this.province;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['country'] = this.country;
    data['avatarurl'] = this.avatarurl;
    data['unionid'] = this.unionid;
    data['created_at'] = this.createdAt;
    data['phone'] = this.phone;
    data['s_id'] = this.sId;
    data['invite_unionid'] = this.inviteUnionid;
    data['wewe_id'] = this.weweId;
    data['position'] = this.position;
    data['deptname'] = this.deptname;
    data['channel_id'] = this.channelId;
    data['is_deleted'] = this.isDeleted;
    data['password'] = this.password;
    data['score'] = this.score;
    data['login_token'] = this.loginToken;
    data['code'] = this.code;
    data['realname'] = this.realname;
    data['c_id'] = this.cId;
    data['uid'] = this.uid;
    data['last_login'] = this.lastLogin;
    data['deal'] = this.deal;
    return data;
  }
}
