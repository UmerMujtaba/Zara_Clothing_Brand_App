import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  static final _key = encrypt.Key.fromLength(32);
  static final _iv = encrypt.IV.fromLength(16);
  static final _encrypter = encrypt.Encrypter(encrypt.AES(_key));

  static String encryptCVC(String cvc) {
    final encrypted = _encrypter.encrypt(cvc, iv: _iv);
    return encrypted.base64;
  }

  static String decryptCVC(String encryptedCVC) {
    final decrypted = _encrypter.decrypt64(encryptedCVC, iv: _iv);
    return decrypted;
  }
}
