(define (problem instance_92)
  (:domain fn-counters-inv)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80 c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 - counter
  )

  (:init
    (= (value c0) 182)
	(= (value c1) 180)
	(= (value c2) 178)
	(= (value c3) 176)
	(= (value c4) 174)
	(= (value c5) 172)
	(= (value c6) 170)
	(= (value c7) 168)
	(= (value c8) 166)
	(= (value c9) 164)
	(= (value c10) 162)
	(= (value c11) 160)
	(= (value c12) 158)
	(= (value c13) 156)
	(= (value c14) 154)
	(= (value c15) 152)
	(= (value c16) 150)
	(= (value c17) 148)
	(= (value c18) 146)
	(= (value c19) 144)
	(= (value c20) 142)
	(= (value c21) 140)
	(= (value c22) 138)
	(= (value c23) 136)
	(= (value c24) 134)
	(= (value c25) 132)
	(= (value c26) 130)
	(= (value c27) 128)
	(= (value c28) 126)
	(= (value c29) 124)
	(= (value c30) 122)
	(= (value c31) 120)
	(= (value c32) 118)
	(= (value c33) 116)
	(= (value c34) 114)
	(= (value c35) 112)
	(= (value c36) 110)
	(= (value c37) 108)
	(= (value c38) 106)
	(= (value c39) 104)
	(= (value c40) 102)
	(= (value c41) 100)
	(= (value c42) 98)
	(= (value c43) 96)
	(= (value c44) 94)
	(= (value c45) 92)
	(= (value c46) 90)
	(= (value c47) 88)
	(= (value c48) 86)
	(= (value c49) 84)
	(= (value c50) 82)
	(= (value c51) 80)
	(= (value c52) 78)
	(= (value c53) 76)
	(= (value c54) 74)
	(= (value c55) 72)
	(= (value c56) 70)
	(= (value c57) 68)
	(= (value c58) 66)
	(= (value c59) 64)
	(= (value c60) 62)
	(= (value c61) 60)
	(= (value c62) 58)
	(= (value c63) 56)
	(= (value c64) 54)
	(= (value c65) 52)
	(= (value c66) 50)
	(= (value c67) 48)
	(= (value c68) 46)
	(= (value c69) 44)
	(= (value c70) 42)
	(= (value c71) 40)
	(= (value c72) 38)
	(= (value c73) 36)
	(= (value c74) 34)
	(= (value c75) 32)
	(= (value c76) 30)
	(= (value c77) 28)
	(= (value c78) 26)
	(= (value c79) 24)
	(= (value c80) 22)
	(= (value c81) 20)
	(= (value c82) 18)
	(= (value c83) 16)
	(= (value c84) 14)
	(= (value c85) 12)
	(= (value c86) 10)
	(= (value c87) 8)
	(= (value c88) 6)
	(= (value c89) 4)
	(= (value c90) 2)
	(= (value c91) 0)
	(= (max_int) 184)
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
	(< (value c75) (value c76))
	(< (value c76) (value c77))
	(< (value c77) (value c78))
	(< (value c78) (value c79))
	(< (value c79) (value c80))
	(< (value c80) (value c81))
	(< (value c81) (value c82))
	(< (value c82) (value c83))
	(< (value c83) (value c84))
	(< (value c84) (value c85))
	(< (value c85) (value c86))
	(< (value c86) (value c87))
	(< (value c87) (value c88))
	(< (value c88) (value c89))
	(< (value c89) (value c90))
	(< (value c90) (value c91))
  ))

  
  

  
)
