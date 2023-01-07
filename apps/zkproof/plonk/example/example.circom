pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Example () {  

   // Declaration of signals.  
   signal input d;  
   signal input e;  
   signal output f;  

   // Constraints.  
   f <== d * e;  
}

component main { public [ d ] } = Example();