Quizchosen:
    print chr$(147)
    gosub Banner : rem draw banner
    print "{white}"
    print "quiz (chosen table)"
    print

Choosetable:
    print "choose a times table (1-12):";
    input n
    if n<1 or n>12 then print "invalid number!" : goto Choosetable

Qcdiffselect:
    print
    print "{lightgreen}1. easy   (10 questions)"
    print "{yellow}2. normal (20 questions)"
    print "{red}3. hard   (30 questions)"
    print "{white}"
    print "choose difficulty:";
    input d

    if d=1 then q=10 : goto Quizchosenstart
    if d=2 then q=20 : goto Quizchosenstart
    if d=3 then q=30 : goto Quizchosenstart

    print "invalid choice!"
    goto Qcdiffselect

Quizchosenstart:
    print
    print "ok, let's quiz the ";n;" times table!"
    print

    s=0 : rem score

    for x=1 to q
    i=int(rnd(1)*12)+1 : rem random 1-12
    print "{white}";i;" x ";n;" = ";
    input a
    if a=i*n then s=s+1 : print "{lightgreen}correct!" : goto qcnxt
    print "{red}oops! the right answer is ";i*n

    qcnxt:   
        print
        next x

    if s<6 then print "{red}you scored ";s;" out of 12 {return}not bad, but you can do better!": goto Qcmenu
    print "{lightgreen}well done! you scored ";s;" out of ";q
    if s=q then print "{yellow}***super star!***"
    print
Qcmenu:
    print "{white}1. try another quiz"
    print "2. return to main menu"
    print
    print "choose option (1-2):";
    input o

    if o=1 then goto Quizchosen
    if o=2 then goto Start

    print "invalid option!"
    goto Qcmenu