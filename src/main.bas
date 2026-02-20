DIMT(11)

Start:
    print chr$(147) : rem clear screen
    poke 53280,4 : poke 53281,0 : rem border purple, background black

    gosub Banner

    print "{lightgreen}1. times table lookup"
    print "{lightblue}2. times table test"
    print "{cyan}3. quiz (chosen table)"
    print "{pink}4. quiz (random tables)"
    print "{orange}5. exit"
    print
    print "{white}select option (1-5):";

menu:
    input o
    if o<1 or o>5 then print "invalid option!" : gosub menu
    if o=1 then gosub Lookup : rem lookup program
    if o=2 then gosub Test : rem test mode
    if o=3 then gosub Quizchosen : rem quiz (chosen table)
    if o=4 then gosub Quizall : rem quiz (random tables)
    if o=5 then gosub Exit
    gosub menu

Exit:
    print "{lightblue}";chr$(147)
    poke 53280,14 : poke 53281,6 : rem border light blue, background blue
    end


#include "Banner.bas"
#include "Lookup.bas"
#include "Test.bas"
#include "quizchosen.bas"
#include "quizall.bas"