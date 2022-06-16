#include <bits/stdc++.h>
using namespace std;
#define endl '\n'
typedef long long ll;
typedef pair<int, int> pii;

int min_factor[5000005];
void solve(int n) {
	while (n > 1) {
		printf("%d ", min_factor[n]);
		n /= min_factor[n];
	}
	putchar('\n');
}
int main() {
	min_factor[0] = min_factor[1] = -1;
	for (int i = 2; i <= 5000000; i++) {
		min_factor[i] = i;
	}

	for (int v = 2; v * v <= 5000000; v++) {
		if (min_factor[v] == v) { //v가 소수라면
			for (int k = v * v; k <= 5000000; k += v) {
				if (min_factor[k] == k)
					min_factor[k] = v;
			}
		}
	}
	
	int n;
	scanf("%d", &n);
	while (n--) {
		int v;
		scanf("%d", &v);
		solve(v);
	}
	return 0;
}
