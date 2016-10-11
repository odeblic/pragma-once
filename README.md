Does the compiler makes a difference between `#pragma once` and `#ifndef HEADER_H` guard?
-----------------------------------------------------------------------------------------

This test shows the compiler detects soft links and does not include multiple times the same header in both cases.

To run the test:

    git clone https://github.com/defmax/pragma_once
    cd pragma_once
    ./test.sh

Output should be:
  
    # 1 "main.c"
    # 1 "<built-in>"
    # 1 "<command-line>"
    # 1 "/usr/include/stdc-predef.h" 1 3 4
    # 1 "<command-line>" 2
    # 1 "main.c"
    This is the start of the main file

    # 1 "ifdef.h" 1
    # 10 "ifdef.h"
    This is the line from the header file using #ifndef
    It is supposed to be included only once in main file
    # 4 "main.c" 2
    # 1 "ifdef_hl.h" 1
    # 5 "main.c" 2
    # 1 "ifdef_sl.h" 1
    # 6 "main.c" 2

    This is the middle of the main file

    # 1 "once.h" 1

    # 10 "once.h"
    This is the line from the header file using #pragma once
    It is supposed to be included only once in main file
    # 10 "main.c" 2



    This is the end of the main file
