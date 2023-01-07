pragma circom 2.0.0;

template YesBinaryCount () {
    signal input vote;
    signal output out;
    var number=0;
    
    for (var i = 0; i < vote; i++) {
        number+=1;
    }
    out <-- number;
    out === 21;
}

component main = YesBinaryCount();