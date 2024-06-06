import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Icon.pb.dart' as Icon;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('IconCompiler', () {
    const coin = TWCoinType.ICON;

    test('CompileWithSignatures', () {
      final input = Icon.SigningInput(
        fromAddress: 'hxbe258ceb872e08851f1f59694dac2558708ece11',
        toAddress: 'hx5bfdb090f43a808005ffc27c25b213145e80b7cd',
        value: bigIntStringToBytes('1000000000000000000'),
        stepLimit: intToBytes(74565),
        networkId: intToBytes(1),
        nonce: intToBytes(1),
        timestamp: $fixnum.Int64(1516942975500598),
      );

      final protoInputData = input.writeToBuffer();

      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, protoInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);

      expect(preSigningOutput.error, Common.SigningError.OK);
      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImage),
          "6963785f73656e645472616e73616374696f6e2e66726f6d2e6878626532353863656238373265303838353166316635393639346461633235353837303865636531312e6e69642e3078312e6e6f6e63652e3078312e737465704c696d69742e307831323334352e74696d657374616d702e3078353633613663663333303133362e746f2e6878356266646230393066343361383038303035666663323763323562323133313435653830623763642e76616c75652e30786465306236623361373634303030302e76657273696f6e2e307833");
      expect(hex(preImageHash),
          "f0c68a4f588233d722fff7b5a738ffa6b56ad4cb62ad6bc9fb3e5facb0c25059");

      final key = parse_hex(
          "2d42994b2f7735bbc93a3e64381864d06747e574aa94655c516f9ad0a74eed79");
      final privateKey = TWPrivateKey.createWithData(key);
      final publicKey = privateKey.getPublicKey(coin);
      final signature =
          privateKey.sign(parse_hex(hex(preImageHash)), TWCurve.SECP256k1);

      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: protoInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final output = Icon.SigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expect(hex(output.encoded.codeUnits),
          "7b2266726f6d223a22687862653235386365623837326530383835316631663539363934646163323535383730386563653131222c226e6964223a22307831222c226e6f6e6365223a22307831222c227369676e6174757265223a22785236774b732b49412b374539316254383936366a464b6c4b356d61797574584376617975534d437278394b4237363730437357613042374c517a6773785530474c58616f766c4154324d4c73315875446953615a51453d222c22737465704c696d6974223a2230783132333435222c2274696d657374616d70223a22307835363361366366333330313336222c22746f223a22687835626664623039306634336138303830303566666332376332356232313331343565383062376364222c2276616c7565223a223078646530623662336137363430303030222c2276657273696f6e223a22307833227d");
    });
  });
}
