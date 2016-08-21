//for a more efficient method:
  //Sum of first n numbers = n(n+1)/2
  //Sum of squares of first n numbers = n(n+1)(2n+1)/6

int max = 100;
int sum = 0;

for (int i=1; i<=max; i++) {
  for (int j=i+1; j<=max; j++) {
      sum += i*j;
  }
}
sum *=2;
println(sum);

