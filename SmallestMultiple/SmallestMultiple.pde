//could probably start by taking the series and removing any numbers that are already multiples of eachother, such as 2, 4, 8, 16; divisible by 16 implies divisible by the others
//could we reduce it to a series of prime factors (1, 2, 3, 5, 7?)
//what is a good bound to start counting up from at the bottom (top)?
//

//could just find the prime factors of each number, then multiply all these together.


void setup() {
  int max = 20;
  int top = 1;
  int[] list = {
  };

  primeArrayGen(max, list);
  //array(max, list, answer);
}

void primeArrayGen(int max, int[] list) {

  int potentialPrime = 2;
  int[] primeArray= {
    potentialPrime
  };
  potentialPrime +=1;
  while (potentialPrime<max) {
    boolean prime = true;
    double sqrtpp = sqrt(potentialPrime);
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

    potentialPrime+=2;
  }

  int increment = 1;
  for (int i=0; i<primeArray.length; i++) {
    increment *=primeArray[i];
  }
  double answer = (double)increment;
  println(increment);
  //println("your primes await!");
  array(max, list, increment, answer);
}

void array(int max, int[] list, int increment, double answer) {
  for (int i=max-1; i>1; i--) {
    list = append(list, i);
  }
  listDown(max, list, increment, answer);
}


void listDown(int max, int[] list, int increment, double answer) {
  for (int i=0; i<list.length; i++) {
    while (answer % list[i]!=0) {
      answer+=increment;
    }
  }

  check(max, list, increment, answer);
}

void check(int max, int [] list, int increment, double answer) {
  for (int i=0; i<list.length; i++) {
    if (answer % list[i]!=0) {
      listDown(max, list, increment, answer);
    }
  }  
  //String answerStr = nfc(answer, 0);
  //println(answerStr);
  println(answer);
  exit();
}

