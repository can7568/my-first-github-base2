#include <iostream>
#include <vector>
#include <utility>
using namespace std;
void exchangesort(int n, vector<int>& S){

    for (int i = 1; i<=n;i++){
        for (int j = i+1; j<=n;j++){
            if(S[i] > S[j]){
                swap(S[i],S[j]);
            }

        }
    }

}
int main(){
    int n;
    cin >> n;
    vector<int> S(n + 1);
    for (int i = 1; i<=n;i++){
        cin >> S[i];
    }
    int *pS = &S[0];
    exchangesort(n,pS);
    cout << pS << endl ;
}

