class Variable {
  static const appName = 'HMA APP';
  static const harusDiisi = 'Harus Diisi';
  static const regexForValidationEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}

class Url {
  static const base = '103.56.92.81:3001';
}

class PathUrl {
  static const createPendonor = '/pendonor/save';
  static const login = '/auth/login';
  static const registerDonor = '/donor/register';
  static const jenisDonor = '/donor/jenis';
  static const agenda = '/donor/register/';
  static const info = '/info';
  static const stockDarah = '/donor-stok';
}
