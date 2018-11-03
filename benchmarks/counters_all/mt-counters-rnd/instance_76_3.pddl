(define (problem instance_76_3)
  (:domain fn-counters-rnd)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 - counter
  )

  (:init
    (= (value c0) 60)
	(= (value c1) 18)
	(= (value c2) 55)
	(= (value c3) 24)
	(= (value c4) 47)
	(= (value c5) 96)
	(= (value c6) 125)
	(= (value c7) 113)
	(= (value c8) 147)
	(= (value c9) 4)
	(= (value c10) 40)
	(= (value c11) 121)
	(= (value c12) 42)
	(= (value c13) 44)
	(= (value c14) 11)
	(= (value c15) 79)
	(= (value c16) 20)
	(= (value c17) 92)
	(= (value c18) 105)
	(= (value c19) 48)
	(= (value c20) 101)
	(= (value c21) 22)
	(= (value c22) 68)
	(= (value c23) 62)
	(= (value c24) 88)
	(= (value c25) 148)
	(= (value c26) 85)
	(= (value c27) 95)
	(= (value c28) 101)
	(= (value c29) 144)
	(= (value c30) 79)
	(= (value c31) 112)
	(= (value c32) 101)
	(= (value c33) 45)
	(= (value c34) 23)
	(= (value c35) 19)
	(= (value c36) 113)
	(= (value c37) 6)
	(= (value c38) 45)
	(= (value c39) 34)
	(= (value c40) 61)
	(= (value c41) 61)
	(= (value c42) 20)
	(= (value c43) 16)
	(= (value c44) 66)
	(= (value c45) 46)
	(= (value c46) 62)
	(= (value c47) 72)
	(= (value c48) 123)
	(= (value c49) 148)
	(= (value c50) 14)
	(= (value c51) 44)
	(= (value c52) 49)
	(= (value c53) 80)
	(= (value c54) 21)
	(= (value c55) 13)
	(= (value c56) 116)
	(= (value c57) 120)
	(= (value c58) 34)
	(= (value c59) 3)
	(= (value c60) 40)
	(= (value c61) 98)
	(= (value c62) 34)
	(= (value c63) 77)
	(= (value c64) 101)
	(= (value c65) 48)
	(= (value c66) 65)
	(= (value c67) 72)
	(= (value c68) 132)
	(= (value c69) 121)
	(= (value c70) 85)
	(= (value c71) 51)
	(= (value c72) 77)
	(= (value c73) 53)
	(= (value c74) 80)
	(= (value c75) 47)
	(= (max_int) 152)
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
	(< (value c71) (value c72))
	(< (value c72) (value c73))
	(< (value c73) (value c74))
	(< (value c74) (value c75))
  ))

  
  

  
)
