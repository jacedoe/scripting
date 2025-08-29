#include <conio.h>
#include <stdio.h>
#include <cstdlib>
#include <Windows.h>
#include <cmath>
#include <iostream>
#include <iomanip>
#include <complex>
#include <string>
#include <random>
#include <algorithm>
#include <Shlwapi.h>
#pragma comment(lib, "user32.lib")

void toClipboard(HWND hwnd, const std::string& text) {
    if (OpenClipboard(hwnd)) {
        EmptyClipboard();
        HGLOBAL hg = GlobalAlloc(GMEM_MOVEABLE, text.size() + 1);
        if (hg) {
            char* pMem = static_cast<char*>(GlobalLock(hg));
            strcpy_s(pMem, text.size() + 1, text.c_str());
            GlobalUnlock(hg);
            SetClipboardData(CF_TEXT, hg);
        }
        CloseClipboard();
        GlobalFree(hg);
    }
}

int main() {
    // Get password length from the user
    int passwordLength;
    std::cout << "Enter the desired length of the password: ";
    std::cin >> passwordLength;

    // Define the character set for the password
    std::string charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+";

    // Create a random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, static_cast<int>(charSet.size()) - 1);

    // Generate the password
    std::string password(passwordLength, 0);
    std::generate(password.begin(), password.end(), [&]() { return charSet[dis(gen)]; });

    // Display the generated password
    std::cout << "Your generated password is: " << password << std::endl;

    // Copy the password to the clipboard
    HWND hwnd = GetDesktopWindow();
    toClipboard(hwnd, password);

    // Wait for user input before exiting
    std::cout << "Press Enter to exit..." << std::endl;
    std::cin.ignore();

    return 0;
}