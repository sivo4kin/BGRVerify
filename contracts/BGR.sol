pragma solidity 0.4.21;
pragma experimental ABIEncoderV2;

contract BGR {

    string[] labels = [
    "example.com/api/0",
    "example.com/api/1",
    "example.com/api/2",
    "example.com/api/3",
    "example.com/api/4",
    "example.com/api/5",
    "example.com/api/6",
    "example.com/api/7",
    "example.com/api/8",
    "example.com/api/9"
    ];

    string message = "MESSAGE 0";

    //Simulation of PKI (assumed to be available)
    uint256 constant e = 65537;

    bytes modulus0 = hex"6263663532343164663463303237386237333132303539613137666565353837626539346535653530333230303038316539363266623663613264396537613332343365396366663961646263666636363635326466366162623333303338393737323338376665313937303834343035653838643333366535336634613664323665613566623631306564666334353538386563336461313565396336653765383064313361656265386665636162626634666165613734356461373330646432323964393238656163306133333666626361323133336436653339396465396239383936666433623163316231396234653761376665356464336532386134373862316435346137363537336634323933373666643765363235393333623735306430336365656335333161333963643462656237633634343739386461373336643563323533373761336137653933613164326139316339306538373635623332333165346566303463376166343230633532313633373662323731653763373638616535316339306236656466623536373437383463323637646562333963623666633064653337303333383937666534393761646130336564353165353332666236376331613539623330363539623366313064363465373637656239663933373036626237393233366362316237303732393632626438396533";
    bytes modulus1 = hex"6138393135623730363730303535306634346238343332646138306638313263356361356432346265316634633135376432666263353666393764633731383164353231316532663533633935613534303161613066663839383262656466373532336436396530653430653733383864323264633365373136326264653232363862306336396162333066373931643135316139396439646532383231333533316134623136646438366566633035303638616461326635333432306137376366313838303661303139666236366166376138626536383336316432363064623732333239636139303337636437353636656265396132343737653064316565666162396131306239646266363134323963366137306130323431663430376634333062623839343933303262343666393163383635313937363730306137326636326530633238643737313364313937383664306237616134386438326632393431633032633634356433386563383336633933623461313931313564646538626333306635343335393762353330333761393964616138373937346362303730353338383365663138656236666661636638353761336430323534316666646563306534323735313961303934336436303034376434643036663733663465353630373665353631653166616233353864323838363736326439336637";
    bytes modulus2 = hex"6530643432396265376165656163313764373332653731353338373137323831613964393431373965633463343333313830303462626638633562656361663139303162333238346139623461393134353336356661636235383662333335616534396361666234383966633335303461326634326632356335633866616365343230663866323165393034303338373830376631333963356366663937633064666665653566383963643264303935373865373031636630353362343063313037353234306562316338343362333437333732313239313335313835376339306361323334326431326562626662376562616436323532323163333466323136353164353764303137636664646233326433623035323661376137663936393530636231386630303136316436626232333362303331353037323464306533323035656630616239626137333135613665643738626663356530333130393937643361646364613961393330343030626134313663363032616132356536343236353466323635623333643636663665663938663562633464376166396163383266363433326461366663373338626166363165663130363963613062303732346163633465663336633037363466623663323065396239663538653836306435663938356264626665356238383930306230616530326132633834353466";
    bytes modulus3 = hex"6339303234333463383432653239663561346136306163346534303061313039303734383737303339376633643561313665346337316261373939303738643233393934393561303263626635366238316339306461316165616133366563306363373562383934343661396335313638326562353039616631323038356533633637646232366265373439636537613231616630316265376466306363323737613731643035383935303865303632663032313731316464353731326330663031363736316161613165316334313233303831326136336632353465326466633334356138323962656665346136633638663936656563636334653231396337613734636361643332646566653838353166303963366337643561346563326439623833306432356430663938313863306433663665613035666134613937656463326233353865376537643835396538353637373736316334363366363562663065666436373239643339303162663036303134393835633934316464653439373961326338373031396232663733356366343132353161373064373533633237363430346636653830316237643839386563656136356230316531613761313361393130616533303333616432333836393332346663643031336136323530306362666234376537323165333133313832336564383165303161343037";
    bytes modulus4 = hex"6163336166666162653731353364363738376130366162356330613331646263653966363939363433623163626434643864346237316330656236346563333633653638336166343866343765383432356332313962383039313935646431633763643633396539303963306233353836313730376631393634613862363466306161373062383763383037313535383332393439323062316233396335653561343764336139323634663032376239316434623166326464383932616634653362646663333762613530643562393337323133356438306666363137363065663639373034653335393664376463333466616634636539346538303731323830323863626165616432396463383931656338343838643066366430383333316638613230376439653233363464373537366161303438373661616466323335653264633334656266636666373830393730363664653362393935343033373738373133356263383837633531373761393462636663613562373430376164373437313663303939333762333635336165373938303635646136303165363638343537353532666132343165333930666537353962633533623932373566316434393162363461373365383762353830316334323230623033326465643063346638323939366538643434626166346234356563663566323635633264323166";
    bytes modulus5 = hex"6162303136383031323530363832643935636438303565646230376238613138633833633665383662306335646130343764666539303966623831333566383939633634343731366264336164343064343562616539376332303466376235633366363464336365313366356630303635303263643966393164373364653236373231646365363361393435336363333664396237663765326632663631636537633733356133383737616536336362643239396334653363356662666633376139653962373837633939626366336630636562653730663936613738333164383233313462623938616437323935613363386130386439386666643166346334356433366465613231663838326365616438366436366266316566626235666266636333356139613430623839383234663961616130373164636332613930666636363333393362626135393365326336626336313962333735386366303435333866393839623364373038383331636565323033386637373031376562636661636632623935383633646464383436326539376231663139336664623236363735663433343733616637653461353935663332326437616661353332626261363864656136646132343539636530363262306131343637633039343632346639323233363632666262383232313364643263626465323233666132653664";
    bytes modulus6 = hex"6363336661363630386332363737363837373236333938386233313165326433623463636136343364306265373166323264643239333233663461363663353362303337303036346231633930616335343730306563316532373832323937396431656634633434306132636333663333336336353163373934306364323363663763313932326436386461356562353036393038323564356132613661666164663735626163333030306131386137346537386237396365666232636165313237613261613031373363353133356662306665333435323339613938326631343234643732313866653138383134363064613866306234366130616563373461356434373430353561333838636634353361383630303464613562346365346634646634346339393333346266383230353430333539633232393132653634363637326134636333616332393766336433626265326265353137346234633261373230396562383934386137653961653937303833376335376336613538666435633133393466633730353234633763386639643736333237303863396236646137623736393231656636653835363238356265396434306137363339353465666634313232353964373430303030306365373364386633333137666132376637323539326161376234656566363064663865383638613633663066613539";
    bytes modulus7 = hex"6461613566323165303337343532303239663136633730353564343234336434336230363235356630353162636639356663323434306238393535353563373831643039363338316133633932646439306534353139623739626633306335323765336164646232663965633837666130316234363831353632316236363063663461366365386464363035396131663730303266323365653934636133626538663637336432336634613362306236623330333130613764326663333138313033646562306465666437366666376230333838353862313762333531636461393961666361356436303732343366633532333933636366393637346232613231333331633630643236366266633530623765613332646635663936393536336138366462363237643339653466343836303133363035356337383639616436613262636262376566663936613830623035393834663265636339336365643464656665383930333231323063333461636264633437373438316563376534653932396438653265373963653136313766356466323838666166356234343435323564666162386539346137643666616232303465353334646130633437653630666366656433343331383161313932663062623134616561353063393461363132353031626636353639303136646436633663383236343761353031613964";
    bytes modulus8 = hex"6331336234333461333365666234636432653633366361383061373538623565396139653731396236396230316365653335633832373030643662333263336135313636333662363938356635373931636263346561353931383863353565613264393938323238363364633566383561353236316164363539313530363338633636303166666539666636363139656637623033313138383965366662616365343737396333356139343038346163336562393734333366633836633866333063333239383466313435616365616661386638386237636439643833373635626364333566346230336161383030343432306466633265363433373961386664326538376262666331303539643239636262363236383738343166663130393164613130303734646237653063613563396464326435363739396166333365623162323735386533623136623163333065636235643639613633313333313463333763353337633632653034383434373963333338623936653836383535366266303234666462646661326465666139376161303630626333636662353935393461616165323039343334363535653739653164613436633933323433393966393566656538623265646635353132643337616137393139363530363937616163633235336139613136653064303234306165363037363165383532303162";
    bytes modulus9 = hex"6131386563643036313237376632336532393265363866353937616437376130616565366534353739366139326562373534383532356463303135663038363636356633616534373734613530313333656466346432643130646434356335663161333739313837306564643738343164353239363632333561623038396430363864373961643331393366333534353739336133383834636636393833623964353763666631613038303962386333326534343930323666396233393765383566653636313461346163326263366232366238636536373363316139306233633735636364643138633137343533376365353733313233386664633737346231393162383738323433336161623366303965616236393263356330363361656234303965346662663565646161383761333262356435333663346438366561303263373130626334353439633133353366323562656539393861613638333561653763626536633766663739326533316339316263383332376234666466626138616134316336383433303365646433633661356138653936376639636264613066333561373633383761376537366235343462323162396264326230386264663531356461333361346236336431306131333165616434333333373163613933383138393233376365323238633937313335353032626265303062326235";

    function verify(bytes m, bytes x, bytes32 h, bool[] b, bytes16[] r) returns (bool) {
        bytes memory x_prev = x;
        bytes32 h_prev = h;

        //bytes memory g;
        bytes memory y;
        bytes memory X;
        //bytes32 eta;

        for (uint i = r.length - 1; i > 0; i--) {
            //Line 2
            X = split_inverse(x_prev, b[i]);
            y = modexp(X, e, getModulus(i));

            //Line 3
            //g = ghash(h_prev);

            //Line 4 (incl line 3)
            x_prev = xorbytes(ghash(h_prev), y);

            //Line 5
            //eta = ;

            //Line 6 (incl Line 5)
            h_prev = h_prev ^ hhash(getModulus(i), message, labels[i], r[i], x_prev);
        }

        //Line 7
        bytes32 h_hash = hhashbase(getModulus(0), message, labels[0], r[0]);
        bytes memory g_hash = ghash(h_prev);

        bytes memory pig = modexp(split_inverse(x_prev, b[0]), e, modulus0);

        //return h_prev;
        return h_hash == h_prev && equals(g_hash, pig);
    }

    function modexp(bytes base, uint exponent, bytes modulus) internal returns (bytes output) {
        uint base_length = base.length;
        uint modulus_length = modulus.length;

        uint size = (32 * 3) + base_length + 32 + modulus_length;
        bytes memory input = new bytes(size);
        output = new bytes(modulus_length);

        assembly {
            mstore(add(input, 32), base_length)
            mstore(add(input, 64), 32)
            mstore(add(input, 96), modulus_length)

            mstore(add(input, add(128, base_length)), exponent)
        }

        memcopy(base, 0, input, 96, base_length);
        memcopy(modulus, 0, input, 96 + base_length + 32, modulus_length);

        assembly {
            pop(call(gas(), 5, 0, add(input, 32), size, add(output, 32), modulus_length))
        }
    }

    function split_inverse(bytes xi, bool bi) internal pure returns (bytes) {
        if (bi) {
            xi[0] = byte(uint(xi[0]) + 128);
        }

        return xi;
    }

    function ghash(bytes32 y) internal pure returns (bytes) {
        bytes32 hash = keccak256(y);
        bytes memory res = hex"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

        for(uint i = 32; i < 256; i++) {
            res[i] = hash[i % 32];
        }

        return res;
    }

    function hhash(bytes modulus, string message, string label, bytes16 random, bytes x_prev) internal pure returns (bytes32) {
        return keccak256(modulus, message, label, random, x_prev);
    }

    function hhashbase(bytes modulus, string message, string label, bytes16 random) internal pure returns (bytes32) {
        return keccak256(modulus, message, label, random);
    }

    function cut(bytes i) internal pure returns (bytes32 part1, bytes32 part2, bytes32 part3, bytes32 part4, bytes32 part5, bytes32 part6, bytes32 part7, bytes32 part8) {

        assembly {
            part1 := mload(add(i, 32))
            part2 := mload(add(i, 64))
            part3 := mload(add(i, 96))
            part4 := mload(add(i, 128))
            part5 := mload(add(i, 160))
            part6 := mload(add(i, 192))
            part7 := mload(add(i, 224))
            part8 := mload(add(i, 256))
        }
    }

    function xorbytes(bytes a, bytes y) internal pure returns (bytes) {
        bytes32 c1;
        bytes32 c2;
        bytes32 c3;
        bytes32 c4;
        bytes32 c5;
        bytes32 c6;
        bytes32 c7;
        bytes32 c8;

        assembly {
            c1 := xor(mload(add(a, 32)), mload(add(y, 32)))
            c2 := xor(mload(add(a, 64)), mload(add(y, 64)))
            c3 := xor(mload(add(a, 96)), mload(add(y, 96)))
            c4 := xor(mload(add(a, 128)), mload(add(y, 128)))
            c5 := xor(mload(add(a, 160)), mload(add(y, 160)))
            c6 := xor(mload(add(a, 192)), mload(add(y, 192)))
            c7 := xor(mload(add(a, 224)), mload(add(y, 224)))
            c8 := xor(mload(add(a, 256)), mload(add(y, 256)))
        }

        bytes memory merged = new bytes(256);

        uint k = 0;

        for (uint i = 0; i < 32; i++) {
            merged[k] = c1[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c2[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c3[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c4[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c5[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c6[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c7[i];
            k++;
        }

        for (i = 0; i < 32; i++) {
            merged[k] = c8[i];
            k++;
        }

        return merged;
    }

    function memcopy(bytes src, uint srcoffset, bytes dst, uint dstoffset, uint len) pure internal {
        assembly {
            src := add(src, add(32, srcoffset))
            dst := add(dst, add(32, dstoffset))

        // copy 32 bytes at once
            for
            {}
            iszero(lt(len, 32))
            {
                dst := add(dst, 32)
                src := add(src, 32)
                len := sub(len, 32)
            }
            {mstore(dst, mload(src))}

        // copy the remainder (0 < len < 32)
            let mask := sub(exp(256, sub(32, len)), 1)
            let srcpart := and(mload(src), not(mask))
            let dstpart := and(mload(dst), mask)
            mstore(dst, or(srcpart, dstpart))
        }
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

        revert();
    }

    function equals(bytes memory self, bytes memory other) internal pure returns (bool equal) {
        if (self.length != other.length) {
            return false;
        }

        uint addr;
        uint addr2;
        uint len = self.length;

        assembly {
            addr := add(self, /*BYTES_HEADER_SIZE*/32)
            addr2 := add(other, /*BYTES_HEADER_SIZE*/32)
            equal := eq(keccak256(addr, len), keccak256(addr2, len))
        }
    }

}
