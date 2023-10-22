# RMSCL

----

## No FORMAT

To: INFO-LISPM at MIT-AI
Subject: FORMAT
From: RMS at MIT-AI (Richard M. Stallman)
Date: Mon, 5 May 80 22:13:00 EDT

Since FORMAT is now as hairy and ugly as TECO,
I have written a more Lispy replacement, RMS;OUTPUT >.
It may be more verbose for simple things, but ought to
yield more readable code for anything complicated
since you use the ordinary Lisp control constructs.

## No MULTIPLE-VALUE-SETQ

To: common-lisp at SU-AI
From: Richard M. Stallman <RMS at MIT-AI>
Date: Sun, 24 Jan 1982 08:24:00 -0000

I agree with Fahlman about binding constructs.
I want LAMBDA to be the way it is, and LET to be the way it is,
and certainly not the same.

As for multiple values, if LET is fully extended to do what
SETF can do, then (LET (((VALUES A B C) m-v-returning-form)) ...)
can be used to replace M-V-BIND, just as (SETF (VALUES A B C) ...)
can replace MULTIPLE-VALUES.  I never use MULTIPLE-VALUES any more
because I think that the SETF style is clearer.

## COMPOSE

To: common-lisp at SU-AI
Subject: COMPOSE
From: Richard M. Stallman <RMS at MIT-AI>
Date: Fri, 05 Mar 1982 06:27:00 -0000

COMPOSE can be defined as a lambda macro, I think.

## No SET

To: common-lisp at SU-AI
Subject: SET
From: Richard M. Stallman <RMS at MIT-OZ at MIT-AI>
Date: Fri, 27 Aug 1982 21:54:00 -0000

I am happy to have SET eliminated from the definition of common lisp,
but that doesn't mean I'm willing to stop supporting it, with its
present meaning, on the Lisp machine.  I don't want to find every
SET in the Lisp machine system, or make the users do so.

## Use EQUAL instead of EQL for comparison by default

To: info-lispm-mit at MIT-OZ
Subject: Function MEMBER to be changed?
From: Richard M. Stallman <RMS@MIT-OZ>
Date: Sunday, June 19, 1983 8:16AM-EDT

It happens that the Common Lisp plan involves changing the function MEMBER
(and ASSOC and DELETE and REMOVE) to use EQL instead of EQUAL for comparison.
(EQL is like = on numbers, like EQ on everything else).

I have urged them to call the new functions MEMBERP and other new names
so that the old names MEMBER, ASSOC, etc. can be unchanged.

I expect most of you prefer to have the existing names not change their
meanings.  I'd like to know whether you think this is important.
Please send me mail about what you feel about this, and I will
pass it on to the Common Lisp designers.  (If you prefer to have
MEMBER change, you can tell me that.)

## No #||#
http://ml.cddddr.org/lisp-forum/msg00129.html
http://ml.cddddr.org/lisp-forum/msg00130.html

## No ASSOC, RASSOC, FILTER

https://cl-su-ai.lisp.se/msg05714.html

## Re: Generalized LET due to RMS
http://ml.cddddr.org/lisp-forum/msg00183.html

## LABELS
http://ml.cddddr.org/lisp-forum/msg00786.html
http://ml.cddddr.org/lisp-forum/msg00790.html



## destructuring in DEFUN
http://ml.cddddr.org/lisp-forum/msg00193.html

## array vs vector
https://cl-su-ai.lisp.se/msg00084.html

## arglist
http://ml.cddddr.org/lisp-forum/msg00493.html


## letf
http://ml.cddddr.org/lisp-forum/msg00370.html
http://ml.cddddr.org/lisp-forum/msg00369.html


## &keywords
http://ml.cddddr.org/lisp-forum/msg00204.html

## lambda list
http://ml.cddddr.org/lisp-forum/msg00750.html

## defsubst
http://ml.cddddr.org/lisp-forum/msg00712.html
