import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/TheOpenNetwork.pb.dart'
    as TheOpenNetwork;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerTheOpenNetwork', () {
    const coin = TWCoinType.TON;

    test('SignMessageToTransferAndDeployWalletV4R2', () {
      final input = TheOpenNetwork.SigningInput(
        messages: [
          TheOpenNetwork.Transfer(
            dest: 'EQDYW_1eScJVxtitoBRksvoV9cCYo4uKGWLVNIHB1JqRR3n0',
            amount: intToBytes(10),
            mode: TheOpenNetwork.SendMode.PAY_FEES_SEPARATELY.value |
                TheOpenNetwork.SendMode.IGNORE_ACTION_PHASE_ERRORS.value,
            bounceable: true,
          )
        ],
        privateKey: parse_hex(
            "63474e5fe9511f1526a50567ce142befc343e71a49b865ac3908f58667319cb8"),
        expireAt: 1671135440,
        walletVersion: TheOpenNetwork.WalletVersion.WALLET_V4_R2,
      );

      final output = TheOpenNetwork.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // The same Cell can be BoC encoded differently.
      // This encoded BoC equals to:
      // te6ccgICABoAAQAAA8sAAAJFiADN98eLgHfrkE8l8gmT8X5REpTVR6QnqDhArTbKlVvbZh4ABAABAZznxvGBhoRXhPogxNY8QmHlihJWxg5t6KptqcAIZlVks1r+Z+r1avCWNCeqeLC/oaiVN4mDx/E1+Zhi33G25rcIKamjF/////8AAAAAAAMAAgFiYgBsLf6vJOEq42xW0AoyWX0K+uBMUcXFDLFqmkDg6k1Io4hQAAAAAAAAAAAAAAAAAQADAAACATQABgAFAFEAAAAAKamjF/Qsd/kxvqIOxdAVBzEna7suKGCUdmEkWyMZ74Ez7o1BQAEU/wD0pBP0vPLICwAHAgEgAA0ACAT48oMI1xgg0x/TH9MfAvgju/Jk7UTQ0x/TH9P/9ATRUUO68qFRUbryogX5AVQQZPkQ8qP4ACSkyMsfUkDLH1Iwy/9SEPQAye1U+A8B0wchwACfbFGTINdKltMH1AL7AOgw4CHAAeMAIcAC4wABwAORMOMNA6TIyx8Syx/L/wAMAAsACgAJAAr0AMntVABsgQEI1xj6ANM/MFIkgQEI9Fnyp4IQZHN0cnB0gBjIywXLAlAFzxZQA/oCE8tqyx8Syz/Jc/sAAHCBAQjXGPoA0z/IVCBHgQEI9FHyp4IQbm90ZXB0gBjIywXLAlAGzxZQBPoCFMtqEssfyz/Jc/sAAgBu0gf6ANTUIvkABcjKBxXL/8nQd3SAGMjLBcsCIs8WUAX6AhTLaxLMzMlz+wDIQBSBAQj0UfKnAgIBSAAXAA4CASAAEAAPAFm9JCtvaiaECAoGuQ+gIYRw1AgIR6STfSmRDOaQPp/5g3gSgBt4EBSJhxWfMYQCASAAEgARABG4yX7UTQ1wsfgCAVgAFgATAgEgABUAFAAZrx32omhAEGuQ64WPwAAZrc52omhAIGuQ64X/wAA9sp37UTQgQFA1yH0BDACyMoHy//J0AGBAQj0Cm+hMYALm0AHQ0wMhcbCSXwTgItdJwSCSXwTgAtMfIYIQcGx1Z70ighBkc3RyvbCSXwXgA/pAMCD6RAHIygfL/8nQ7UTQgQFA1yH0BDBcgQEI9ApvoTGzkl8H4AXTP8glghBwbHVnupI4MOMNA4IQZHN0crqSXwbjDQAZABgAilAEgQEI9Fkw7UTQgQFA1yDIAc8W9ADJ7VQBcrCOI4IQZHN0coMesXCAGFAFywVQA88WI/oCE8tqyx/LP8mAQPsAkl8D4gB4AfoA9AQw+CdvIjBQCqEhvvLgUIIQcGx1Z4MesXCAGFAEywUmzxZY+gIZ9ADLaRfLH1Jgyz8gyYBA+wAG
      expect(output.encoded,
          'te6cckECGgEAA7IAAkWIAM33x4uAd+uQTyXyCZPxflESlNVHpCeoOECtNsqVW9tmHgECAgE0AwQBnOfG8YGGhFeE+iDE1jxCYeWKElbGDm3oqm2pwAhmVWSzWv5n6vVq8JY0J6p4sL+hqJU3iYPH8TX5mGLfcbbmtwgpqaMX/////wAAAAAAAwUBFP8A9KQT9LzyyAsGAFEAAAAAKamjF/Qsd/kxvqIOxdAVBzEna7suKGCUdmEkWyMZ74Ez7o1BQAFiYgBsLf6vJOEq42xW0AoyWX0K+uBMUcXFDLFqmkDg6k1Io4hQAAAAAAAAAAAAAAAAAQcCASAICQAAAgFICgsE+PKDCNcYINMf0x/THwL4I7vyZO1E0NMf0x/T//QE0VFDuvKhUVG68qIF+QFUEGT5EPKj+AAkpMjLH1JAyx9SMMv/UhD0AMntVPgPAdMHIcAAn2xRkyDXSpbTB9QC+wDoMOAhwAHjACHAAuMAAcADkTDjDQOkyMsfEssfy/8MDQ4PAubQAdDTAyFxsJJfBOAi10nBIJJfBOAC0x8hghBwbHVnvSKCEGRzdHK9sJJfBeAD+kAwIPpEAcjKB8v/ydDtRNCBAUDXIfQEMFyBAQj0Cm+hMbOSXwfgBdM/yCWCEHBsdWe6kjgw4w0DghBkc3RyupJfBuMNEBECASASEwBu0gf6ANTUIvkABcjKBxXL/8nQd3SAGMjLBcsCIs8WUAX6AhTLaxLMzMlz+wDIQBSBAQj0UfKnAgBwgQEI1xj6ANM/yFQgR4EBCPRR8qeCEG5vdGVwdIAYyMsFywJQBs8WUAT6AhTLahLLH8s/yXP7AAIAbIEBCNcY+gDTPzBSJIEBCPRZ8qeCEGRzdHJwdIAYyMsFywJQBc8WUAP6AhPLassfEss/yXP7AAAK9ADJ7VQAeAH6APQEMPgnbyIwUAqhIb7y4FCCEHBsdWeDHrFwgBhQBMsFJs8WWPoCGfQAy2kXyx9SYMs/IMmAQPsABgCKUASBAQj0WTDtRNCBAUDXIMgBzxb0AMntVAFysI4jghBkc3Rygx6xcIAYUAXLBVADzxYj+gITy2rLH8s/yYBA+wCSXwPiAgEgFBUAWb0kK29qJoQICga5D6AhhHDUCAhHpJN9KZEM5pA+n/mDeBKAG3gQFImHFZ8xhAIBWBYXABG4yX7UTQ1wsfgAPbKd+1E0IEBQNch9AQwAsjKB8v/ydABgQEI9ApvoTGACASAYGQAZrc52omhAIGuQ64X/wAAZrx32omhAEGuQ64WPwJiaP4Q=');
    });

    test('SignMessageToTransferAndDeployWalletV5R1', () {
      final input = TheOpenNetwork.SigningInput(
        messages: [
          TheOpenNetwork.Transfer(
            dest: 'EQBe6DtCpJZe8M4t-crMXe93JlEYgSl30S5OUuMSLOfeQfBu',
            amount: intToBytes(10),
            mode: TheOpenNetwork.SendMode.PAY_FEES_SEPARATELY.value |
                TheOpenNetwork.SendMode.IGNORE_ACTION_PHASE_ERRORS.value,
            bounceable: true,
          )
        ],
        privateKey: parse_hex(
            "3570e35f54cfb843f2cfaf2b8cae7ceeb7b32225d7dbbd86f611056d74d9073e"),
        expireAt: 0xffffffff,
        walletVersion: TheOpenNetwork.WalletVersion.WALLET_V5_R1,
      );

      final output = TheOpenNetwork.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Successfully broadcasted: https://tonviewer.com/transaction/Q32uRBqVprzNzc6iVgwxPeJPE92Fx21dfsqrHnCh5Ss=
      expectHex(output.hash,
          '437dae441a95a6bccdcdcea2560c313de24f13dd85c76d5d7ecaab1e70a1e52b');
      expect(output.encoded,
          'te6cckECGwEAA2sAAkWIACm9HPyVOpjCNOG6nbf+EwCONRHHpeMQsIlCoWNKhUaaHgECAgE0AwQBoXNpZ25///8R/////wAAAACACOfqY7L3l3aKc58eNxuJTaeH/fgBw2aG0coM+hjDpjWhJKbYKmsAD8v054HYSuO6vN3bQnV5U19BhsGfe1MDoAUBFP8A9KQT9LzyyAsGAFGAAAAAP///iKrcG+d35KaMMtuxik4jqNofFL51Mu1f8Qf19onqsDlyIAIKDsPIbQMWBwIBIAgJAWJiAC90HaFSSy94Zxb85WYu97uTKIxAlLvolycpcYkWc+8giFAAAAAAAAAAAAAAAAABFgIBSAoLAQLyDALc0CDXScEgkVuPYyDXCx8gghBleHRuvSGCEHNpbnS9sJJfA+CCEGV4dG66jrSAINchAdB01yH6QDD6RPgo+kQwWL2RW+DtRNCBAUHXIfQFgwf0Dm+hMZEw4YBA1yFwf9s84DEg10mBAoC5kTDgcOIXDQIBIA4PAR4g1wsfghBzaWduuvLgin8NAeaO8O2i7fshgwjXIgKDCNcjIIAg1yHTH9Mf0x/tRNDSANMfINMf0//XCgAK+QFAzPkQmiiUXwrbMeHywIffArNQB7Dy0IRRJbry4IVQNrry4Ib4I7vy0IgikvgA3gGkf8jKAMsfAc8Wye1UIJL4D95w2zzYFwIBIBARABm+Xw9qJoQICg65D6AsAgFuEhMCAUgUFQAZrc52omhAIOuQ64X/wAAZrx32omhAEOuQ64WPwAAXsyX7UTQcdch1wsfgABGyYvtRNDXCgCAAAAP27aLt+wL0BCFukmwhjkwCIdc5MHCUIccAs44tAdcoIHYeQ2wg10nACPLgkyDXSsAC8uCTINcdBscSwgBSMLDy0InXTNc5MAGk6GwShAe78uCT10rAAPLgk+1V4tIAAcAAkVvg69csCBQgkXCWAdcsCBwS4lIQseMPINdKGBkaAJYB+kAB+kT4KPpEMFi68uCR7UTQgQFB1xj0BQSdf8jKAEAEgwf0U/Lgi44UA4MH9Fvy4Iwi1woAIW4Bs7Dy0JDiyFADzxYS9ADJ7VQAcjDXLAgkji0h8uCS0gDtRNDSAFETuvLQj1RQMJExnAGBAUDXIdcKAPLgjuLIygBYzxbJ7VST8sCN4gAQk1vbMeHXTNB8Ui06');
    });
  });
}
