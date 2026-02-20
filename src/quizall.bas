Quizall:
    print chr$(147)
    gosub Banner : rem draw banner
    print "{white}"
    print "quiz (random tables)"
    print
qadiffselect:
    print "{lightgreen}1. easy   (tables 2,5,10)"
    print "{yellow}2. normal (2,3,5,6,10,11)"
    print "{red}3. hard   (all of them!!)"
    print "{white}"
    print "choose difficulty (1-3):";
    input d

    if d=1 then t$="2,5,10" : goto qaquestionselect
    if d=2 then t$="2,3,5,6,10,11" : goto qaquestionselect
    if d=3 then t$="2,3,4,5,6,7,8,9,10,11,12" : goto qaquestionselect

    print "invalid choice!"
    goto qadiffselect

qaquestionselect:
    print
    print "{white}how many questions?"
    print "{lightgreen}1. 10 questions"
    print "{yellow}2. 20 questions"
    print "{red}3. 30 questions"
    print "{white}"
    print "choose option (1-3):";
    input qn

    if qn=1 then q=10 : goto Quizallstart
    if qn=2 then q=20 : goto Quizallstart
    if qn=3 then q=30 : goto Quizallstart

    print "invalid choice!"
    goto qaquestionselect

Quizallstart:
    rem convert t$ into array t()
    c=1
    for i=1 to len(t$)
    if mid$(t$,i,1)="," then c=c+1
    next i

    p=1 : idx=1

    for i=1 to len(t$)
    if mid$(t$,i,1)="," then t(idx)=val(mid$(t$,p,i-p)) : idx=idx+1 : p=i+1
    next i
    t(idx)=val(mid$(t$,p))

    print
    print "ok, let's begin!"
    print

    s=0 : rem score

    for x=1 to q
    r=int(rnd(1)*c)+1 : n=t(r)
    m=int(rnd(1)*12)+1

    print "{white}";m;" x ";n;" = ";
    input a

    if a=m*n then s=s+1 : print "{lightgreen}correct!" : goto qanxt
    print "{red}oops! the right answer is ";m*n
    qanxt:
        print
        next x

    if s<6 then print "{red}you scored ";s;" out of 12 {return}not bad, but you can do better!": goto Qamenu
    print "{lightgreen}well done! you scored ";s;" out of ";q
    if s=q then print "{yellow}***super star!***"
    print

Qamenu:
    print "{white}1. try another quiz"
    print "2. return to main menu"
    print
    print "choose option (1-2):";
    input o

    if o=1 then goto Quizall
    if o=2 then goto Start

    print "invalid option!"
    goto Qamenu