const bgr = require("../verify");
const web3helpers = require('../../web3helpers');


switch (parseInt(process.argv[2])) {
    case 1:
        one();
        break;
    case 2:
        two();
        break;
    case 3:
        three();
        break;
    case 4:
        four();
        break;
    case 5:
        five();
        break;
    default:
        console.log("Destination unknown");
}

function one() {
    const m = web3helpers.readfile();

    const x = "0x"+"040bb2f2151be77a766ffa74256a1f778bc45c4027d7ff6de44c14d77fc33a17efb6b18059af36d3a3c9b9db710412b25ad0393901f9877bf48bb95dbcc9b0a5679a52a92d32aac97d5f9b7e242c87049e528c31f229b3b2e115c80a0699ae25cd5564ba0056cc897126cba89221a2a6e516553c591f3406f05267513db8434d3ecf336bfc28b6998c12b5f07d96597ac32ea81a8e5f71b3ad37d4bda7ebd90a8c6fb2b27be797ac1ed1719f9978a55b98d194c55886b0db3dde6f8933632d0466a52a30944c877bcff04f79862a377d4779d5fcf69590bbedc39aaf0c1c2a3b29cbcd2e6c826ce4fb1f6ade94492ff8640412277e27ae86e7527d05da9c4d58";
    const h = "0x"+"382c197defb54043b80875be1de7fa4bb210c183e2e274c25296d9de5da09df1";

    const b = [
        false
    ];

    const r = [
        web3helpers.numToBytes16("39591481140754388166925179461058716055"),
    ];

    bgr.measure(m, x, h, b, r)
}

function two() {
    const m = web3helpers.readfile();

    const x = "0x"+"53e1c8839136a43aead701a299335bdd2dca8c6d85ef75d31f443a5da281185cb6fb8f9a109baf82232679a4686a647d6cb01ba0faddcf4164592389c67ba94118a65a8196d83f3182f8580b557ba9e9bbe4fad3923ff543023161dff5bcd5608d5a8e2c566f12e423fa6eb2b9e82b0d0f7655e5a3848f578d65833bfa7bcf70ae83842704cc844190238d34d570237336a6f29c0e9643211c7baef693077a9bec7ea137924ec7691508383f2200e90092efeeb1077f1ec88ac7eb6198ab646d5da1ea82e15d72b72afdb854173c8eb149a06dd041b6a805b876fdc61352fc77bda0ece20d109342bfda3389e7e7de76d432967f6ef8deb6c27135fc4831992d";
    const h = "0x"+"0ecc289f77e297ed38886a0b987356f3e6a567afd9df0515db12f956fb5c61d3";

    const b = [
        false, false
    ];

    const r = [
        web3helpers.numToBytes16("319018141551120600149495584345529632631"),
        web3helpers.numToBytes16("290836363966245791631489528113304322240"),
    ];

    bgr.measure(m+m, x, h, b, r)
}

function three() {
    const m = web3helpers.readfile();

    const x = "0x"+"0db96f18e5aba34c51e896781c72a386df32f8e181ced4dc4ed032d285a6c06f4104726ad5d169b03506b968d64f3fd5f237e2f38ed519dfbc90bfd7456163ce709ba210b16aeed72c24396245ea0816153667d2bdc66d9f7e5b4fbb83a53a413893683da7dcce99c7e5750d39f2efca76b01ff742b6ec5d4d1dd666f866470a8e7e8e2add243d7cb64edbc612df3b4eefb965c6650ff0598b633317edbf252aa56f8ed74e590186390422000f1acb030c048758fb855b246d95b9ddee5f0a6cbd2f7f2c6afa29a9358bf293b8967a46d640c3c723755d4bcf3991723796ea3d6c5b5ada594a61764858bfd7a5664e12418486a08620da0b98234e9daa2301b3";
    const h = "0x"+"cc7fb272bd2044b45eec38feb347388124f2f07346a9d1ae980de19dd5e786e5";

    const b = [
        false, false, true
    ];

    const r = [
        web3helpers.numToBytes16("148188578693127824421321938929073000890"),
        web3helpers.numToBytes16("143289089384635942834491644280063968009"),
        web3helpers.numToBytes16("196668985635432548435435474890493737120")
    ];

    bgr.measure(m+m+m, x, h, b, r)
}

function four() {
    const m = web3helpers.readfile();

    const x = "0x"+"6cd68713c07ee0c1c825e021b25f09e8f8c294d116fb39cbf316a8914df436a4f50319cf63dc8d07ece4c815e32bcdaaa8d56ffaefd4bb17b235a9b8ba61027ce7d04246d6fe9846524ec5401028dbb11aee09ac0e6382bee4ca500f6cedfa9ecb5b699bc25207f073ea75c706be7915c0a7b0e558a43984086e8cd5dd7a21ba2a0a3b56822f8a2a77b91665d62654fdaf147ee2420dfbc7fa8ba815e941fafc3adf670170428df0c413bf90cb2f483268a14fff75b78d1a902ea94a8b7eac0995a35c3e96db351f2fe9fb195c7d218c49e71b28e5d792fadc245cb98964972e331eb0989d4ba621aab126b6ff14d53caefda077f299b5084cedded29ae228a0";
    const h = "0x"+"b31651b831a9e3bd0fbe58dad31f2b75c61b08d8e349b81a8c13ea21ace0309e";

    const b = [
        false, false, false, false
    ];

    const r = [
        web3helpers.numToBytes16("165404123873984563307551072570799136239"),
        web3helpers.numToBytes16("305259927847902434734913075604828299190"),
        web3helpers.numToBytes16("84169857307869333766957037600645243334"),
        web3helpers.numToBytes16("80465257935610903999013282398407173567")

    ];

    bgr.measure(m+m+m+m, x, h, b, r)
}

function five() {
    const m = web3helpers.readfile();

    const x = "0x"+"26ca52a0397b4032844a80aa7c3778eccd017b1532c835d72de64e486695f6ce4c879d54b16fe1b00805474344d0f87ab958ec520909aefec53b7977784722775dc9f74d0034ea034deef5a98ae05544bb605bb4682b64117566daae5ca7ad8def4b427175e9648a77c4bff4e5ec0dab7a341bd268c36319bf6d25226236a7eeefaa0e0bc562af9e4b567b20b3a743d898170eeb7b1a1a3a38e7ecb7983368a1bcde50676318dc7ff88144b1fd95ab07f22b3d37c3c974f52bea91bbbcfd560fb57b07f000dadaac912ac391b23008a0adf60ed7259a4a13ac52ceb5a6800f180e7c0ffc1b4065f482faa56e3b5e8ed6bceca1cea44d4d13c92bd5715be0c656";
    const h = "0x"+"da6a0683581f6a8895a24e8c966d9abdc2055d46e81253af7bda5fe9f1825f7c";

    const b = [
        true, false, true, false, false
    ];

    const r = [
        web3helpers.numToBytes16("146906938174174361696921831658186895167"),
        web3helpers.numToBytes16("51389619801373255759384915726790696039"),
        web3helpers.numToBytes16("96082963191653820921737118047123901208"),
        web3helpers.numToBytes16("48168266145810132281338930619503242212"),
        web3helpers.numToBytes16("189042677990858424565418419772348442800")
    ];

    bgr.measure(m+m+m+m+m, x, h, b, r)
}
