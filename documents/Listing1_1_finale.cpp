// Окончательная версия
#include <iostream>                                                           // 1
#include <clocale>
using namespace std;                                                          // 2

int main() {                                                                  // 3
    setlocale( LC_ALL, "Russian" );
    double fahr, cels;                                                        // 4
    cout << endl << " Введите температуру по Фаренгейту" << endl;             // 5
    cin >> fahr;                                                              // 6
    cels = 5.0 / 9 * ( fahr - 32 );                                           // 7
    cout << "По Фаренгейту: " << fahr << ", по Цельсию: " << cels << endl;    // 8
    return 0;                                                                 // 9
}
