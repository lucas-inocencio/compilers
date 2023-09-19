#include <map>
#include <string>
#include <iostream>

using namespace std;

map< int, string > mes {
    { 2, "Fevereiro" },
    { 1, "Janeiro" },
    { 3, "Março" }
    
};

int main(){

    for( auto x : mes )
        cout << x.first << " => " << x.second << "\n"; // endl pula linha também, mas esvazia o buffer
      
    cout << "Size: " << mes.size() << "\n";  
      
    return 0;
}