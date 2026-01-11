import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Nervos.pb.dart' as Nervos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

Nervos.Script getSciptFromAddress(String address) {
  final sciptAddress =
      TWNervosAddress("ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
          "wsqwyk5x9erg8furras980hksatlslfaktks7epf25");
  return Nervos.Script(
    codeHash: sciptAddress.codeHash,
    args: sciptAddress.args,
    hashType: sciptAddress.hashType,
  );
}

Nervos.SigningInput getAnySignerInput1() {
  return Nervos.SigningInput(
    nativeTransfer: Nervos.NativeTransfer(
      toAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqdtyq04tvp02"
          "wectaumxn0664yw2jd53lqk4mxg3",
      changeAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqds6ed78"
          "yze6eyfyvd537z66ur22c9mmrgz82ama",
      amount: $fixnum.Int64(10000000000),
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(100000000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "71caea2d3ac9e3ea899643e3e67dd11eb587e7fe0d8c6e67255d0959fa0a1fa3"),
          index: 1,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
      Nervos.Cell(
        capacity: $fixnum.Int64(20000000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "71caea2d3ac9e3ea899643e3e67dd11eb587e7fe0d8c6e67255d0959fa0a1fa3"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb")
    ],
  );
}

void checkAnySignerOutput1(Nervos.SigningOutput output) {
  expect(output.error, Common.SigningError.OK);
  // https://explorer.nervos.org/transaction/0xf2c32afde7e72011985583873bc16c0a3c01fc01fc161eb4b914fcf84c53cdf8
  expect(output.transactionId,
      '0xf2c32afde7e72011985583873bc16c0a3c01fc01fc161eb4b914fcf84c53cdf8');
  expect(
    output.transactionJson,
    "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
    "\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}}],\"header_deps\":"
    "[],\"inputs\":[{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
    "\"0x71caea2d3ac9e3ea899643e3e67dd11eb587e7fe0d8c6e67255d0959fa0a1fa3\"},\"since\":\"0x0\"}"
    "],\"outputs\":[{\"capacity\":\"0x2540be400\",\"lock\":{\"args\":"
    "\"0xab201f55b02f53b385f79b34dfad548e549b48fc\",\"code_hash\":"
    "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
    "\"type\"},\"type\":null},{\"capacity\":\"0x2540be230\",\"lock\":{\"args\":"
    "\"0xb0d65be39059d6489231b48f85ad706a560bbd8d\",\"code_hash\":"
    "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
    "\"type\"},\"type\":null}],\"outputs_data\":[\"0x\",\"0x\"],\"version\":\"0x0\","
    "\"witnesses\":["
    "\"0x55000000100000005500000055000000410000002a9ef2ad7829e5ea0c7a32735d29a0cb2ec20434f6fd5b"
    "f6e29cda56b28e08140156191cbbf80313d3c9cae4b74607acce7b28eb21d52ef058ed8491cdde70b700\"]}",
  );
}

void checkPlan1(Nervos.TransactionPlan txPlanProto) {
  expect(txPlanProto.error, Common.SigningError.OK);

  expect(txPlanProto.cellDeps.length, 1);

  final cellDep1 = txPlanProto.cellDeps[0];
  final cellDep1TxHash = parse_hex(
      "71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c");
  expect(cellDep1.outPoint.txHash, cellDep1TxHash);
  expect(cellDep1.outPoint.index, 0);
  expect(cellDep1.depType, "dep_group");

  expect(txPlanProto.headerDeps.length, 0);

  expect(txPlanProto.selectedCells.length, 1);

  final cell1 = txPlanProto.selectedCells[0];
  expect(
      cell1.outPoint.txHash,
      parse_hex(
          "71caea2d3ac9e3ea899643e3e67dd11eb587e7fe0d8c6e67255d0959fa0a1fa3"));
  expect(cell1.outPoint.index, 0);
  expect(cell1.capacity.toInt(), 20000000000);
  expect(
      cell1.lock.codeHash,
      parse_hex(
          "9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8"));
  expect(cell1.lock.hashType, 'type');
  expect(
      cell1.lock.args, parse_hex("c4b50c5c8d074f063ec0a77ded0eaff0fa7b65da"));
  expect(cell1.type.codeHash.length, 0);
  expect(cell1.type.args.length, 0);
  expect(cell1.data.length, 0);

  expect(txPlanProto.outputs.length, 2);
  expect(txPlanProto.outputsData.length, 2);

  final cellOutput1 = txPlanProto.outputs[0];
  expect(cellOutput1.capacity.toInt(), 10000000000);
  expect(
      cellOutput1.lock.codeHash,
      parse_hex(
          "9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8"));
  expect(cellOutput1.lock.hashType, 'type');
  expect(cellOutput1.lock.args,
      parse_hex("ab201f55b02f53b385f79b34dfad548e549b48fc"));
  expect(cellOutput1.type.codeHash.length, 0);
  expect(cellOutput1.type.args.length, 0);
  expect(txPlanProto.outputsData[0].length, 0);

  final cellOutput2 = txPlanProto.outputs[1];
  expect(cellOutput2.capacity.toInt(), 9999999536);
  expect(
      cellOutput2.lock.codeHash,
      parse_hex(
          "9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8"));
  expect(cellOutput2.lock.hashType, 'type');
  expect(cellOutput2.lock.args,
      parse_hex("b0d65be39059d6489231b48f85ad706a560bbd8d"));
  expect(cellOutput2.type.codeHash.length, 0);
  expect(cellOutput2.type.args.length, 0);
  expect(txPlanProto.outputsData[1].length, 0);
}

Nervos.SigningInput getAnySignerInput2() {
  return Nervos.SigningInput(
    nativeTransfer: Nervos.NativeTransfer(
      toAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqdtyq04tvp02"
          "wectaumxn0664yw2jd53lqk4mxg3",
      changeAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqds6ed78"
          "yze6eyfyvd537z66ur22c9mmrgz82ama",
      useMaxAmount: true,
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(11410040620),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "c75567c80dc9b97aaf4e5c23f4c7f37b077f2b33a50dd7abd952abfbd5beb247"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb")
    ],
  );
}

Nervos.SigningInput getAnySignerInput3() {
  return Nervos.SigningInput(
    sudtTransfer: Nervos.SudtTransfer(
      toAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqdtyq04tvp02"
          "wectaumxn0664yw2jd53lqk4mxg3",
      changeAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqds6ed78"
          "yze6eyfyvd537z66ur22c9mmrgz82ama",
      amount: '1000000000000000',
      sudtAddress: parse_hex(
          "9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8"),
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(14399998906),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "5b12911e7413e011f251c1fb5fae4e76fd5fcae4f0d4c6412dcc5b0bfcece823"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
      Nervos.Cell(
        capacity: $fixnum.Int64(14400000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "e118bd11a73d381daf288381ce182d92b6cf2f52d25886bbda9e1a61525c7c4a"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              "5e7a36a77e68eecc013dfa2fe6a23f3b6c344b04005808694ae6dd45eea4cfd5"),
          args: parse_hex(
              "9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8"),
          hashType: "type",
        ),
        data: parse_hex("00e0e4c9b9f84f000000000000000000"),
      ),
      Nervos.Cell(
        capacity: $fixnum.Int64(8210025567),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "09a45a15e48f985b554a0b6e5f0857913cc492ec061cc9b0b2befa4b24609a4a"),
          index: 1,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqds6ed78yze6eyfyvd537z66ur22c9mmrgz82ama"),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb"),
      parse_hex(
          "0c8859a9d9084a8c2b55963268b352e258756f9240f2a1f4645c610ed191dae9"),
    ],
  );
}

Nervos.SigningInput getAnySignerInput4() {
  return Nervos.SigningInput(
    sudtTransfer: Nervos.SudtTransfer(
      toAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqdtyq04tvp02"
          "wectaumxn0664yw2jd53lqk4mxg3",
      changeAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqds6ed78"
          "yze6eyfyvd537z66ur22c9mmrgz82ama",
      useMaxAmount: true,
      sudtAddress: parse_hex(
          "9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8"),
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(8210026306),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "430cb60ee816e2631d6d9605659c18fec8eb3de94526f5fd4ad51feaad6f1664"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
      Nervos.Cell(
        capacity: $fixnum.Int64(14400000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "378b6bd2f7fc2b1599ee55be7e8fa17fdd6e0d25e2e146d5f46006e0292d6564"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              "5e7a36a77e68eecc013dfa2fe6a23f3b6c344b04005808694ae6dd45eea4cfd5"),
          args: parse_hex(
              "9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8"),
          hashType: "type",
        ),
        data: parse_hex("00601e253b6b4c000000000000000000"),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb"),
    ],
  );
}

Nervos.SigningInput getAnySignerInput5() {
  return Nervos.SigningInput(
    daoDeposit: Nervos.DaoDeposit(
      toAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8f"
          "urras980hksatlslfaktks7epf25",
      changeAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9e"
          "rg8furras980hksatlslfaktks7epf25",
      amount: $fixnum.Int64(10200000000),
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(8210021909),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "c7dacd4aab49f5f9643e87752428cebde38eeb49c7726781c4d8b526822004a1"),
          index: 1,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqds6ed78yze6eyfyvd537z66ur22c9mmrgz82ama"),
      ),
      Nervos.Cell(
        capacity: $fixnum.Int64(14399998167),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "d3c3263170815b326779e2fd8d548f846ae13eff9d9a82833c7071069a1d32bf"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb"),
      parse_hex(
          "0c8859a9d9084a8c2b55963268b352e258756f9240f2a1f4645c610ed191dae9"),
    ],
  );
}

Nervos.SigningInput getAnySignerInput6() {
  return Nervos.SigningInput(
    daoWithdrawPhase1: Nervos.DaoWithdrawPhase1(
      changeAddress:
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9e"
          "rg8furras980hksatlslfaktks7epf25",
      depositCell: Nervos.Cell(
        capacity: $fixnum.Int64(10200000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8furras9"
            "80hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              '82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e'),
          hashType: 'type',
          args: [],
        ),
        data: parse_hex('0000000000000000'),
        blockNumber: $fixnum.Int64(7575466),
        blockHash: parse_hex(
            '3dfdb4b702a355a5593315016f8af0537d5a2f3292811b79420ded78a092be6a'),
      ),
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(10200000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              '82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e'),
          hashType: 'type',
          args: [],
        ),
        data: parse_hex('0000000000000000'),
      ),
      Nervos.Cell(
        capacity: $fixnum.Int64(12410019377),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683"),
          index: 1,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb"),
    ],
  );
}

Nervos.SigningInput getAnySignerInput7() {
  return Nervos.SigningInput(
    daoWithdrawPhase2: Nervos.DaoWithdrawPhase2(
      depositCell: Nervos.Cell(
        capacity: $fixnum.Int64(10200000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8furras9"
            "80hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              '82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e'),
          hashType: 'type',
          args: [],
        ),
        data: parse_hex('0000000000000000'),
        blockNumber: $fixnum.Int64(7575466),
        blockHash: parse_hex(
            '3dfdb4b702a355a5593315016f8af0537d5a2f3292811b79420ded78a092be6a'),
      ),
      withdrawingCell: Nervos.Cell(
        capacity: $fixnum.Int64(10200000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "b4e62bc5f5108275b0ef3da8f8cc3fb0172843c4a2a9cdfef3b04d6c65e9acca"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8furras9"
            "80hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              '82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e'),
          hashType: 'type',
          args: [],
        ),
        data: parse_hex('aa97730000000000'),
        blockNumber: $fixnum.Int64(7575534),
        blockHash: parse_hex(
            'b070d5364afd47c23fe267077d454009d6f665f200a915e68af1616e46f4aa52'),
        since: $fixnum.Int64(0x20037c0000001731),
      ),
      amount: $fixnum.Int64(10200000000),
    ),
    byteFee: $fixnum.Int64(1),
    cell: [
      Nervos.Cell(
        capacity: $fixnum.Int64(10200000000),
        outPoint: Nervos.OutPoint(
          txHash: parse_hex(
              "b4e62bc5f5108275b0ef3da8f8cc3fb0172843c4a2a9cdfef3b04d6c65e9acca"),
          index: 0,
        ),
        lock: getSciptFromAddress(
            "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50x"
            "wsqwyk5x9erg8furras980hksatlslfaktks7epf25"),
        type: Nervos.Script(
          codeHash: parse_hex(
              '82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e'),
          hashType: 'type',
          args: [],
        ),
        data: parse_hex('aa97730000000000'),
      ),
    ],
    privateKey: [
      parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61feb"),
    ],
  );
}

void main() {
  initTest();
  group('TWAnySignerNervos', () {
    const coin = TWCoinType.Nervos;

    test('Sign_Native_Simple', () {
      final input = getAnySignerInput1();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      checkAnySignerOutput1(output);
    });

    test('PlanAndSign_Native_Simple', () {
      final input = getAnySignerInput1();
      final txPlanProto = Nervos.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      checkPlan1(txPlanProto);
      input.plan = txPlanProto;
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      checkAnySignerOutput1(output);
    });

    test('Sign_NegativeMissingKey', () {
      final input = getAnySignerInput1();
      input.privateKey.clear();
      final privateKey = parse_hex(
          "8a2a726c44e46d1efaa0f9c2a8efed932f0e96d6050b914fde762ee285e61fec");
      input.privateKey.add(privateKey);

      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.Error_missing_private_key);
    });

    test('Sign_NegativeNotEnoughUtxos', () {
      final input = getAnySignerInput1();
      input.nativeTransfer.amount = $fixnum.Int64(1000000000000);

      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.Error_not_enough_utxos);
    });

    test('Sign_Native_SendMaximum', () {
      final input = getAnySignerInput2();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      // https://explorer.nervos.org/transaction/0x298f5e04b6900796614b89062eb96cec63c3b2c460d01058736a793b567bc5c8
      expect(output.transactionId,
          '0x298f5e04b6900796614b89062eb96cec63c3b2c460d01058736a793b567bc5c8');
      expect(
        output.transactionJson,
        "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}}],\"header_deps\":"
        "[],\"inputs\":[{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0xc75567c80dc9b97aaf4e5c23f4c7f37b077f2b33a50dd7abd952abfbd5beb247\"},\"since\":\"0x0\"}"
        "],\"outputs\":[{\"capacity\":\"0x2a81765c9\",\"lock\":{\"args\":"
        "\"0xab201f55b02f53b385f79b34dfad548e549b48fc\",\"code_hash\":"
        "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
        "\"type\"},\"type\":null}],\"outputs_data\":[\"0x\"],\"version\":\"0x0\",\"witnesses\":["
        "\"0x5500000010000000550000005500000041000000daf6e65e5a1fe447a4feb7199886b6635c44738e04ea59"
        "457608fb1c447e068026529d57b02014ddc144622f886153df426853f22083f8891461eeb50b5ce97d01\"]}",
      );
    });

    test('Sign_SUDT_Simple', () {
      final input = getAnySignerInput3();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      // https://explorer.nervos.org/transaction/0x9b15f2bea26b98201540d8e20e8b1c21d96dd77ad246520b405c6aabb7173371
      expect(output.transactionId,
          '0x9b15f2bea26b98201540d8e20e8b1c21d96dd77ad246520b405c6aabb7173371');
      // expect(
      //   output.transactionJson,
      //   "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
      //   "\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}},{\"dep_type\":"
      //   "\"code\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
      //   "\"0xc7813f6a415144643970c2e88e0bb6ca6a8edc5dd7c1022746f628284a9936d5\"}}],\"header_deps\":"
      //   "[],\"inputs\":[{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
      //   "\"0xe118bd11a73d381daf288381ce182d92b6cf2f52d25886bbda9e1a61525c7c4a\"},\"since\":\"0x0\"}"
      //   ",{\"previous_output\":{\"index\":\"0x1\",\"tx_hash\":"
      //   "\"0x09a45a15e48f985b554a0b6e5f0857913cc492ec061cc9b0b2befa4b24609a4a\"},\"since\":\"0x0\"}"
      //   ",{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
      //   "\"0x5b12911e7413e011f251c1fb5fae4e76fd5fcae4f0d4c6412dcc5b0bfcece823\"},\"since\":\"0x0\"}"
      //   "],\"outputs\":[{\"capacity\":\"0x35a4e9000\",\"lock\":{\"args\":"
      //   "\"0xab201f55b02f53b385f79b34dfad548e549b48fc\",\"code_hash\":"
      //   "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
      //   "\"type\"},\"type\":{\"args\":"
      //   "\"0x9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8\",\"code_hash\":"
      //   "\"0x5e7a36a77e68eecc013dfa2fe6a23f3b6c344b04005808694ae6dd45eea4cfd5\",\"hash_type\":"
      //   "\"type\"}},{\"capacity\":\"0x35a4e9000\",\"lock\":{\"args\":"
      //   "\"0xb0d65be39059d6489231b48f85ad706a560bbd8d\",\"code_hash\":"
      //   "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
      //   "\"type\"},\"type\":{\"args\":"
      //   "\"0x9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8\",\"code_hash\":"
      //   "\"0x5e7a36a77e68eecc013dfa2fe6a23f3b6c344b04005808694ae6dd45eea4cfd5\",\"hash_type\":"
      //   "\"type\"}},{\"capacity\":\"0x1e95b03db\",\"lock\":{\"args\":"
      //   "\"0xb0d65be39059d6489231b48f85ad706a560bbd8d\",\"code_hash\":"
      //   "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
      //   "\"type\"},\"type\":null}],\"outputs_data\":[\"0x0080c6a47e8d03000000000000000000\","
      //   "\"0x00601e253b6b4c000000000000000000\",\"0x\"],\"version\":\"0x0\",\"witnesses\":["
      //   "\"0x550000001000000055000000550000004100000035d55fd46316f248552eb6af7ac9589c9ec533c4e5b718"
      //   "96b05cdf697e2d18551ceff54d7b860ebb2f4dd5f6c5bb4af1da15460a7621f5aa4bc7d5585a0504de00\","
      //   "\"0x5500000010000000550000005500000041000000eaa4bf69126d3016ab786610f2f0668b2ef353915d623d"
      //   "0b0184fc25cec3dcad6dc08a1504a2d7dd9faced17b041d79d4c21f1977e57859713360f5e3609583501\","
      //   "\"0x\"]}",
      // );
    });

    test('Sign_SUDT_SendMaximum', () {
      final input = getAnySignerInput4();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      // https://explorer.nervos.org/transaction/0x09a45a15e48f985b554a0b6e5f0857913cc492ec061cc9b0b2befa4b24609a4a
      expect(output.transactionId,
          '0x09a45a15e48f985b554a0b6e5f0857913cc492ec061cc9b0b2befa4b24609a4a');
      expect(
        output.transactionJson,
        "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_"
        "hash\":\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}},{"
        "\"dep_type\":\"code\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0xc7813f6a415144643970c2e88e0bb6ca6a8edc5dd7c1022746f628284a9936d5\"}}],\"header_"
        "deps\":[],\"inputs\":[{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0x378b6bd2f7fc2b1599ee55be7e8fa17fdd6e0d25e2e146d5f46006e0292d6564\"},\"since\":"
        "\"0x0\"},{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0x430cb60ee816e2631d6d9605659c18fec8eb3de94526f5fd4ad51feaad6f1664\"},\"since\":"
        "\"0x0\"}],\"outputs\":[{\"capacity\":\"0x35a4e9000\",\"lock\":{\"args\":"
        "\"0xab201f55b02f53b385f79b34dfad548e549b48fc\",\"code_hash\":"
        "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_"
        "type\":\"type\"},\"type\":{\"args\":"
        "\"0x9657b32fcdc463e13ec9205914fd91c443822a949937ae94add9869e7f2e1de8\",\"code_"
        "hash\":\"0x5e7a36a77e68eecc013dfa2fe6a23f3b6c344b04005808694ae6dd45eea4cfd5\","
        "\"hash_type\":\"type\"}},{\"capacity\":\"0x1e95b0c5f\",\"lock\":{\"args\":"
        "\"0xb0d65be39059d6489231b48f85ad706a560bbd8d\",\"code_hash\":"
        "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_"
        "type\":\"type\"},\"type\":null}],\"outputs_data\":["
        "\"0x00601e253b6b4c000000000000000000\",\"0x\"],\"version\":\"0x0\",\"witnesses\":["
        "\"0x5500000010000000550000005500000041000000da7c908bdf2cb091b7ff9bb682b762d1323c5e1e"
        "cf9b2ce0ebedb9d55f6625c52ab14910ae401833112f2ea516ab11bc9ef691c3dff7886e3238c9348c3d"
        "73a701\",\"0x\"]}",
      );
    });

    test('Sign_DAO_Deposit', () {
      final input = getAnySignerInput5();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      // https://explorer.nervos.org/transaction/0x583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683
      expect(output.transactionId,
          '0x583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683');
      // expect(
      //   output.transactionJson,
      //   "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
      //   "\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}},{\"dep_type\":"
      //   "\"code\",\"out_point\":{\"index\":\"0x2\",\"tx_hash\":"
      //   "\"0xe2fb199810d49a4d8beec56718ba2593b665db9d52299a0f9e6e75416d73ff5c\"}}],\"header_deps\":"
      //   "[],\"inputs\":[{\"previous_output\":{\"index\":\"0x1\",\"tx_hash\":"
      //   "\"0xc7dacd4aab49f5f9643e87752428cebde38eeb49c7726781c4d8b526822004a1\"},\"since\":\"0x0\"}"
      //   ",{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
      //   "\"0xd3c3263170815b326779e2fd8d548f846ae13eff9d9a82833c7071069a1d32bf\"},\"since\":\"0x0\"}"
      //   "],\"outputs\":[{\"capacity\":\"0x25ff7a600\",\"lock\":{\"args\":"
      //   "\"0xc4b50c5c8d074f063ec0a77ded0eaff0fa7b65da\",\"code_hash\":"
      //   "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
      //   "\"type\"},\"type\":{\"args\":\"0x\",\"code_hash\":"
      //   "\"0x82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e\",\"hash_type\":"
      //   "\"type\"}},{\"capacity\":\"0x2e3b1de31\",\"lock\":{\"args\":"
      //   "\"0xc4b50c5c8d074f063ec0a77ded0eaff0fa7b65da\",\"code_hash\":"
      //   "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
      //   "\"type\"},\"type\":null}],\"outputs_data\":[\"0x0000000000000000\",\"0x\"],\"version\":"
      //   "\"0x0\",\"witnesses\":["
      //   "\"0x5500000010000000550000005500000041000000305d09c7de3f34a4d53bc4e0031ee59c95b9abc4fc3ff5"
      //   "548e1a17ca726c069a232012c9c4be6ec4d4ffbe88613ca5e686e3e4b7d0b9bbd7038003e23ffdcdd601\","
      //   "\"0x55000000100000005500000055000000410000007c514c77482dd1e1086f41a6d17364c9b5ed16364d61df"
      //   "6f7fd8540f8bf7c131275c877943786b1b72fbf4f9d817ee5dd554a689808b7919543c691b5068e5be01\"]}",
      // );
    });

    test('Sign_DAO_Withdraw_Phase1', () {
      final input = getAnySignerInput6();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      // https://explorer.nervos.org/transaction/0xb4e62bc5f5108275b0ef3da8f8cc3fb0172843c4a2a9cdfef3b04d6c65e9acca
      expect(output.transactionId,
          '0xb4e62bc5f5108275b0ef3da8f8cc3fb0172843c4a2a9cdfef3b04d6c65e9acca');
      expect(
        output.transactionJson,
        "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_"
        "hash\":\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}},{"
        "\"dep_type\":\"code\",\"out_point\":{\"index\":\"0x2\",\"tx_hash\":"
        "\"0xe2fb199810d49a4d8beec56718ba2593b665db9d52299a0f9e6e75416d73ff5c\"}}],\"header_"
        "deps\":[\"0x3dfdb4b702a355a5593315016f8af0537d5a2f3292811b79420ded78a092be6a\"],"
        "\"inputs\":[{\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0x583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683\"},\"since\":"
        "\"0x0\"},{\"previous_output\":{\"index\":\"0x1\",\"tx_hash\":"
        "\"0x583d77a037e86155b7ab79ac59fc9bb01640e2427e859467ea10c4a6f222b683\"},\"since\":"
        "\"0x0\"}],\"outputs\":[{\"capacity\":\"0x25ff7a600\",\"lock\":{\"args\":"
        "\"0xc4b50c5c8d074f063ec0a77ded0eaff0fa7b65da\",\"code_hash\":"
        "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_"
        "type\":\"type\"},\"type\":{\"args\":\"0x\",\"code_hash\":"
        "\"0x82d76d1b75fe2fd9a27dfbaa65a039221a380d76c926f378d3f81cf3e7e13f2e\",\"hash_"
        "type\":\"type\"}},{\"capacity\":\"0x2e3b1db56\",\"lock\":{\"args\":"
        "\"0xc4b50c5c8d074f063ec0a77ded0eaff0fa7b65da\",\"code_hash\":"
        "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_"
        "type\":\"type\"},\"type\":null}],\"outputs_data\":[\"0xaa97730000000000\",\"0x\"],"
        "\"version\":\"0x0\",\"witnesses\":["
        "\"0x5500000010000000550000005500000041000000d5131c1a6b8eca11e2c280b72c5db09ea00bb788"
        "fd3262eaced861c39db2aad04a36f9d174b6f167a9c98b85d2bccf537a163c44459d23467dfa86408f48"
        "dd5f01\",\"0x\"]}",
      );
    });

    test('Sign_DAO_Withdraw_Phase2', () {
      final input = getAnySignerInput7();
      final output = Nervos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      expect(output.transactionId,
          '0x4fde13c93fc5d24ab7f660070aaa0b1725809d585f6258605e595cdbd856ea1c');
      expect(
        output.transactionJson,
        "{\"cell_deps\":[{\"dep_type\":\"dep_group\",\"out_point\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0x71a7ba8fc96349fea0ed3a5c47992e3b4084b031a42264a018e0072e8172e46c\"}},{\"dep_type\":"
        "\"code\",\"out_point\":{\"index\":\"0x2\",\"tx_hash\":"
        "\"0xe2fb199810d49a4d8beec56718ba2593b665db9d52299a0f9e6e75416d73ff5c\"}}],\"header_deps\":"
        "[\"0x3dfdb4b702a355a5593315016f8af0537d5a2f3292811b79420ded78a092be6a\","
        "\"0xb070d5364afd47c23fe267077d454009d6f665f200a915e68af1616e46f4aa52\"],\"inputs\":[{"
        "\"previous_output\":{\"index\":\"0x0\",\"tx_hash\":"
        "\"0xb4e62bc5f5108275b0ef3da8f8cc3fb0172843c4a2a9cdfef3b04d6c65e9acca\"},\"since\":"
        "\"0x20037c0000001731\"}],\"outputs\":[{\"capacity\":\"0x25ff7a42c\",\"lock\":{\"args\":"
        "\"0xc4b50c5c8d074f063ec0a77ded0eaff0fa7b65da\",\"code_hash\":"
        "\"0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8\",\"hash_type\":"
        "\"type\"},\"type\":null}],\"outputs_data\":[\"0x\"],\"version\":\"0x0\",\"witnesses\":["
        "\"0x6100000010000000550000006100000041000000743f86c5557f4e2d3327f4d17e7bad27209b29c1e9cdba"
        "b42ab03f7094af917b4b203ddd7f2e87102e09ae579f2fe7f6adb7900b7386b58c1183ba0011b7c42100080000"
        "000000000000000000\"]}",
      );
    });
  });
}
