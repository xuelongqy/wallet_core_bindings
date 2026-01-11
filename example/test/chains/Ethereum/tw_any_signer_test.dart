import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWEthereumSigner', () {
    const coin = TWCoinType.Ethereum;

    test('Sign', () {
      // from http://thetokenfactory.com/#/factory
      // https://etherscan.io/tx/0x63879f20909a315bcffe629bc03b20e5bc65ba2a377bd7152e3b69c4bd4cd6cc
      final chainId = intToBytes(1);
      final nonce = intToBytes(11);
      final gasPrice = intToBytes(20000000000);
      final gasLimit = intToBytes(1000000);
      final data = parse_hex(
          "0x60a060405260046060527f48302e31000000000000000000000000000000000000000000000000000000006080526006805460008290527f48302e310000000000000000000000000000000000000000000000000000000882556100b5907ff652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3f602060026001841615610100026000190190931692909204601f01919091048101905b8082111561017957600081556001016100a1565b505060405161094b38038061094b83398101604052808051906020019091908051820191906020018051906020019091908051820191906020015050836000600050600033600160a060020a0316815260200190815260200160002060005081905550836002600050819055508260036000509080519060200190828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061017d57805160ff19168380011785555b506101ad9291506100a1565b5090565b8280016001018555821561016d579182015b8281111561016d57825182600050559160200191906001019061018f565b50506004805460ff19168317905560058054825160008390527f036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0602060026001851615610100026000190190941693909304601f90810184900482019386019083901061022d57805160ff19168380011785555b5061025d9291506100a1565b82800160010185558215610221579182015b8281111561022157825182600050559160200191906001019061023f565b5050505050506106da806102716000396000f36060604052361561008d5760e060020a600035046306fdde038114610095578063095ea7b3146100f357806318160ddd1461016857806323b872dd14610171578063313ce5671461025c57806354fd4d501461026857806370a08231146102c657806395d89b41146102f4578063a9059cbb14610352578063cae9ca51146103f7578063dd62ed3e146105be575b6105f2610002565b6040805160038054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03908116600081815260016020908152604080832094871680845294825280832086905580518681529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a35060015b92915050565b6102e260025481565b610662600435602435604435600160a060020a0383166000908152602081905260408120548290108015906101c4575060016020908152604080832033600160a060020a03168452909152812054829010155b80156101d05750600082115b156106bf57600160a060020a0383811660008181526020818152604080832080548801905588851680845281842080548990039055600183528184203390961684529482529182902080548790039055815186815291519293927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9281900390910190a35060016106c3565b61067660045460ff1681565b6040805160068054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b600160a060020a03600435166000908152602081905260409020545b60408051918252519081900360200190f35b6105f46005805460408051602060026001851615610100026000190190941693909304601f810184900484028201840190925281815292918301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03166000908152602081905260408120548290108015906103845750600082115b156106ca5733600160a060020a0390811660008181526020818152604080832080548890039055938716808352918490208054870190558351868152935191937fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef929081900390910190a3506001610162565b604080516020604435600481810135601f810184900484028501840190955284845261066294813594602480359593946064949293910191819084018382808284375094965050505050505033600160a060020a03908116600081815260016020908152604080832094881680845294825280832087905580518781529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a383600160a060020a031660405180807f72656365697665417070726f76616c28616464726573732c75696e743235362c81526020017f616464726573732c627974657329000000000000000000000000000000000000815260200150602e019050604051809103902060e060020a9004338530866040518560e060020a0281526004018085600160a060020a0316815260200184815260200183600160a060020a031681526020018280519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156105965780820380516001836020036101000a031916815260200191505b509450505050506000604051808303816000876161da5a03f19250505015156106d257610002565b6102e2600435602435600160a060020a03828116600090815260016020908152604080832093851683529290522054610162565b005b60405180806020018281038252838181518152602001915080519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156106545780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b604080519115158252519081900360200190f35b6040805160ff9092168252519081900360200190f35b820191906000526020600020905b81548152906001019060200180831161069a57829003601f168201915b505050505081565b5060005b9392505050565b506000610162565b5060016106c35600000000000000000000000000000000000000000000000000000000000003e80000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000754204275636b73000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003544f540000000000000000000000000000000000000000000000000000000000");
      final key = parse_hex(
          "0x4646464646464646464646464646464646464646464646464646464646464646");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        privateKey: key,
        transaction: Ethereum.Transaction(
          contractGeneric: Ethereum.Transaction_ContractGeneric(
            data: data,
          ),
        ),
      );

      const expected =
          'f90a9e0b8504a817c800830f42408080b90a4b60a060405260046060527f48302e31000000000000000000000000000000000000000000000000000000006080526006805460008290527f48302e310000000000000000000000000000000000000000000000000000000882556100b5907ff652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3f602060026001841615610100026000190190931692909204601f01919091048101905b8082111561017957600081556001016100a1565b505060405161094b38038061094b83398101604052808051906020019091908051820191906020018051906020019091908051820191906020015050836000600050600033600160a060020a0316815260200190815260200160002060005081905550836002600050819055508260036000509080519060200190828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061017d57805160ff19168380011785555b506101ad9291506100a1565b5090565b8280016001018555821561016d579182015b8281111561016d57825182600050559160200191906001019061018f565b50506004805460ff19168317905560058054825160008390527f036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0602060026001851615610100026000190190941693909304601f90810184900482019386019083901061022d57805160ff19168380011785555b5061025d9291506100a1565b82800160010185558215610221579182015b8281111561022157825182600050559160200191906001019061023f565b5050505050506106da806102716000396000f36060604052361561008d5760e060020a600035046306fdde038114610095578063095ea7b3146100f357806318160ddd1461016857806323b872dd14610171578063313ce5671461025c57806354fd4d501461026857806370a08231146102c657806395d89b41146102f4578063a9059cbb14610352578063cae9ca51146103f7578063dd62ed3e146105be575b6105f2610002565b6040805160038054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03908116600081815260016020908152604080832094871680845294825280832086905580518681529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a35060015b92915050565b6102e260025481565b610662600435602435604435600160a060020a0383166000908152602081905260408120548290108015906101c4575060016020908152604080832033600160a060020a03168452909152812054829010155b80156101d05750600082115b156106bf57600160a060020a0383811660008181526020818152604080832080548801905588851680845281842080548990039055600183528184203390961684529482529182902080548790039055815186815291519293927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9281900390910190a35060016106c3565b61067660045460ff1681565b6040805160068054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b600160a060020a03600435166000908152602081905260409020545b60408051918252519081900360200190f35b6105f46005805460408051602060026001851615610100026000190190941693909304601f810184900484028201840190925281815292918301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03166000908152602081905260408120548290108015906103845750600082115b156106ca5733600160a060020a0390811660008181526020818152604080832080548890039055938716808352918490208054870190558351868152935191937fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef929081900390910190a3506001610162565b604080516020604435600481810135601f810184900484028501840190955284845261066294813594602480359593946064949293910191819084018382808284375094965050505050505033600160a060020a03908116600081815260016020908152604080832094881680845294825280832087905580518781529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a383600160a060020a031660405180807f72656365697665417070726f76616c28616464726573732c75696e743235362c81526020017f616464726573732c627974657329000000000000000000000000000000000000815260200150602e019050604051809103902060e060020a9004338530866040518560e060020a0281526004018085600160a060020a0316815260200184815260200183600160a060020a031681526020018280519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156105965780820380516001836020036101000a031916815260200191505b509450505050506000604051808303816000876161da5a03f19250505015156106d257610002565b6102e2600435602435600160a060020a03828116600090815260016020908152604080832093851683529290522054610162565b005b60405180806020018281038252838181518152602001915080519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156106545780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b604080519115158252519081900360200190f35b6040805160ff9092168252519081900360200190f35b820191906000526020600020905b81548152906001019060200180831161069a57829003601f168201915b505050505081565b5060005b9392505050565b506000610162565b5060016106c35600000000000000000000000000000000000000000000000000000000000003e80000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000754204275636b73000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003544f54000000000000000000000000000000000000000000000000000000000026a042556c4f2a3f4e4e639cca524d1da70e60881417d4643e5382ed110a52719eafa0172f591a2a763d0bd6b13d042d8c5eb66e87f129c9dc77ada66b6041012db2b3';

      {
        // sign test
        final output = Ethereum.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));

        expectHex(output.encoded, expected);
        expectHexBytes(output.data, data);
      }
    });

    test('SignERC20TransferAsERC20', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasPrice = intToBytes(42000000000); // 0x09c7652400
      final gasLimit = intToBytes(78009); // 130B9
      const toAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      const token = "0x6b175474e89094c44da98b954eedeac495271d0f"; // DAI
      final amount = bigIntStringToBytes('2000000000000000000');
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        toAddress: token,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc20Transfer: Ethereum.Transaction_ERC20Transfer(
            to: toAddress,
            amount: amount,
          ),
        ),
      );

      // https://etherscan.io/tx/0x199a7829fc5149e49b452c2cab76d8fa5a9682fee6e4891b8acb697ac142513e
      const expected =
          'f8aa808509c7652400830130b9946b175474e89094c44da98b954eedeac495271d0f80b844a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec8000025a0724c62ad4fbf47346b02de06e603e013f26f26b56fdc0be7ba3d6273401d98cea0032131cae15da7ddcda66963e8bef51ca0d9962bfef0547d3f02597a4a58c931';

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expectHex(output.encoded, expected);

      // expected payload
      Uint8List payload;
      {
        final func = TWEthereumAbiFunction('transfer')
          ..addParamAddress(parse_hex(toAddress), false)
          ..addParamUInt256(amount, false);
        payload = func.encode();
      }
      expectHexBytes(output.data, payload);
      expectHex(output.data,
          'a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec80000');
    });

    test('SignERC20TransferAsGenericContract', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasPrice = intToBytes(42000000000); // 0x09c7652400
      final gasLimit = intToBytes(78009); // 130B9
      const toAddress = '0x6b175474e89094c44da98b954eedeac495271d0f'; // DAI
      // payload: transfer(0x5322b34c88ed0691971bf52a7047448f0f4efc84, 2000000000000000000)
      final data = parse_hex(
          "0xa9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec80000");
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        toAddress: toAddress,
        privateKey: key,
        transaction: Ethereum.Transaction(
          contractGeneric: Ethereum.Transaction_ContractGeneric(
            data: data,
          ),
        ),
      );

      // https://etherscan.io/tx/0x199a7829fc5149e49b452c2cab76d8fa5a9682fee6e4891b8acb697ac142513e
      const expected =
          'f8aa808509c7652400830130b9946b175474e89094c44da98b954eedeac495271d0f80b844a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec8000025a0724c62ad4fbf47346b02de06e603e013f26f26b56fdc0be7ba3d6273401d98cea0032131cae15da7ddcda66963e8bef51ca0d9962bfef0547d3f02597a4a58c931';

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded, expected);
      expect(output.data, data);
    });

    test('SignERC20TransferInvalidAddress', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasPrice = intToBytes(42000000000); // 0x09c7652400
      final gasLimit = intToBytes(78009); // 130B9
      const invalidAddress = "0xdeadbeef";
      final amount = bigIntStringToBytes('2000000000000000000');
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        toAddress: invalidAddress,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc20Transfer: Ethereum.Transaction_ERC20Transfer(
            to: invalidAddress,
            amount: amount,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expectHex(output.encoded, '');
    });

    test('SignERC20Approve', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasPrice = intToBytes(42000000000); // 0x09c7652400
      final gasLimit = intToBytes(78009); // 130B9
      const spenderAddress = '0x5322b34c88ed0691971bf52a7047448f0f4efc84';
      const token = '0x6b175474e89094c44da98b954eedeac495271d0f'; // DAI
      final amount = bigIntStringToBytes('2000000000000000000');
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        toAddress: token,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc20Approve: Ethereum.Transaction_ERC20Approve(
            spender: spenderAddress,
            amount: amount,
          ),
        ),
      );

      const expected =
          'f8aa808509c7652400830130b9946b175474e89094c44da98b954eedeac495271d0f80b844095ea7b30000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec8000025a0d8136d66da1e0ba8c7208d5c4f143167f54b89a0fe2e23440653bcca28b34dc1a049222a79339f1a9e4641cb4ad805c49c225ae704299ffc10627bf41c035c464a';

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded, expected);
    });

    test('SignERC721Transfer', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasPrice = intToBytes(42000000000);
      final gasLimit = intToBytes(78009);
      const tokenContract = "0x4e45e92ed38f885d39a733c14f1817217a89d425";
      const fromAddress = "0x718046867b5b1782379a14eA4fc0c9b724DA94Fc";
      const toAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      final tokenId = intToBytes(0x23c47ee5);
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        toAddress: tokenContract,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc721Transfer: Ethereum.Transaction_ERC721Transfer(
            from: fromAddress,
            to: toAddress,
            tokenId: tokenId,
          ),
        ),
      );

      const expected =
          'f8ca808509c7652400830130b9944e45e92ed38f885d39a733c14f1817217a89d42580b86423b872dd000000000000000000000000718046867b5b1782379a14ea4fc0c9b724da94fc0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000000000023c47ee526a0d38440a4dc140a4100d301eb49fcc35b64439e27d1d8dd9b55823dca04e6e659a03b5f56a57feabc3406f123d6f8198cd7d7e2ced7e2d58d375f076952ecd9ce88';

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded, expected);
      expectHex(output.data,
          '23b872dd000000000000000000000000718046867b5b1782379a14ea4fc0c9b724da94fc0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000000000023c47ee5');
    });

    test('SignERC1155Transfer', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasPrice = intToBytes(42000000000);
      final gasLimit = intToBytes(78009);
      const tokenContract = "0x4e45e92ed38f885d39a733c14f1817217a89d425";
      const fromAddress = "0x718046867b5b1782379a14eA4fc0c9b724DA94Fc";
      const toAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      final tokenId = intToBytes(0x23c47ee5);
      final value = bigIntStringToBytes('2000000000000000000');
      final data = parse_hex("01020304");
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        // tx_mode not set, Legacy is the default
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        toAddress: tokenContract,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc1155Transfer: Ethereum.Transaction_ERC1155Transfer(
            from: fromAddress,
            to: toAddress,
            tokenId: tokenId,
            value: value,
            data: data,
          ),
        ),
      );

      const expected =
          'f9014a808509c7652400830130b9944e45e92ed38f885d39a733c14f1817217a89d42580b8e4f242432a000000000000000000000000718046867b5b1782379a14ea4fc0c9b724da94fc0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000000000023c47ee50000000000000000000000000000000000000000000000001bc16d674ec8000000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000004010203040000000000000000000000000000000000000000000000000000000026a010315488201ac801ce346bffd1570de147615462d7e7db3cf08cf558465c6b79a06643943b24593bc3904a9fda63bb169881730994c973ab80f07d66a698064573';

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded, expected);

      // expected payload
      Uint8List payload;
      {
        final func = TWEthereumAbiFunction('safeTransferFrom')
          ..addParamAddress(parse_hex(fromAddress), false)
          ..addParamAddress(parse_hex(toAddress), false)
          ..addParamUInt256(intToBytes(0x23c47ee5), false)
          ..addParamUInt256(value, false)
          ..addParamBytes(data, false);
        payload = func.encode();
      }
      expectHexBytes(output.data, payload);
      expectHex(output.data,
          'f242432a000000000000000000000000718046867b5b1782379a14ea4fc0c9b724da94fc0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000000000023c47ee50000000000000000000000000000000000000000000000001bc16d674ec8000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000040102030400000000000000000000000000000000000000000000000000000000');
    });

    test('SignJSON', () {
      const jsonStr =
          '{"chainId":"AQ==","gasPrice":"1pOkAA==","gasLimit":"Ugg=","toAddress":"0x7d8bf18C7cE84b3E175b339c4Ca93aEd1dD166F1","transaction":{"transfer":{"amount":"A0i8paFgAA=="}}}';
      final key = parse_hex(
          '17209af590a86462395d5881e60d11c7fa7d482cfb02b5a01b93c2eeef243543');
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(result,
          'f86a8084d693a400825208947d8bf18c7ce84b3e175b339c4ca93aed1dd166f1870348bca5a160008025a0fe5802b49e04c6b1705088310e133605ed8b549811a18968ad409ea02ad79f21a05bf845646fb1e1b9365f63a7fd5eb5e984094e3ed35c3bed7361aebbcbf41f10');
    });

    test('PlanNotSupported', () {
      // Ethereum does not use plan(), call it nonetheless
      final input = Ethereum.SigningInput();
      final inputData = input.writeToBuffer();
      final outputTWData = TWAnySigner.plan(inputData, coin);
      expect(outputTWData.length, 0);
    });

    test('SignERC1559Transfer_1442', () {
      final chainId = intToBytes(3);
      final nonce = intToBytes(6);
      final gasLimit = intToBytes(21100);
      final maxInclusionFeePerGas = intToBytes(2000000000);
      final maxFeePerGas = intToBytes(3000000000);
      const toAddress = "0xB9F5771C27664bF2282D98E09D7F50cEc7cB01a7";
      final value = bigIntStringToBytes('543210987654321');
      final key = parse_hex(
          "4f96ed80e9a7555a6f74b3d658afdd9c756b0a40d4ca30c42c2039eb449bb904");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: toAddress,
        privateKey: key,
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: value,
            data: Uint8List(0),
          ),
        ),
      );

      // https://ropsten.etherscan.io/tx/0x14429509307efebfdaa05227d84c147450d168c68539351fbc01ed87c916ab2e
      const expected =
          '02f8710306847735940084b2d05e0082526c94b9f5771c27664bf2282d98e09d7f50cec7cb01a78701ee0c29f50cb180c080a092c336138f7d0231fe9422bb30ee9ef10bf222761fe9e04442e3a11e88880c64a06487026011dae03dc281bc21c7d7ede5c2226d197befb813a4ecad686b559e58';

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded, expected);
      expectHex(output.v, '00');
      expectHex(output.r,
          '92c336138f7d0231fe9422bb30ee9ef10bf222761fe9e04442e3a11e88880c64');
      expectHex(output.s,
          '6487026011dae03dc281bc21c7d7ede5c2226d197befb813a4ecad686b559e58');
      expectHex(output.data, '');
    });

    test('SignERC20Transfer_1559', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasLimit = intToBytes(78009); // 130B9
      final maxInclusionFeePerGas = intToBytes(2000000000); // 77359400
      final maxFeePerGas = intToBytes(3000000000); // B2D05E00
      const toAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      const token = "0x6b175474e89094c44da98b954eedeac495271d0f"; // DAI
      final amount = bigIntStringToBytes('2000000000000000000');
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: token,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc20Transfer: Ethereum.Transaction_ERC20Transfer(
            to: toAddress,
            amount: amount,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded,
          '02f8b00180847735940084b2d05e00830130b9946b175474e89094c44da98b954eedeac495271d0f80b844a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec80000c080a0adfcfdf98d4ed35a8967a0c1d78b42adb7c5d831cf5a3272654ec8f8bcd7be2ea011641e065684f6aa476f4fd250aa46cd0b44eccdb0a6e1650d658d1998684cdf');
    });

    test('SignERC20Approve_1559', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasLimit = intToBytes(78009); // 130B9
      final maxInclusionFeePerGas = intToBytes(2000000000); // 77359400
      final maxFeePerGas = intToBytes(3000000000); // B2D05E00
      const spenderAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      const token = "0x6b175474e89094c44da98b954eedeac495271d0f"; // DAI
      final amount = bigIntStringToBytes('2000000000000000000');
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: token,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc20Approve: Ethereum.Transaction_ERC20Approve(
            spender: spenderAddress,
            amount: amount,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded,
          '02f8b00180847735940084b2d05e00830130b9946b175474e89094c44da98b954eedeac495271d0f80b844095ea7b30000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec80000c080a05a43dda3dc193480ee532a5ed67ba8fbd2e3afb9eee218f4fb955b415d592925a01300e5b5f51c8cd5bf80f018cea3fb347fae589e65355068ac44ffc996313c60');
    });

    test('SignERC721Transfer_1559', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasLimit = intToBytes(78009); // 130B9
      final maxInclusionFeePerGas = intToBytes(2000000000); // 77359400
      final maxFeePerGas = intToBytes(3000000000); // B2D05E00
      const tokenContract = "0x4e45e92ed38f885d39a733c14f1817217a89d425";
      const fromAddress = "0x718046867b5b1782379a14eA4fc0c9b724DA94Fc";
      const toAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      final tokenId = parse_hex("23c47ee5");
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: tokenContract,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc721Transfer: Ethereum.Transaction_ERC721Transfer(
            from: fromAddress,
            to: toAddress,
            tokenId: tokenId,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded,
          '02f8d00180847735940084b2d05e00830130b9944e45e92ed38f885d39a733c14f1817217a89d42580b86423b872dd000000000000000000000000718046867b5b1782379a14ea4fc0c9b724da94fc0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000000000023c47ee5c080a0dbd591d1eac39bad62d7c158d5e1d55e7014d2218998f8980462e2f283f42d4aa05acadb904484a0fb5526a4c64b8addb8aac4f6548f90199e40eb787b79faed4a');
    });

    test('SignERC1155Transfer_1559', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(0);
      final gasLimit = intToBytes(78009); // 130B9
      final maxInclusionFeePerGas = intToBytes(2000000000); // 77359400
      final maxFeePerGas = intToBytes(3000000000); // B2D05E00
      const tokenContract = "0x4e45e92ed38f885d39a733c14f1817217a89d425";
      const fromAddress = "0x718046867b5b1782379a14eA4fc0c9b724DA94Fc";
      const toAddress = "0x5322b34c88ed0691971bf52a7047448f0f4efc84";
      final tokenId = parse_hex("23c47ee5");
      final value = bigIntStringToBytes('2000000000000000000');
      final data = parse_hex("01020304");
      final key = parse_hex(
          "0x608dcb1742bb3fb7aec002074e3420e4fab7d00cced79ccdac53ed5b27138151");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: tokenContract,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc1155Transfer: Ethereum.Transaction_ERC1155Transfer(
            from: fromAddress,
            to: toAddress,
            tokenId: tokenId,
            value: value,
            data: data,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded,
          '02f901500180847735940084b2d05e00830130b9944e45e92ed38f885d39a733c14f1817217a89d42580b8e4f242432a000000000000000000000000718046867b5b1782379a14ea4fc0c9b724da94fc0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000000000023c47ee50000000000000000000000000000000000000000000000001bc16d674ec8000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000040102030400000000000000000000000000000000000000000000000000000000c080a0533df41dda5540c57257b7fe89c29cefff0155c333e063220df2bf9680fcc15aa036a844fd20de5a51de96ceaaf078558e87d86426a4a5d4b215ee1fd0fa397f8a');
    });

    test('StakeRocketPool', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(1);
      final gasPrice = intToBytes(2002000000);
      final gasLimit = intToBytes(205000);
      final maxInclusionFeePerGas = intToBytes(1000000000);
      final maxFeePerGas = intToBytes(27900000000);
      const toAddress = "0x2cac916b2a963bf162f076c0a8a4a8200bcfbfb4";
      final key = parse_hex(
          "9f56448d33de406db1561aae15fce64bdf0e9706ff15c45d4409e8fcbfd1a498");
      final pk = TWPrivateKey.createWithData(key);

      // 0.01 ETH
      final amount = bigIntStringToBytes('10000000000000000');

      Uint8List payload;
      {
        final func = TWEthereumAbiFunction('deposit');
        payload = func.encode();
      }

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: toAddress,
        privateKey: key,
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: amount,
            data: payload,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://etherscan.io/tx/0xfeba0c579f3e964fbc4eafa500e86891b9f4113735b1364edd4433d765506f1e
      expectHex(output.r,
          'fb39e5079d7a0598ec45785d73a06b91fe1db707b9c6a150c87ffce2492c66d6');
      expectHex(output.v, '00');
      expectHex(output.s,
          '7fbd43a6f4733b2b4f98ad1bc4678ea2615f5edf56ad91408337adec2f07c0ac');
      expectHex(output.encoded,
          '02f8770101843b9aca0085067ef83700830320c8942cac916b2a963bf162f076c0a8a4a8200bcfbfb4872386f26fc1000084d0e30db0c080a0fb39e5079d7a0598ec45785d73a06b91fe1db707b9c6a150c87ffce2492c66d6a07fbd43a6f4733b2b4f98ad1bc4678ea2615f5edf56ad91408337adec2f07c0ac');
    });

    test('UnstakeRocketPool', () {
      final chainId = intToBytes(1);
      final nonce = intToBytes(3);
      final gasPrice = intToBytes(2002000000);
      final gasLimit = intToBytes(350000);
      final maxInclusionFeePerGas = intToBytes(1000000000);
      final maxFeePerGas = intToBytes(27900000000);
      const toAddress = "0xae78736Cd615f374D3085123A210448E74Fc6393";
      final key = parse_hex(
          "9f56448d33de406db1561aae15fce64bdf0e9706ff15c45d4409e8fcbfd1a498");
      final pk = TWPrivateKey.createWithData(key);

      final value = intToBytes(0);

      Uint8List payload;
      {
        final func = TWEthereumAbiFunction('burn')
          ..addParamUInt256(intToBytes(0x21faa32ab2502b), false);
        payload = func.encode();
      }

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        txMode: Ethereum.TransactionMode.Enveloped,
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        maxInclusionFeePerGas: maxInclusionFeePerGas,
        maxFeePerGas: maxFeePerGas,
        toAddress: toAddress,
        privateKey: key,
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: value,
            data: payload,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://etherscan.io/tx/0x7fd3c0e9b8b309b4258baa7677c60f5e00e8db7b647fbe3a52adda25058a4b37
      expectHex(output.r,
          '1fc6e94908107584357799e952b4e3fb87f088aeb66d7930a7015643f19c9e7f');
      expectHex(output.v, '00');
      expectHex(output.s,
          '2c56a0b70ff2e52bf374a3dcd404bc42317d5ca15d319f5e33665352eb48f06f');
      expectHex(output.encoded,
          '02f8900103843b9aca0085067ef837008305573094ae78736cd615f374d3085123a210448e74fc639380a442966c680000000000000000000000000000000000000000000000000021faa32ab2502bc080a01fc6e94908107584357799e952b4e3fb87f088aeb66d7930a7015643f19c9e7fa02c56a0b70ff2e52bf374a3dcd404bc42317d5ca15d319f5e33665352eb48f06f');
    });
  });
}
