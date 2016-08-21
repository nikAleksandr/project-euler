/*
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/
void setup(){
int x=1;
int xprev = 1;
int counter = 0; 
int sum = 0;
fib(x, xprev, counter, sum);
}




void fib(int x, int xprev, int counter, int sum){
  
  println(x + " " + counter);
 
   int xnext = x + xprev;
   xprev = x;
   x = xnext;
   if(x < 4000000){
     if(x%2==0){
       sum += x;
     }
     counter++;
     fib(x, xprev, counter, sum);
   }
   else{
     println("Total:" +sum);
   }
}


