// ignore_for_file: constant_identifier_names

mixin AppLocale {
  static const String appName = 'Flounaelza';

  // Language
  static const String englishLanguage = '🇬🇧  English';
  static const String indonesiaLanguage = '🇮🇩  Bahasa Indonesia';

  // Menu
  static const String product = 'Produk';
  static const String transaction = 'Transaksi';
  static const String action = 'Aksi';
  static const String history = 'Riwayat';
  static const String allProduct = 'Semua Produk';
  static const String manageProduct = 'Kelola Produk';
  static const String addDeadDataPhase1 = 'Tambah Data Mati Fase 1';
  static const String addDeadDataPhase2 = 'Tambah Data Mati Fase 2';
  static const String seedlingsToPhase1 = 'Bibit → Fase 1';
  static const String phase1ToPhase2 = 'Fase 1 → Fase 2';
  static const String addReduceReadyStock = 'Tambah & Kurangi Stok Siap';
  static const String addReadyProduct = 'Tambah Produk Siap';
  static const String editReadyProduct = 'Edit Produk Siap';
  static const String report = 'Laporan';
  static const String saleReport = 'Laporan Penjualan';
  static const String purchaseReport = 'Laporan Pembelian';
  static const String addSale = 'Tambah Penjualan';
  static const String addPurchase = 'Tambah Pembelian';
  static const String editSale = 'Edit Penjualan';
  static const String editPurchase = 'Edit Pembelian';
  static const String addAction = 'Tambah Aksi';
  static const String editAction = 'Edit Aksi';

  // Validator
  static const String validateEmailCantEmpty = 'Email tidak boleh kosong';
  static const String validateEmailNotValid = 'Masukkan email yang valid';
  static const String validatePasswordCantEmpty = 'Kata sandi tidak boleh kosong';
  static const String validatePasswordMinChar = 'Kata sandi minimal 8 karakter';
  static const String validatePhoneCantEmpty = 'Nomor telepon tidak boleh kosong';
  static const String validatePhoneMinChar = 'Nomor telepon minimal 10 karakter';
  static const String validateRequiredCantEmpty = ' tidak boleh kosong';
  static const String validateRequiredMin = 'minimal';
  static const String validateRequiredMax = 'maksimal';
  static const String validateRequiredChar = 'karakter';
  static const String validatePasswordAndConfirmSame = 'Kata Sandi dan Konfirmasi Kata Sandi harus sama';
  
  // Common
  static const String email = 'Email';
  static const String password = 'Kata Sandi';
  static const String confirmPassword = 'Konfirmasi Kata Sandi';
  static const String currentPassword = 'Kata Sandi Saat ini';
  static const String newPassword = 'Kata Sandi Baru';
  static const String confirmNewPassword = 'Konfirmasi Kata Sandi Baru';
  static const String login = 'Masuk';
  static const String logout = 'Keluar Akun';
  static const String name = 'Nama';
  static const String phone = 'No Telepon';
  static const String address = 'Alamat';
  static const String hour = 'jam';
  static const String minute = 'menit';
  static const String second = 'detik';
  static const String submit = 'Kirim';
  static const String success = 'Berhasil';
  static const String failed = 'Gagal';
  static const String hello = 'Halo';
  static const String change = 'Ubah';
  static const String edit = 'Edit';
  static const String save = 'Simpan';
  static const String search = 'Telusuri';
  static const String delete = 'Hapus';
  static const String sender = 'Pengirim';
  static const String recipient = 'Penerima';
  static const String pay = 'Bayar';
  static const String from = 'Dari';
  static const String to = 'Kepada';
  static const String cancel = 'Batalkan';
  static const String show = 'Tampilkan';
  static const String addRow = 'Tambah Baris';
  static const String deleteRow = 'Hapus Baris';
  static const String open = 'Buka';
  static const String clickToUpload = 'Klik untuk Upload';
  static const String chooseDate = 'Pilih Tanggal';
  static const String review = 'Tinjau';
  static const String preview = 'Pratinjau';
  static const String next = 'Selanjutnya';
  static const String back = 'Kembali';
  static const String copy = 'Salin';
  static const String setting = 'Pengaturan';
  static const String profile = 'Profil';
  static const String pressAgainToExit = 'Tekan sekali lagi untuk keluar';
  static const String termCondition = 'Syarat dan Ketentuan';
  static const String privacyPolicy = 'Kebijakan Privasi';
  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';
  static const String points = 'Point';
  static const String seeAll = 'See All';
  static const String signOut = 'Sign Out';
  static const String version = 'Version';
  static const String info = 'Info';
  static const String unit = 'Unit';

  // Auth

  
  static const Map<String, dynamic> ID = {
    appName: 'Flounaelza',

    // Language
    englishLanguage: '🇬🇧  English',
    indonesiaLanguage: '🇮🇩  Bahasa Indonesia',

    // Menu
    product: 'Produk',
    transaction: 'Transaksi',
    action: 'Aksi',
    history: 'Riwayat',
    allProduct: 'Semua Produk',
    manageProduct: 'Kelola Produk',
    addDeadDataPhase1: 'Tambah Data Mati Fase 1',
    addDeadDataPhase2: 'Tambah Data Mati Fase 2',
    seedlingsToPhase1: 'Bibit → Fase 1',
    phase1ToPhase2: 'Fase 1 → Fase 2',
    addReduceReadyStock: 'Tambah & Kurangi Stok Siap',
    addReadyProduct: 'Tambah Produk Siap',
    editReadyProduct: 'Edit Produk Siap',
    report: 'Laporan',
    saleReport: 'Laporan Penjualan',
    purchaseReport: 'Laporan Pembelian',
    addSale: 'Tambah Penjualan',
    addPurchase: 'Tambah Pembelian',
    editSale: 'Edit Penjualan',
    editPurchase: 'Edit Pembelian',
    addAction: 'Tambah Aksi',
    editAction: 'Edit Aksi',

    // Validator
    validateEmailCantEmpty: 'Email tidak boleh kosong',
    validateEmailNotValid: 'Masukkan email yang valid',
    validatePasswordCantEmpty: 'Kata sandi tidak boleh kosong',
    validatePasswordMinChar: 'Kata sandi minimal 8 karakter',
    validatePhoneCantEmpty: 'Nomor telepon tidak boleh kosong',
    validatePhoneMinChar: 'Nomor telepon minimal 10 karakter',
    validateRequiredCantEmpty: ' tidak boleh kosong',
    validateRequiredMin: 'minimal',
    validateRequiredMax: 'maksimal',
    validateRequiredChar: 'karakter',
    validatePasswordAndConfirmSame: 'Kata Sandi dan Konfirmasi Kata Sandi harus sama',
  
    // Common
    email: 'Email',
    password: 'Kata Sandi',
    confirmPassword: 'Konfirmasi Kata Sandi',
    currentPassword: 'Kata Sandi Saat ini',
    newPassword: 'Kata Sandi Baru',
    confirmNewPassword: 'Konfirmasi Kata Sandi Baru',
    login: 'Masuk',
    logout: 'Keluar Akun',
    name: 'Nama',
    phone: 'No Telepon',
    address: 'Alamat',
    hour: 'jam',
    minute: 'menit',
    second: 'detik',
    submit: 'Kirim',
    success: 'Berhasil',
    failed: 'Gagal',
    hello: 'Halo',
    change: 'Ubah',
    edit: 'Edit',
    save: 'Simpan',
    search: 'Telusuri',
    delete: 'Hapus',
    sender: 'Pengirim',
    recipient: 'Penerima',
    pay: 'Bayar',
    from: 'Dari',
    to: 'Kepada',
    cancel: 'Batalkan',
    show: 'Tampilkan',
    addRow: 'Tambah Baris',
    deleteRow: 'Hapus Baris',
    open: 'Buka',
    clickToUpload: 'Klik untuk Upload',
    chooseDate: 'Pilih Tanggal',
    review: 'Tinjau',
    preview: 'Pratinjau',
    next: 'Selanjutnya',
    back: 'Kembali',
    copy: 'Salin',
    setting: 'Pengaturan',
    profile: 'Profil',
    pressAgainToExit: 'Tekan sekali lagi untuk keluar',
    termCondition: 'Syarat dan Ketentuan',
    privacyPolicy: 'Kebijakan Privasi',
    signUp: 'Sign Up',
    signIn: 'Sign In',
    points: 'Point',
    seeAll: 'See All',
    signOut: 'Sign Out',
    version: 'Version',
    info: 'Info',
    unit: 'Unit',

    // Auth
  };

  static const Map<String, dynamic> EN = {
    appName: 'Flounaelza',

    // Language
    englishLanguage: '🇬🇧  English',
    indonesiaLanguage: '🇮🇩  Bahasa Indonesia',

    // Menu
    product: 'Product',
    transaction: 'Transaction',
    action: 'Action',
    history: 'History',
    allProduct: 'All Products',
    manageProduct: 'Manage Products',
    addDeadDataPhase1: 'Add Dead Data Phase 1',
    addDeadDataPhase2: 'Add Dead Data Phase 2',
    seedlingsToPhase1: 'Seedlings → Phase 1',
    phase1ToPhase2: 'Phase 1 → Phase 2',
    addReduceReadyStock: 'Add & Reduce Ready Stock',
    addReadyProduct: 'Add Ready Product',
    editReadyProduct: 'Edit Ready Product',
    report: 'Report',
    saleReport: 'Sales Report',
    purchaseReport: 'Purchase Report',
    addSale: 'Add Sale',
    addPurchase: 'Add Purchase',
    editSale: 'Edit Sale',
    editPurchase: 'Edit Purchase',
    addAction: 'Add Action',
    editAction: 'Edit Action',

    // Validator
    validateEmailCantEmpty: 'Email cannot be empty',
    validateEmailNotValid: 'Enter a valid email',
    validatePasswordCantEmpty: 'Password cannot be empty',
    validatePasswordMinChar: 'Password must be at least 8 characters',
    validatePhoneCantEmpty: 'Phone number cannot be empty',
    validatePhoneMinChar: 'Phone number must be at least 10 characters',
    validateRequiredCantEmpty: ' cannot be empty',
    validateRequiredMin: 'minimum',
    validateRequiredMax: 'maximum',
    validateRequiredChar: 'characters',
    validatePasswordAndConfirmSame: 'Password and Confirm Password must be the same',

    // Common
    email: 'Email',
    password: 'Password',
    confirmPassword: 'Confirm Password',
    currentPassword: 'Current Password',
    newPassword: 'New Password',
    confirmNewPassword: 'Confirm New Password',
    login: 'Login',
    logout: 'Logout',
    name: 'Name',
    phone: 'Phone Number',
    address: 'Address',
    hour: 'hour',
    minute: 'minute',
    second: 'second',
    submit: 'Submit',
    success: 'Success',
    failed: 'Failed',
    hello: 'Hello',
    change: 'Change',
    edit: 'Edit',
    save: 'Save',
    search: 'Search',
    delete: 'Delete',
    sender: 'Sender',
    recipient: 'Recipient',
    pay: 'Pay',
    from: 'From',
    to: 'To',
    cancel: 'Cancel',
    show: 'Show',
    addRow: 'Add Row',
    deleteRow: 'Delete Row',
    open: 'Open',
    clickToUpload: 'Click to Upload',
    chooseDate: 'Choose Date',
    review: 'Review',
    preview: 'Preview',
    next: 'Next',
    back: 'Back',
    copy: 'Copy',
    setting: 'Setting',
    profile: 'Profile',
    pressAgainToExit: 'Press again to Exit',
    termCondition: 'Terms and Conditions',
    privacyPolicy: 'Privacy Policy',
    signUp: 'Sign Up',
    signIn: 'Sign In',
    points: 'Point',
    seeAll: 'See All',
    signOut: 'Sign Out',
    version: 'Version',
    info: 'Info',
    unit: 'Unit',

    // Auth
  };
}
