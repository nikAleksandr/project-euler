/*
The prime factors of 13195 are 5, 7, 13 and 29.
 
 What is the largest prime factor of the number 600851475143 ?
 */
//
//solution possibility 1
//
//create an array of prime factors
//test a passed through number for prime factors from the array

/*begin with the integer 2 and proceed to select each successive integer as a potential prime, 
 (pp), checking for primacy by testing to see if it can be factored by any previously identified primes, 
 then storing each newly verified prime in a prime set (ps) array.
 
 600851475143
 */
void setup() {
  primeArrayGen();
}

void primeArrayGen() {

  long n = 600851475143L;
  long max = ceil(n/2);

  int potentialPrime = 2;
  int[] primeArray= {
    potentialPrime
  };
  potentialPrime +=1;
  while (potentialPrime<max) {
    boolean prime = true;
    potentialPrime+=2;
    float sqrtpp = sqrt(potentialPrime);
    for (int i = 0; i<primeArray.length; i++) { 
      if (primeArray[i] > sqrtpp) {
        break;
      }
      else if (potentialPrime % primeArray[i] ==0) {
        prime=false;
        break;
      }
    }
    if (prime) {
      primeArray = append(primeArray, potentialPrime);
    }
  }
  // println(primeArray);
  //println("your primes await!");
  primeFactors(primeArray, n);
}

void primeFactors(int[] primeArray, long n) {
  int primeFactor = 1;
  //loop through primeArray
  //store them in an array called primeFactors
  //much faster if you count down and break once you find it.
  for (int i=primeArray.length-1; i>0; i--) {
    //println(primeArray[i]);
    if (n % primeArray[i] == 0) {
      //println(primeArray[i]);
      //primeFactors = append(primeFactors, primeArray[i]);
      primeFactor = primeArray[i];
      break;
    }
  }
  //store the length of the array in c
  //int c = primeFactors.length - 1;
  //println(c);
  println("The largest prime factor of the number " + n + " is: " + primeFactor );
}

