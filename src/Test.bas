Test:
    print chr$(147)
    gosub Banner : rem draw banner
    print "{white}"
    print "times table test"
    print
    print "choose a times table:";
    input n

    print
    print "ok, let's test the ";n;" times table!"
    print

    s=0

    for i=1 to 12
    print "{white}";i;" x ";n;" = ";
    input a
    if a=i*n then s=s+1 : print "{lightgreen}correct!" : goto nxt
    print "{red}oops! the right answer is ";i*n
    nxt:
        print
        next i

    if s<6 then print "{red}you scored ";s;" out of 12 {return}not bad, but you can do better!": goto Testmenu
    print "{lightgreen}well done! you scored ";s;" out of 12"
    if s=12 then print "{yellow}***super star!***"
    print
Testmenu:
    print "{white}1. try another times table"
    print "2. return to main menu"
    print
    print "choose option (1-2):";
    input o

    if o=1 then goto Test
    if o=2 then goto Start

    print "invalid option!"
    goto Testmenu
