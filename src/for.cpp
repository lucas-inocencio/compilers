#include <stdio.h>
#include <vector>

using namespace std;

int main() {
  vector<int> t = { 3, 7, 9, 98 };
  
  printf( "size: %ld, cap: %ld \n", t.size(), t.capacity() );
  
  t.push_back( 56 );
  
  printf( "size: %ld, cap: %ld \n", t.size(), t.capacity() );

  return 0;
}