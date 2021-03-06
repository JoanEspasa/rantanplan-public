(define (problem instance_72_1)
  (:domain fn-counters-rnd)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 - counter
  )

  (:init
    (= (value c0) 110)
	(= (value c1) 123)
	(= (value c2) 134)
	(= (value c3) 22)
	(= (value c4) 1)
	(= (value c5) 31)
	(= (value c6) 0)
	(= (value c7) 74)
	(= (value c8) 90)
	(= (value c9) 79)
	(= (value c10) 138)
	(= (value c11) 39)
	(= (value c12) 6)
	(= (value c13) 20)
	(= (value c14) 36)
	(= (value c15) 108)
	(= (value c16) 93)
	(= (value c17) 123)
	(= (value c18) 95)
	(= (value c19) 21)
	(= (value c20) 77)
	(= (value c21) 61)
	(= (value c22) 95)
	(= (value c23) 76)
	(= (value c24) 114)
	(= (value c25) 39)
	(= (value c26) 89)
	(= (value c27) 2)
	(= (value c28) 96)
	(= (value c29) 63)
	(= (value c30) 10)
	(= (value c31) 112)
	(= (value c32) 58)
	(= (value c33) 16)
	(= (value c34) 142)
	(= (value c35) 114)
	(= (value c36) 17)
	(= (value c37) 12)
	(= (value c38) 134)
	(= (value c39) 26)
	(= (value c40) 51)
	(= (value c41) 18)
	(= (value c42) 120)
	(= (value c43) 103)
	(= (value c44) 68)
	(= (value c45) 39)
	(= (value c46) 57)
	(= (value c47) 50)
	(= (value c48) 57)
	(= (value c49) 56)
	(= (value c50) 16)
	(= (value c51) 83)
	(= (value c52) 88)
	(= (value c53) 27)
	(= (value c54) 61)
	(= (value c55) 68)
	(= (value c56) 82)
	(= (value c57) 25)
	(= (value c58) 11)
	(= (value c59) 52)
	(= (value c60) 122)
	(= (value c61) 119)
	(= (value c62) 95)
	(= (value c63) 25)
	(= (value c64) 68)
	(= (value c65) 121)
	(= (value c66) 102)
	(= (value c67) 91)
	(= (value c68) 12)
	(= (value c69) 70)
	(= (value c70) 2)
	(= (value c71) 18)
	(= (max_int) 144)
  )

  (:goal (and 
    (< (value c0) (value c1))
	(< (value c1) (value c2))
	(< (value c2) (value c3))
	(< (value c3) (value c4))
	(< (value c4) (value c5))
	(< (value c5) (value c6))
	(< (value c6) (value c7))
	(< (value c7) (value c8))
	(< (value c8) (value c9))
	(< (value c9) (value c10))
	(< (value c10) (value c11))
	(< (value c11) (value c12))
	(< (value c12) (value c13))
	(< (value c13) (value c14))
	(< (value c14) (value c15))
	(< (value c15) (value c16))
	(< (value c16) (value c17))
	(< (value c17) (value c18))
	(< (value c18) (value c19))
	(< (value c19) (value c20))
	(< (value c20) (value c21))
	(< (value c21) (value c22))
	(< (value c22) (value c23))
	(< (value c23) (value c24))
	(< (value c24) (value c25))
	(< (value c25) (value c26))
	(< (value c26) (value c27))
	(< (value c27) (value c28))
	(< (value c28) (value c29))
	(< (value c29) (value c30))
	(< (value c30) (value c31))
	(< (value c31) (value c32))
	(< (value c32) (value c33))
	(< (value c33) (value c34))
	(< (value c34) (value c35))
	(< (value c35) (value c36))
	(< (value c36) (value c37))
	(< (value c37) (value c38))
	(< (value c38) (value c39))
	(< (value c39) (value c40))
	(< (value c40) (value c41))
	(< (value c41) (value c42))
	(< (value c42) (value c43))
	(< (value c43) (value c44))
	(< (value c44) (value c45))
	(< (value c45) (value c46))
	(< (value c46) (value c47))
	(< (value c47) (value c48))
	(< (value c48) (value c49))
	(< (value c49) (value c50))
	(< (value c50) (value c51))
	(< (value c51) (value c52))
	(< (value c52) (value c53))
	(< (value c53) (value c54))
	(< (value c54) (value c55))
	(< (value c55) (value c56))
	(< (value c56) (value c57))
	(< (value c57) (value c58))
	(< (value c58) (value c59))
	(< (value c59) (value c60))
	(< (value c60) (value c61))
	(< (value c61) (value c62))
	(< (value c62) (value c63))
	(< (value c63) (value c64))
	(< (value c64) (value c65))
	(< (value c65) (value c66))
	(< (value c66) (value c67))
	(< (value c67) (value c68))
	(< (value c68) (value c69))
	(< (value c69) (value c70))
	(< (value c70) (value c71))
  ))

  
  

  
)
