/*writing Mips code for sum of digits of a positive number, if the user gives an negative number , then throw an message*/


#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n;
    cin >> n;
    int ans = 0;
    if (n < 0)
    {
        cout << "The given number is non-negative:" << endl;
    }
    else
    {
        while (n > 0)
        {
            ans += n % 10;
            n /= 10;
        }
    }
    cout << ans << endl;
    return 0;
}
