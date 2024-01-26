import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWBase32, () {
    test('InvalidDecode', () {
      final encodedInput = 'JBSWY3DPK5XXE3DE=======';
      final result = TWBase32.decode(encodedInput);
      expect(result, null);
    });

    test('Decode', () {
      final encodedInput = 'JBSWY3DPK5XXE3DE';
      final result = TWBase32.decode(encodedInput);

      expect(result != null, true);
      expect(result!.length, 10);

      expect(TWString.createWithRawBytes(result).value!, 'HelloWorld');
    });

    test('DecodeWithAlphabet', () {
      final encodedInput =
          'g52w64jworydimrxov5hmn3gpj2gwyttnzxdmndjo5xxiztsojuxg5dxobzhs6i';
      final filecoinAlphabet = 'abcdefghijklmnopqrstuvwxyz234567';
      final result = TWBase32.decodeWithAlphabet(
          string: encodedInput, alphabet: filecoinAlphabet);

      expect(result != null, true);
      expect(result!.length, 39);

      expect(TWString.createWithRawBytes(result).value!,
          '7uoq6tp427uzv7fztkbsnn64iwotfrristwpryy');
    });

    test('Encode', () {
      final string = TWString('HelloWorld');
      final data = string.bytes();
      final result = TWBase32.encode(data);

      expect(result, 'JBSWY3DPK5XXE3DE');
    });

    test('EncodeWithAlphabet', () {
      final filecoinAlphabet = 'abcdefghijklmnopqrstuvwxyz234567';
      final string = TWString('7uoq6tp427uzv7fztkbsnn64iwotfrristwpryy');
      final data = string.bytes();
      final encodedStr =
          TWBase32.encodeWithAlphabet(data: data, alphabet: filecoinAlphabet);

      expect(encodedStr,
          'g52w64jworydimrxov5hmn3gpj2gwyttnzxdmndjo5xxiztsojuxg5dxobzhs6i');
    });
  });
}
