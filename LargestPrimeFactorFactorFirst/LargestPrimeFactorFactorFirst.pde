//Maybe best to find the lowest factor, divide by it (giving the highest factor) and check to see if that is prime.
//then continue to find the second-lowest factor

//May be more efficient to just make an array of all odd numbers under half (sqrt?) of the max, then cull out those in turn that are 

//alternatively, could just generate an array of factors, then identify the highest prime?
// for this i would be able to search the smaller amount of numbers below the sqrt while only add only the higher factor to the array. 
//(assuming that the largest factor will be above the sqrt)
// - loop over numbers starting with the sqrt and going down
// - check if it is a factor
// - if its a factor, add the result of division to the array
// - by either keeping it in numerical order, or later reordering it from highest first
// - then cull out any even numbers.  or cull them out initially 
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

/*

 */
void setup() {
  factorArrayGen();
}

void factorArrayGen() {

  long n = 600851475143L;
  long max = ceil(sqrt(n));

  int potentialFactor = 2;

  long[] factorArray= {
    n
  };

  while (potentialFactor <= max) {
    potentialFactor++;
    if (n % potentialFactor==0) {
      factorArray = (long[]) append(factorArray, n/potentialFactor);
      factorArray = (long[]) append(factorArray, potentialFactor);
    }
  }
  println(factorArray);
  println("^^ your factors await! ^^");
  primeFactors(factorArray, n);
}

long maxVal(long[] testArray)    
{   
  // initialize to the first element, since that's  
  // what will be assigned the first time through  
  // the loop anyways, in the previous version 
  long maximum = testArray[0]; 

  // then start the loop at 1 instead of 0, because 
  // the 0th element has already been 'checked' 
  for (int i = 1; i < testArray.length; i++) {   
    if (testArray[i] > maximum) {   
      maximum = testArray[i];
    }
  } 
  return maximum;
}

void primeFactors(long[] factorArray, long n) {
  long prime = n;
  long[] primeArray= {
    1
  };
  for (int i=1; i<factorArray.length; i++) {
    if (factorArray.length==1) {
      println("This is a prime number!");
      break;
    }
    else if (factorArray[i] % 2 != 0) {
      int potentialFactor = 2;
      boolean primeFactor = false;
      println("prime factor is true");
      while (potentialFactor <= ceil (sqrt (factorArray[i]))) {
        primeFactor = true;
        potentialFactor++;
        if (factorArray[i] % potentialFactor==0) {
          primeFactor= false;
          println(factorArray[i] + " is not a prime factor");
          break;
        }
        if (potentialFactor >= sqrt(factorArray[i]) & primeFactor==true) {
          primeArray = (long[]) append(primeArray, factorArray[i]);
          break;
        }
      }
    }
  }
  prime = maxVal(primeArray);
  println("The largest prime factor of the number " + n + " is: " + prime );
}

//store the length of the array in c
//int c = primeFactors.length - 1;
//println(c);

