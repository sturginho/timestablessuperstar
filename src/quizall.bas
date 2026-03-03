Quizall:
    rem Clear screen and display title
    print chr$(147)
    gosub Banner : rem draw banner
    print "{white}"
    print "quiz (random tables)"
    print
qadiffselect:
    rem Display difficulty options
    print "{lightgreen}1. easy   (tables 2,5,10)"
    print "{yellow}2. normal (2,3,5,6,10,11)"
    print "{red}3. hard   (all of them!!)"
    print "{white}"
    print "choose difficulty (1-3):";
    input d

    rem Set the table selection string (t$) based on difficulty level
    if d=1 then t$="2,5,10" : goto qaquestionselect
    if d=2 then t$="2,3,5,6,10,11" : goto qaquestionselect
    if d=3 then t$="2,3,4,5,6,7,8,9,10,11,12" : goto qaquestionselect

    print "invalid choice!"
    goto qadiffselect

qaquestionselect:
    print
    rem Display question count options
    print "{white}how many questions?"
    print "{lightgreen}1. 10 questions"
    print "{yellow}2. 20 questions"
    print "{red}3. 30 questions"
    print "{white}"
    print "choose option (1-3):";
    input qn

    rem Set the number of questions (q) based on user selection
    if qn=1 then q=10 : goto Quizallstart
    if qn=2 then q=20 : goto Quizallstart
    if qn=3 then q=30 : goto Quizallstart

    print "invalid choice!"
    goto qaquestionselect

Quizallstart:
    rem Parse comma-separated string (t$) into array (t())
    rem First, count how many numbers are in t$ by counting commas
    c=1
    for i=1 to len(t$)
    if mid$(t$,i,1)="," then c=c+1
    next i

    rem Extract each number from t$ and store in array t()
    p=1 : idx=1

    for i=1 to len(t$)
    if mid$(t$,i,1)="," then t(idx)=val(mid$(t$,p,i-p)) : idx=idx+1 : p=i+1
    next i
    rem Get the last number (after the last comma)
    t(idx)=val(mid$(t$,p))

    print
    print "ok, let's begin!"
    print

    rem Initialize score counter
    s=0 : rem score

    rem Initialize tracking array to record which questions have been asked
    rem u() array prevents asking the same question twice
    rem tb = total number of possible questions (number of tables * 12)
    at=0 
    tb=c*12
    for i=1 to tb
        u(i)=0
    next i

    rem Main quiz loop - ask the specified number of questions
    for x=1 to q
    rem Generate random question
    qawhile:
        rem Select random table and random multiplier (1-12)
        r=int(rnd(1)*c)+1 : n=t(r)
        m=int(rnd(1)*12)+1
        rem Check if we haven't exceeded question limit and if this question hasn't been asked yet
        rem kd = unique ID for this question (combines table index and multiplier)
        if at<tb then kd=(r-1)*12 + m : if u(kd)=1 then goto qawhile

    rem Display the question and get user's answer
    print "{white}";m;" x ";n;" = ";
    input a

    rem Check if answer is correct
    if a=m*n then s=s+1 : print "{lightgreen}correct!" : goto qanxt
    print "{red}oops! the right answer is ";m*n
    qanxt:
        rem Mark this question as asked in the tracking array
        if at<tb then u(kd)=1 : at=at+1
        print
        next x
     
    rem Display results based on score
    if s<(q/2) then print "{red}you scored ";s;" out of ";q" {return}not bad, but you can do better!": goto Qamenu
    print "{lightgreen}well done! you scored ";s;" out of ";q
    rem Special message for perfect score
    if s=q then print "{yellow}***super star!***"
    print

Qamenu:
    rem Display options to continue or return to main menu
    print "{white}1. try another quiz"
    print "2. return to main menu"
    print
    print "choose option (1-2):";
    input o

    rem Handle user selection
    if o=1 then goto Quizall
    if o=2 then goto Start

    print "invalid option!"
    goto Qamenu