#include <stdio.h>

int main ( void )
{

  short  X;
  short  in1, in2;

  printf( "Please enter two signed 16-bit integers\n" );
  printf( "Enter an integer: " );
  scanf( "%d", &in1 );

  printf( "Enter an integer: " );
  scanf( "%d", &in2 );


  if ( in1 < in2 )
    {
      X = -1;
    }
  else
    {
      X = 1;
    }

  printf( "X = %d\n", X );

  return 0;

}
