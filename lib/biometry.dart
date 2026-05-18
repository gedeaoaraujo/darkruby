import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = .new();

  Future<bool> authenticate() async {
    try {
      final canCheck = await auth.canCheckBiometrics;
      final isSupported = await auth.isDeviceSupported();
      if (!canCheck || !isSupported) return false;

      return await auth.authenticate(
        biometricOnly: true,
        localizedReason: 'Unlock Dark Ruby',
      );
    } catch (_) {
      return false;
    }
  }
}