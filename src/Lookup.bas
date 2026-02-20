Lookup:
    print chr$(147)
    gosub Banner : rem draw banner

    print "{white}enter a number:";
    input n
    print

    for i=1 to 12
    if i<10 then print " ";i;" x ";n;" = ";i*n : next i
    print i;" x ";n;" = ";i*n
    next i

    print
    print "1. enter a new number"
    print "2. return to main menu"
    print
    print "choose option (1-2):";

Lookupmenu:
    input o
    if o=1 then goto Lookup
    if o=2 then goto Start
    print "invalid option!"
    goto Lookupmenu