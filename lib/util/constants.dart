class Constants {
  static const baseUrl = 'https://api.dmiot.ir';
  static const socketUrl = 'wss://api.dmiot.ir/telemetry';
  static const timeoutSecond = 30;
  static const paginationLimit = 30;
  static const userBox = 'user_box';
  static const dashboardIdBox = 'dashboard_id_box';
  static const deviceIdBox = 'device_id_box';

  // Endpoints
  static const loginUrl = '/api/v1/auth/login';
  static const tokensUrl = '/api/v1/auth/tokens';
  static const logoutUrl = '/api/v1/auth/logout';
  static const refreshTokenUrl = '/api/v1/auth/refresh';
  static const devicesUrl = '/api/v1/devices';
  static const deviceProfilesUrl = '/api/v1/device-profiles';
  static const dashboard = '/api/v1/dashboard';
}
