import 'package:equatable/equatable.dart';

import 'cloud_messaging.dart';
import 'palette.dart';
import 'role.dart';

// ignore: must_be_immutable
class Profile extends Equatable {
  String? id;
  String? tenantUuid;
  String? customerUuid;
  String? mobile;
  String? email;
  String? username;
  String? name;
  String? surname;
  String? tel;
  int? gender;
  String? language;
  String? birthday;
  String? description;
  String? avatar;
  int? lastLoginAt;
  String? lastLoginAttempt;
  String? lastLoginIp;
  DateTime? firstLoginAt;
  String? firstLoginIp;
  DateTime? emailVerified;
  String? mobileVerified;
  double? latitude;
  double? longitude;
  Role? role;
  String? type;
  String? city;
  String? cityId;
  String? province;
  String? provinceId;
  String? country;
  String? countryId;
  String? timezone;
  String? balance;
  int? balanceUpdate;
  bool? isSignup;
  bool? isActive;
  bool? outOfCharge;
  String? deactivationReason;
  int? state;
  List<CloudMessaging>? cloudMessaging;
  Palette? palette;

  Profile({
    this.id,
    this.tenantUuid,
    this.customerUuid,
    this.mobile,
    this.email,
    this.username,
    this.name,
    this.surname,
    this.tel,
    this.gender,
    this.language,
    this.birthday,
    this.description,
    this.avatar,
    this.lastLoginAt,
    this.lastLoginAttempt,
    this.lastLoginIp,
    this.firstLoginAt,
    this.firstLoginIp,
    this.emailVerified,
    this.mobileVerified,
    this.latitude,
    this.longitude,
    this.role,
    this.type,
    this.city,
    this.cityId,
    this.province,
    this.provinceId,
    this.country,
    this.countryId,
    this.timezone,
    this.balance,
    this.balanceUpdate,
    this.isSignup,
    this.isActive,
    this.outOfCharge,
    this.deactivationReason,
    this.state,
    this.cloudMessaging,
    this.palette,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as String?,
        tenantUuid: json['tenant_uuid'] as String?,
        customerUuid: json['customer_uuid'] as String?,
        mobile: json['mobile'] as String?,
        email: json['email'] as String?,
        username: json['username'] as String?,
        name: json['name'] as String?,
        surname: json['surname'] as String?,
        tel: json['tel'] as dynamic,
        gender: json['gender'] as int?,
        language: json['language'] as String?,
        birthday: json['birthday'] as String?,
        description: json['description'] as dynamic,
        avatar: json['avatar'] as String?,
        lastLoginAt: json['last_login_at'] as int?,
        lastLoginAttempt: json['last_login_attempt'] as String?,
        lastLoginIp: json['last_login_ip'] as String?,
        firstLoginAt: json['first_login_at'] == null
            ? null
            : DateTime.parse(json['first_login_at'] as String),
        firstLoginIp: json['first_login_ip'] as String?,
        emailVerified: json['email_verified'] == null
            ? null
            : DateTime.parse(json['email_verified'] as String),
        mobileVerified: json['mobile_verified'] as String?,
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
        role: json['role'] == null
            ? null
            : Role.fromJson(json['role'] as Map<String, dynamic>),
        type: json['type'] as String?,
        city: json['city'] as String?,
        cityId: json['city_id'] as String?,
        province: json['province'] as String?,
        provinceId: json['province_id'] as String?,
        country: json['country'] as String?,
        countryId: json['country_id'] as String?,
        timezone: json['timezone'] as String?,
        balance: json['balance'] as String?,
        balanceUpdate: json['balance_update'] as int?,
        isSignup: json['is_signup'] as bool?,
        isActive: json['is_active'] as bool?,
        outOfCharge: json['out_of_charge'] as bool?,
        deactivationReason: json['deactivation_reason'] as String?,
        state: json['state'] as int?,
        cloudMessaging: (json['cloud_messaging'] as List<dynamic>?)
            ?.map((e) => CloudMessaging.fromJson(e as Map<String, dynamic>))
            .toList(),
        palette: json['palette'] == null
            ? null
            : Palette.fromJson(json['palette'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tenant_uuid': tenantUuid,
        'customer_uuid': customerUuid,
        'mobile': mobile,
        'email': email,
        'username': username,
        'name': name,
        'surname': surname,
        'tel': tel,
        'gender': gender,
        'language': language,
        'birthday': birthday,
        'description': description,
        'avatar': avatar,
        'last_login_at': lastLoginAt,
        'last_login_attempt': lastLoginAttempt,
        'last_login_ip': lastLoginIp,
        'first_login_at': firstLoginAt?.toIso8601String(),
        'first_login_ip': firstLoginIp,
        'email_verified': emailVerified?.toIso8601String(),
        'mobile_verified': mobileVerified,
        'latitude': latitude,
        'longitude': longitude,
        'role': role?.toJson(),
        'type': type,
        'city': city,
        'city_id': cityId,
        'province': province,
        'province_id': provinceId,
        'country': country,
        'country_id': countryId,
        'timezone': timezone,
        'balance': balance,
        'balance_update': balanceUpdate,
        'is_signup': isSignup,
        'is_active': isActive,
        'out_of_charge': outOfCharge,
        'deactivation_reason': deactivationReason,
        'state': state,
        'cloud_messaging': cloudMessaging?.map((e) => e.toJson()).toList(),
        'palette': palette?.toJson(),
      };

  Profile copyWith({
    String? id,
    String? tenantUuid,
    String? customerUuid,
    String? mobile,
    String? email,
    String? username,
    String? name,
    String? surname,
    String? tel,
    int? gender,
    String? language,
    String? birthday,
    String? description,
    String? avatar,
    int? lastLoginAt,
    String? lastLoginAttempt,
    String? lastLoginIp,
    DateTime? firstLoginAt,
    String? firstLoginIp,
    DateTime? emailVerified,
    String? mobileVerified,
    double? latitude,
    double? longitude,
    Role? role,
    String? type,
    String? city,
    String? cityId,
    String? province,
    String? provinceId,
    String? country,
    String? countryId,
    String? timezone,
    String? balance,
    int? balanceUpdate,
    bool? isSignup,
    bool? isActive,
    bool? outOfCharge,
    String? deactivationReason,
    int? state,
    List<CloudMessaging>? cloudMessaging,
    Palette? palette,
  }) {
    return Profile(
      id: id ?? this.id,
      tenantUuid: tenantUuid ?? this.tenantUuid,
      customerUuid: customerUuid ?? this.customerUuid,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      username: username ?? this.username,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      tel: tel ?? this.tel,
      gender: gender ?? this.gender,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      lastLoginAttempt: lastLoginAttempt ?? this.lastLoginAttempt,
      lastLoginIp: lastLoginIp ?? this.lastLoginIp,
      firstLoginAt: firstLoginAt ?? this.firstLoginAt,
      firstLoginIp: firstLoginIp ?? this.firstLoginIp,
      emailVerified: emailVerified ?? this.emailVerified,
      mobileVerified: mobileVerified ?? this.mobileVerified,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      role: role ?? this.role,
      type: type ?? this.type,
      city: city ?? this.city,
      cityId: cityId ?? this.cityId,
      province: province ?? this.province,
      provinceId: provinceId ?? this.provinceId,
      country: country ?? this.country,
      countryId: countryId ?? this.countryId,
      timezone: timezone ?? this.timezone,
      balance: balance ?? this.balance,
      balanceUpdate: balanceUpdate ?? this.balanceUpdate,
      isSignup: isSignup ?? this.isSignup,
      isActive: isActive ?? this.isActive,
      outOfCharge: outOfCharge ?? this.outOfCharge,
      deactivationReason: deactivationReason ?? this.deactivationReason,
      state: state ?? this.state,
      cloudMessaging: cloudMessaging ?? this.cloudMessaging,
      palette: palette ?? this.palette,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      tenantUuid,
      customerUuid,
      mobile,
      email,
      username,
      name,
      surname,
      tel,
      gender,
      language,
      birthday,
      description,
      avatar,
      lastLoginAt,
      lastLoginAttempt,
      lastLoginIp,
      firstLoginAt,
      firstLoginIp,
      emailVerified,
      mobileVerified,
      latitude,
      longitude,
      role,
      type,
      city,
      cityId,
      province,
      provinceId,
      country,
      countryId,
      timezone,
      balance,
      balanceUpdate,
      isSignup,
      isActive,
      outOfCharge,
      deactivationReason,
      state,
      cloudMessaging,
      palette,
    ];
  }
}
