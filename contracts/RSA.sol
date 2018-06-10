pragma solidity 0.4.21;
pragma experimental ABIEncoderV2;

import "./SolRsaVerify.sol";

contract RSA {
    using SolRsaVerify for *;

   /* struct Delivery {
        bytes data;
        bytes s;
    }*/

    //uint counter = 0;
    //mapping (uint => Delivery) deliveries;

    //Simulation of PKI (assumed to be available)
    uint constant e = 65537;
    //bytes e = hex"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010001";
    bytes modulus0 = hex"d4c6517398bac6e5a9a9f4986218d3ef467450e1557df5311cf3921c0027f5c2b2172103b17bf82e39be6459903baa1c4e97aeadfe314f9db4eaf3dd91446b259e28fba11421de48bcf18e859b24ed96602aace3329eed2c9beaf01b28d9694923dc67e10df22cbe3ea0fdb719b84f2e1c1c6c2cb849f2efa5a0ea885b9477a623da4440d67102a01e112b2cc0e6a135724493e2d8c8d3e2fcbbc9273189891ee730df80acb09e34b0f6ebb479210e6ccc69642b34b4e40de0f57641270315062d0148162e34f5fda7d6453f99ac124f2ce7ca5bd40df81a70708f3f3bcbbb860127b926c3d1ec303883223650c5621df7d92a38c2d9d7f1be944480f660871d";
    bytes modulus1 = hex"c9795040cd6abe21d6a2736d9f886fee63adb7b89dcfc25e1d2c068907ff37c56fcc6754fd1ceaabb8b948328ce370a08555cbe1b55e02b5c1d7e6f565465a813c1ce2fd398443d77859c3c1f572f7d13837926a8f390bf4852e3d4ecbdeab78d10853078c0fb51fbbb58dcd05d5d830d2e689cd63660529ff03814f8073111ff02eae6ced47d0e68718a185b3dc19fe28cedc51a20a19ed7f5f81b9ffda445af548908191c4e316e55f62594669c3da47b467909a2ac34bece023f683d8b2ea4f8aa55908b249e95eb6d13fef5accc933bf9a7de8af1a345137bfc2161f55aa8a72c7d26a70ada4a9e120a0c3d0ca66cbbce07cd73aae1f581861f111630307";
    bytes modulus2 = hex"bbb6d2fac942df2aa6447789d26b8b52be68c2119bce5cdb7a7a456e3254a616cb65235958ae93a40a5904280096fd4c853bfc1a8d73eefbee570b2b52aea2e3d3ee06b2bac6dc460a2f81911d54d92f35f557b317b3a108d71c626a83b17a9270a848b5c343bb0275b69f1fa33c7cfd54ca5a62640dc7f2913b6a46c43390610d0325bec8071d9aec0ccd673c7579fe83162c0af0062a5485d971f05412d2fbbfc39b5c443d88d7ffc26c014bd8d56d4b1950b136e60c94cbe38defd5ce2ae44b49f111373b28b76ec205ae8ca29136c432bc0c2d80d1c005b20782d031642c2b15946f5ee98a9d9c3ac8fea07fd99b77ce370efd613ce955d0808cec5e4ee9";
    bytes modulus3 = hex"cc970af3c9820aed6e810f453ec092a6d0e54ac9f9f772282ba660bbd45bf9301a8e3e0baff5e7d5480ca51d68fa7728c61163d24fab17bea6d3f5c1ef7ea28363642596c9fe6c6b229be7258474236980596bfc8cc107b0f9f0df648edf3e7ef2ad67e298cf505a9757a8dea70fb19999fc631fb5350519bb71e9a7a1b57f452aa8f43ac27debd7e3130c916c4f207ca5427509a42ef0b2a634e2bdfdb22d982abf252ae3227ccb24bcb0c770a0b86944383ca4e920b77b426fa26317844ad1e7e725e78766acf2de06657ab638fb1d02752f50569b9ff3cfb58c43fc954d8b3f796165794d7ecf7ed710a967434748f55b3259e342004a2e05d8c4170943d1";
    bytes modulus4 = hex"d36db9bb19a21123a52b4254bb0acb3e54f4742a69793a40f3907ceef45279d10f499bed1d014ea7ab814cd67dc6997cb51f401cb011d33f4b8282429d44da1f85aecfc07b2dbc44c1033c2238b0bf31b6a734b24597e38e6ea741fa20732e9295b18ac4294a197c1c4ecd88be1f7809c22a26375fc9f3d955b70907b29a2399e4eedaf9d9ba1e07692df441952f87e0b8e8c8dd1d6d1c58a530f6c5f28d2abfe9d52967405c35049663dacfe8a5ca1195729b47c58dd024b1fc3dd8413955cd4b9781a20170e0baec6c701a6f5268a72619e87d923ea9e46d1139345c295e85982ed17b2a41881cd90deed17f3d7c32e06e511727dca0cde6e1552839a6c35d";
    bytes modulus5 = hex"c4e9c21356185a76288c3377e43e0e12c523c522fe724d66a23f017305942086d9fcea9b280260db0b9fad07be29fa5a5707994cb2ddb5ce0d27da14484376a25ae5248489ebb23a0393521f8773ad5a865865b071fb23a4a3b903ccdc1b9539203df0c3cc72fbb056192c8194582312241279dccc774233fd6bed41e38f76c61d6f4282096a849d0279b4d6288666ffdd40d090711eb423a9ab4190c5db5c0cf477cf76126c63f5b480892fb666d3ffd1a71d069b9a63db83db88f7ee37f43a50ef50097cf469b1beab3f42f3da6767eee80a92a085172db861e225cff635a978efd53700a1cfde581cbc99ee00fe66c07e7b1c5186a941169fcc2cc75aa7ab";
    bytes modulus6 = hex"e55221411440a618e1408915a741f53137609e68d16af0b4dfe820377a3648658424d228bd2e6fda57feaaeb2892cf6b5f5a23601dffd209ac29318a40a6bedd87c335eae2bb71a87dec157cd50d808783461534caf4f1804cc37ba3cc423e5ef8359deb90b0dacf0781fd60c1abe8e9c20600112cccfb459a4ef1830d24920f88a0bfe9fd4ccaa2cb48a3d1eb7743122b6d76fd72c9583d78786250245ba73740fd304d7a8d9b88db67c873b5d9b976bf2e11e76bd317eace5288829bf2170913b49de171aecbdcea0e8d0b8fa306b00cf02e8b5d8d248358dedf895b3211130eb6b6c6a522930198aa169e1f1a48c3c394b7a41de548dc1d5b5a793539f773";
    bytes modulus7 = hex"c82177827ed4d0e9a0321873bc73c5e77c55fb99b691ea2a3e526cfbe42b8d9e4bb1b4b0a2b20205937f47e92e9b5054daf2a502826dc7e75d189a6d4c905ae8af1342ad3e4ce1a48c33213376b2d2e75cb13516d02f395c5b270eb8c5a75ba973225f399b481a19de8f694bf2f4d0b4e6c34ec0a590e23ab68d6784e934f3cb2a54ea93ef80f30c161824a78c20302169d0022767000ac076aeb3c81991ef95e455cc7e841b6f8108b62ad3f9812e3cd712753cef4a842a9328777e1826f885f438274bbe0846663f3e622d36fe84e3ec3acd0e514b89a6368a78d69e3b57932f2b01f02fe6386ef29939a8063c7551edbd3a047cdd9c6358414444baccda4f";
    bytes modulus8 = hex"e698293a112f0b29fd1952d8bdc156c05ccdc1f6f404f471cb7697af554be5ba227c32f5ffca64548325d66478efaf0a8310e51802cfa2e815ffa840625a362c38c4a54f4495934240afa4d67bfdb8f0736981109bc16987007899f61ecc0c6b6b5c7348f9434196b8843bbf9514c1a35b4c2d1982045bf8ee6c422e73c00ab97aa1448a8d4e438d5e379727d88b3a77a955e54a1edc49f0bd9644fef6148ac376ba7000273caf3d52301a92ba378c0611ed6863af31287969397b2254c4c360a63cc6b085f2f8cecd8c5211ec20da7cb4390d3d6a8a602b1b09a1598510091800d77a7879253a6672dd44d34b7a3bd60320d4bace03a5c5c53380ef3d466d43";
    bytes modulus9 = hex"c573703c11fa59d7c306de55edd5db78e77549c71106f289aed98bf0196360ea788ae351c499b572297f07b5b94a750ebe15d33b80e155e590ee13c97ac79feb043f280c19c125478d67f2312466a5ceb123c41ac238f168a1c4a11470b55a214268fc309776c21d8f569cb3a93721973034f666437058fc7f43a2c949074c34b9060c6faec3a8ebbd923f276d38941a38267b0890879be43a9d0d6cb4e38569f80ed24061f9b2feb985db302e7bcc9e594fdbb3a3ec17cde2637de87a57ba86985153c69f78f174426b6278a21eed8bf097a3857499f2ad7f78e26b32a1323f28bc654310219a9cad54c950f58f4ff6890139a34734330c96d9379f4995b0af";

    //the message and signatures are included to measure the verification costs separately
    bytes message = hex"7b0a2020226f70656e223a207b0a20202020227072696365223a2039353931372c0a202020202274696d65223a207b0a20202020202022756e6978223a20313438333134323430302c0a2020202020202269736f223a2022323031362d31322d33315430303a30303a30302e3030305a220a202020207d0a20207d2c0a202022636c6f7365223a207b0a20202020227072696365223a2039363736302c0a202020202274696d65223a207b0a20202020202022756e6978223a20313438333232383830302c0a2020202020202269736f223a2022323031372d30312d30315430303a30303a30302e3030305a220a202020207d0a20207d2c0a2020226c6f6f6b7570223a207b0a20202020227072696365223a2039363736302c0a20202020226b223a20312c0a202020202274696d65223a207b0a20202020202022756e6978223a20313438333232383830302c0a2020202020202269736f223a2022323031372d30312d30315430303a30303a30302e3030305a220a202020207d0a20207d0a7d0a";
    bytes signature0 = hex"8d1e86a13bfd3ddd9512119d0ab638751b28c779eb30991e9459e4b18f53e8887656d2a76ae36423e9329fe498abbb6a8672ccc9f1f5e13eefeda50b59f80b6fc456b6a41882bc42753ad3eae5e082764ef142f6f69733b10dff36e10f71ddef0a36c1d52c36f2240ae155e9673d9a13dd730484bc71237dffcf6ef26d6a30bbf3ae2ea3548bf28ccdb4093944430b2203ae5d55cdb4e4a33ed0c611f8f239edd2512f589c6c193a0257bc1ac8e0665a7f838b47517a08d72510ec231bf3674c4a9a7fdb38b235e0f2930513da55246dcf0ede9e2af8e20e39e9b75c96d63669da155f6011ca69838c8d9aa9a98af3cb9852fa7ab986c33d263f47a7e61ef0cd";
    bytes signature1 = hex"9fa5c2afd32e3576ba97de50982d4b5925f6cb7a34d1f0f503f13a398f437f6961919ed4087d94dd02a5fbb08241879d218d2f5f39e0291724ba1c7b8d771176afa68f49d712a203d79c80e01cc08ce2bef8bf5802d0f0c668492a8e9f86d76f674e581f3fdb9449fe7185e644403fbbdc9b36a9842f5974cadaaa1ad4606092a6e1afc05b80c6be976b7514f3cee531c3a5fb36428945f417a12d00d0a640bbe1ee9ed1af5d8730a839d9853d9a538f7f68079de6df4b69c34b04b7cda0504f36162496cf44814e0015eee435792de6469e3e2eefee95152e9e4a1d01f86481081eb73cdc76482560c3ba6107d9c96e83a4ee5cf2772e6af71a219ac7ec101b";
    bytes signature2 = hex"b9738122af1cc10aa123fce1e7f5077ad601abb7d7a4d5d7fa51acc244ae5e6f6656deea9e309d80177a9a473657a1539514535a1eaee43f3ffe7100f4b884be4df2b1d5fde2fb4de32d992b4d057b5abc3a54ba944a25282dd647c0fbaed2114106e103dbfe1bfded840c297e15b166af146c396203c7e684f7e6743337ec458eee52ec1ecf304509146a4ed03dc54c65a32a9a643d883c6391dc2f908a67e31c52755a2fbfef976b949c855c471928ee08d9b7f7cddae24d9bd8417871915399205e8b840155d41de2ce2299207afa76969d2f32119e8aad569bbacf7b3eb05d5837e5db264d648c9957a91f57f176d4d7d8933b82632a0d7a0f97ed0b2586";
    bytes signature3 = hex"20ee0a8ded66f5738cc53cf5221a7d9cd9c32203d82776ab0a9a4de722e81c2389a1fb453654a5ba70e4100ec6e5e413640b16e62d5ad27ebd679afa182163265b1213d6bb19e666cfe2f2859a3f40b9c5b921957b71f5a13ad6e49f0cdc20aa6feae1254c90e2aa1aaa5e75afd81cbe89d23f3013664f580702e460f7126b068c4c6256a30376c5e89befced70b256cd547c500cd410438ff6e99f79c6306019dd7eff2f94035ae1f770ff7a66d0597ba666e53673d2d6e08d74a1951595fc63ec04d950d6dcc20ffff461846e92ff1350908ce3f5b908f9eded28ed1f94efd6951c38d8d6fad0e430c810a865a4d98624a44eac3ad60735c65c71cdd8e667d";
    bytes signature4 = hex"a7bf67237a1abd4a492330b6e29f78143268f8a3f5866925f2c142225b22c9bf1c3534747e3311dff0f2ecf9affff133b5f493aa17e847d0cd67ec690acccf53626466815c17ebcc99d96cd2e5ec9b8eed85b709d649901788a9b73bd7a1aa67a9fb57fd81434d2e43a8665863f9dc02b8e02f413c455304d6eb3ad9a082cb4063ff6669755fe5a2a0e990dd90e42cfb16e68115b7f6959068adb273ce9fcb3b6f2f3753fc54ae6a1d16dc59b5a60203e08e6a50b0f95e8ff82d2f27594dd48356d4ae221b188ae968ded5ce2bfd488122dd855fedde3ce67512602f42d9fd7970ed064307f7a5c601a19447e24a0970fd791f38f8b764e138f16a5c5d3dc826";
    bytes signature5 = hex"bf9e42ad43c609ab8b17babc2c0f187a16f0c1e835fbb9678c38111e9ae95dcef61c5195d1e9511284c54931aec89cad43cb447e62f9ae9261ad57ccbe02bd8df44d73612691ca8e829411f3f48f63b3d1a450168c90bb7f507e2cc8168392e2d68f6b927bac428f251f138831b98140ab131fb06e7cc41f6f3f48c0ed1000bf5181940a68f606e121f31235aeda9ca05ddd259b50f8994a4311612c485a3ae99a4480f5bf88a35e0998c0083a04e0474864802b6008212e752a46632417e6e503ac174a4c93a9f2673c365eff122a58ca2bf928876b40fcc63f625e0509fed8a540544ba8df36e0e0c5a27863377c5cf8dd51521d5ea781e0ab247c1392f206";
    bytes signature6 = hex"8614e07b6c2937020c85918e1b7447325da4731c29b1d12582acdb8445824db7505db266f2922fbd1778fc7ea2e9f2178431f1dbbfc5bef973b09a7a971b874781463ab8911a4d41e2c7e78bd536b62cb610cb6660de4160501097078f090b79a50b70cf90ca556875a7cf018e9f6b978accb5628a2193e79c6edef1ee5544c62ba2d3c22dc421db9c660af98053c0bf065fb30905d9a854f955a1a668a932a2eafb527682b9318f08ea56d1596369c8670dd6ef27a7651030f0fa30770d7a920616ecd3c84c0e5e56b02f2c47ce2f4ecf6ff290a1f44e1db465b11716345147198f69e7b8fc01bc3819df5e50f1411cf9391b0d2e2c459cafc0f6e9efbc0cde";
    bytes signature7 = hex"986bf1806a8a93cc1c2622a2ba57776868ae2674b66ad0c95d83f9709184b97c62bdd137e857eb4940694c38728bfb8e2b3bc0b911660e4bd57be7338942b834c450a655a07e24c98dba4033991ba9bc015bad3b9d459e94b26d23e7eda4f98e9a558f85a762e89b629fcc69d5d21f2fab20b0efe1cd4ded601a1bcc22a5ec83d871572e0ccdc37f87364e4b25df223d8da9d0881e022404640f1dfad66ad6293d10ee0c2a8a5d993d69a2cd31d7d6feac2653cf18440da91fb7f6666129543a0c13cc05ee072d39ac62bd5354a6be4731aacf3d87a5135ada81500410a7d79b25dd750ec60ea262aea13e0841fd1b054bbb4f977ba2dbcdd499041b2bc764c2";
    bytes signature8 = hex"97c6c6ab63bf7f1051219e67642ef4d2c3f61610e438ebd72da51af51bfa82d27fa764341139d42d79eba729a5c41d27b7456da00f7a853324659e58d35c577f11e366f3a04f88527aa6dff1b5276812ea2628544a97125cc460f44133239ac76433b3e7f1ce6e85d90709e76421a4e8e39c1e1eebeb116b49a66fe527d43a50f9fd86018382d2ebdd85396a84521dd8f3c74a9f250631c7a6711bd97b3e18ee4e65f733f6a8a3a17c31c140906307846f860fd2e3435a28ea2476c2a730e2df53570de5686cf708a159776ac8108cffde0c1b3702d862fd391e5edf0d7338cb80492c740e05c4ec6f2d51287578bc40b79bd27ab412b0675fcf434bbb454519";
    bytes signature9 = hex"a6a04b4add67db244b4f70dfc222ea121b341316bc997d985719ab1fd543fbb6a5734341534367786563b17d7c7daae499a3d303eef818328fae71672a1e83261f9c17f04a92facc2dda05bfca1948682d48d90711a1b72b0db2766b62bcbf97a7a8255aa62149a4bc9eaba579fa7863f7f7b9ba2b7997cdd5fea0fee7ff5b5535597fba6619b22e0aa9224a4bc28ad232f72c1b5a7e9230bfdc4899cb35bb387fe93cce69f4b05e173e7e855cd4ab9b0d7b40ed8fb28cd7df3b7dd59e99fb7a8afe0691fdddc38563502cfd16253e16ea49325cf13e23e1b5fbd1a49d8288b64fb31add5e6e8f62098d97a4a36a42ad516276dc03e4f7a773f15d2f072722a6";


    function testPSS(bytes _data, bytes _s, bytes _n) returns (bool) {
        SolRsaVerify.pkcs1Sha256VerifyRaw(_data, _s, e, _n);
    }

    /**
    This method is used to measure only the transaction costs
    */
    function doNothing(bytes _data, bytes _s) returns (bool) {
        revert();
    }

    /**
    This method is used to measure only the verification costs
    */
    function sendNothing() {
        uint n = 10; //NOTE: change this parameter to set the amount of signatures that will be verified

        for (uint i = 0; i < n; i++) {
            SolRsaVerify.pkcs1Sha256VerifyRaw(message, getSignature(0), e, getModulus(0));
        }
    }

    function verify(bytes _data, bytes _s, bytes _n) returns (bool) {
        return SolRsaVerify.pkcs1Sha256VerifyRaw(_data, _s, e, _n);
    }

    function getModulus(uint i) view internal returns (bytes) {
        if (i == 0) {
            return modulus0;
        } else if (i == 1) {
            return modulus1;
        } else if (i == 2) {
            return modulus2;
        } else if (i == 3) {
            return modulus3;
        } else if (i == 4) {
            return modulus4;
        } else if (i == 5) {
            return modulus5;
        } else if (i == 6) {
            return modulus6;
        } else if (i == 7) {
            return modulus7;
        } else if (i == 8) {
            return modulus8;
        } else if (i == 9) {
            return modulus9;
        }
    }

    function getSignature(uint i) view internal returns (bytes) {
        if (i == 0) {
            return signature0;
        } else if (i == 1) {
            return signature1;
        } else if (i == 2) {
            return signature2;
        } else if (i == 3) {
            return signature3;
        } else if (i == 4) {
            return signature4;
        } else if (i == 5) {
            return signature5;
        } else if (i == 6) {
            return signature6;
        } else if (i == 7) {
            return signature7;
        } else if (i == 8) {
            return signature8;
        } else if (i == 9) {
            return signature9;
        }
    }

    /*function getSlice(bytes data, uint i, uint n) public returns (bytes) {
        uint size = data.length / n;

        bytes memory res = new bytes(size);
        for (uint j = i * size; j < (i+1) * size; j++) {
            res[j - (i * size)] = data[j];
        }
        return res;
    }*/

    /*
   function verifyStored(int[] indexes) returns (bool) {
        for (uint i = 0; i < indexes.length; i++) {
            return true;
            //return SolRsaVerify.pkcs1Sha256VerifyRaw(_data, _s, e, getModulus(i));
        }
    }

    function test(uint i) returns (bytes) {
        return deliveries[i].data;
    }

    function store(bytes _data, bytes _s) returns (uint) {
        Delivery memory d = Delivery(_data, _s);
        deliveries[counter] = d;
        counter++;
        return counter + 1;
    }
*/

}
