import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  group('MonacoinTransaction', () {
    const coin = TWCoinType.TWCoinTypeMonacoin;

    test('SignTransaction', () {
      /*
        https://iancoleman.io/bip39/
        Mnemonic - perfect runway tissue hover click expire orbit subway insane joy husband circle
        m/44'/22'/0'/0/0 Address - MX7ZpcMMN4GVDeUvCjAYwfRyMgfBzYNr3E
        m/44'/22'/0'/0/0 Private key in Base58 encoding - T8XV834egE6ZsgsQFPnBcYbNdFKNiGKiNj21mRjGx2scGNQh3ypZ
        m/44'/22'/0'/0/0 Private key in bytes - a356a193a24c73c657e0c7bbf4e876964984a2dcba986ea1ea1fca7b025218f3
        utxo - https://blockbook.electrum-mona.org/tx/ed0a42ced5e5fc78a0568b4bdeb512dcfc47c1aace429cc060b6c3cc3d511a44
        tx - https://blockbook.electrum-mona.org/tx/0c2916dee64b1e60414199debfa22300c7ecd1f94f3a5602d2e5b9e120b63573
      */

      final utxo_amount = 100000000;
      final amount = 50000000;
      final fee = 20000;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'M8aShwteMWyAbUw4SGS4EHLqfo1EfnKHcM',
        changeAddress: 'MX7ZpcMMN4GVDeUvCjAYwfRyMgfBzYNr3E',
        coinType: coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  '441a513dccc3b660c09c42ceaac147fcdc12b5de4b8b56a078fce5d5ce420aed'),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(utxo_amount),
            script:
                parse_hex("76a914fea39370769d4fed2d8ab98dd5daa482cc56113b88ac"),
          ),
        ],
        privateKey: [
          parse_hex(
              'a356a193a24c73c657e0c7bbf4e876964984a2dcba986ea1ea1fca7b025218f3'),
        ],
      );

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(), TWCoinType.TWCoinTypeDigiByte));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(utxo_amount - amount - fee);

      input.plan = plan;

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(hex(output.encoded),
          '0100000001441a513dccc3b660c09c42ceaac147fcdc12b5de4b8b56a078fce5d5ce420aed000000006a473044022047789dc7483b178199439bbfce0ab0caf532fec51095ba099d0d9b0b2169033402201745a0160d8d327655a8ef0542367396ce86bbb13df6b183d58c922e422cfa10012102fc08693599fda741558613cd44a50fc65953b1be797637f8790a495b85554f3effffffff0280f0fa02000000001976a914076df984229a2731cbf465ec8fbd35b8da94380f88ac60a2fa02000000001976a914fea39370769d4fed2d8ab98dd5daa482cc56113b88ac00000000');
    });

    test('LockScripts', () {
      // P2PKH
      // https://blockbook.electrum-mona.org/tx/79ebdce15e4ac933328e62dbe92302fc8b4833786e46df8a4f18295cb824fb67

      final script = TWBitcoinScript.lockScriptForAddress(
          'M8aShwteMWyAbUw4SGS4EHLqfo1EfnKHcM', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a914076df984229a2731cbf465ec8fbd35b8da94380f88ac');

      // P2SH
      // https://blockbook.electrum-mona.org/tx/726ae7d5179bfd8c7d51a5b956c3d6a262fe5190c36ed7bcb3799dc5759d5830
      final script2 = TWBitcoinScript.lockScriptForAddress(
          'P91UYtoBS4XAD39fEzaeMaq7YmMa42FFNd', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a914049880fc73bb6a5e0140404713cabe2592fb2c5587');

      // BECH32
      // https://blockbook.electrum-mona.org/tx/6d7ebe444cc12c14625fa526ed9d81058b04d2f0c3b5dad2fb0032eeec3ba511
      final script3 = TWBitcoinScript.lockScriptForAddress(
          'mona1qytnqzjknvv03jwfgrsmzt0ycmwqgl0asju3qmd', coin);
      final scriptData3 = script3.data;
      expectHex(scriptData3, '001422e6014ad3631f1939281c3625bc98db808fbfb0');
    });
  });
}
