(define (problem instance_100_3)
  (:domain fn-counters-rnd)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80 c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 c92 c93 c94 c95 c96 c97 c98 c99 - counter
  )

  (:init
    (= (value c0) 36)
	(= (value c1) 68)
	(= (value c2) 106)
	(= (value c3) 93)
	(= (value c4) 161)
	(= (value c5) 75)
	(= (value c6) 134)
	(= (value c7) 177)
	(= (value c8) 63)
	(= (value c9) 15)
	(= (value c10) 119)
	(= (value c11) 21)
	(= (value c12) 120)
	(= (value c13) 134)
	(= (value c14) 54)
	(= (value c15) 70)
	(= (value c16) 189)
	(= (value c17) 10)
	(= (value c18) 84)
	(= (value c19) 88)
	(= (value c20) 137)
	(= (value c21) 189)
	(= (value c22) 137)
	(= (value c23) 12)
	(= (value c24) 21)
	(= (value c25) 70)
	(= (value c26) 100)
	(= (value c27) 5)
	(= (value c28) 145)
	(= (value c29) 190)
	(= (value c30) 0)
	(= (value c31) 171)
	(= (value c32) 137)
	(= (value c33) 46)
	(= (value c34) 65)
	(= (value c35) 190)
	(= (value c36) 24)
	(= (value c37) 16)
	(= (value c38) 154)
	(= (value c39) 179)
	(= (value c40) 19)
	(= (value c41) 106)
	(= (value c42) 194)
	(= (value c43) 151)
	(= (value c44) 66)
	(= (value c45) 176)
	(= (value c46) 141)
	(= (value c47) 45)
	(= (value c48) 55)
	(= (value c49) 60)
	(= (value c50) 32)
	(= (value c51) 58)
	(= (value c52) 105)
	(= (value c53) 52)
	(= (value c54) 128)
	(= (value c55) 81)
	(= (value c56) 152)
	(= (value c57) 106)
	(= (value c58) 124)
	(= (value c59) 140)
	(= (value c60) 169)
	(= (value c61) 25)
	(= (value c62) 33)
	(= (value c63) 199)
	(= (value c64) 136)
	(= (value c65) 31)
	(= (value c66) 45)
	(= (value c67) 41)
	(= (value c68) 4)
	(= (value c69) 147)
	(= (value c70) 15)
	(= (value c71) 188)
	(= (value c72) 19)
	(= (value c73) 170)
	(= (value c74) 168)
	(= (value c75) 63)
	(= (value c76) 64)
	(= (value c77) 102)
	(= (value c78) 112)
	(= (value c79) 154)
	(= (value c80) 101)
	(= (value c81) 132)
	(= (value c82) 191)
	(= (value c83) 181)
	(= (value c84) 146)
	(= (value c85) 187)
	(= (value c86) 85)
	(= (value c87) 178)
	(= (value c88) 69)
	(= (value c89) 63)
	(= (value c90) 162)
	(= (value c91) 58)
	(= (value c92) 133)
	(= (value c93) 35)
	(= (value c94) 44)
	(= (value c95) 3)
	(= (value c96) 52)
	(= (value c97) 63)
	(= (value c98) 46)
	(= (value c99) 37)
	(= (max_int) 200)
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
	(< (value c91) (value c92))
	(< (value c92) (value c93))
	(< (value c93) (value c94))
	(< (value c94) (value c95))
	(< (value c95) (value c96))
	(< (value c96) (value c97))
	(< (value c97) (value c98))
	(< (value c98) (value c99))
  ))

  
  

  
)