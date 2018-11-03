(define (problem instance_124)
  (:domain fn-counters-inv)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80 c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 c92 c93 c94 c95 c96 c97 c98 c99 c100 c101 c102 c103 c104 c105 c106 c107 c108 c109 c110 c111 c112 c113 c114 c115 c116 c117 c118 c119 c120 c121 c122 c123 - counter
  )

  (:init
    (= (value c0) 246)
	(= (value c1) 244)
	(= (value c2) 242)
	(= (value c3) 240)
	(= (value c4) 238)
	(= (value c5) 236)
	(= (value c6) 234)
	(= (value c7) 232)
	(= (value c8) 230)
	(= (value c9) 228)
	(= (value c10) 226)
	(= (value c11) 224)
	(= (value c12) 222)
	(= (value c13) 220)
	(= (value c14) 218)
	(= (value c15) 216)
	(= (value c16) 214)
	(= (value c17) 212)
	(= (value c18) 210)
	(= (value c19) 208)
	(= (value c20) 206)
	(= (value c21) 204)
	(= (value c22) 202)
	(= (value c23) 200)
	(= (value c24) 198)
	(= (value c25) 196)
	(= (value c26) 194)
	(= (value c27) 192)
	(= (value c28) 190)
	(= (value c29) 188)
	(= (value c30) 186)
	(= (value c31) 184)
	(= (value c32) 182)
	(= (value c33) 180)
	(= (value c34) 178)
	(= (value c35) 176)
	(= (value c36) 174)
	(= (value c37) 172)
	(= (value c38) 170)
	(= (value c39) 168)
	(= (value c40) 166)
	(= (value c41) 164)
	(= (value c42) 162)
	(= (value c43) 160)
	(= (value c44) 158)
	(= (value c45) 156)
	(= (value c46) 154)
	(= (value c47) 152)
	(= (value c48) 150)
	(= (value c49) 148)
	(= (value c50) 146)
	(= (value c51) 144)
	(= (value c52) 142)
	(= (value c53) 140)
	(= (value c54) 138)
	(= (value c55) 136)
	(= (value c56) 134)
	(= (value c57) 132)
	(= (value c58) 130)
	(= (value c59) 128)
	(= (value c60) 126)
	(= (value c61) 124)
	(= (value c62) 122)
	(= (value c63) 120)
	(= (value c64) 118)
	(= (value c65) 116)
	(= (value c66) 114)
	(= (value c67) 112)
	(= (value c68) 110)
	(= (value c69) 108)
	(= (value c70) 106)
	(= (value c71) 104)
	(= (value c72) 102)
	(= (value c73) 100)
	(= (value c74) 98)
	(= (value c75) 96)
	(= (value c76) 94)
	(= (value c77) 92)
	(= (value c78) 90)
	(= (value c79) 88)
	(= (value c80) 86)
	(= (value c81) 84)
	(= (value c82) 82)
	(= (value c83) 80)
	(= (value c84) 78)
	(= (value c85) 76)
	(= (value c86) 74)
	(= (value c87) 72)
	(= (value c88) 70)
	(= (value c89) 68)
	(= (value c90) 66)
	(= (value c91) 64)
	(= (value c92) 62)
	(= (value c93) 60)
	(= (value c94) 58)
	(= (value c95) 56)
	(= (value c96) 54)
	(= (value c97) 52)
	(= (value c98) 50)
	(= (value c99) 48)
	(= (value c100) 46)
	(= (value c101) 44)
	(= (value c102) 42)
	(= (value c103) 40)
	(= (value c104) 38)
	(= (value c105) 36)
	(= (value c106) 34)
	(= (value c107) 32)
	(= (value c108) 30)
	(= (value c109) 28)
	(= (value c110) 26)
	(= (value c111) 24)
	(= (value c112) 22)
	(= (value c113) 20)
	(= (value c114) 18)
	(= (value c115) 16)
	(= (value c116) 14)
	(= (value c117) 12)
	(= (value c118) 10)
	(= (value c119) 8)
	(= (value c120) 6)
	(= (value c121) 4)
	(= (value c122) 2)
	(= (value c123) 0)
	(= (max_int) 248)
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
	(< (value c99) (value c100))
	(< (value c100) (value c101))
	(< (value c101) (value c102))
	(< (value c102) (value c103))
	(< (value c103) (value c104))
	(< (value c104) (value c105))
	(< (value c105) (value c106))
	(< (value c106) (value c107))
	(< (value c107) (value c108))
	(< (value c108) (value c109))
	(< (value c109) (value c110))
	(< (value c110) (value c111))
	(< (value c111) (value c112))
	(< (value c112) (value c113))
	(< (value c113) (value c114))
	(< (value c114) (value c115))
	(< (value c115) (value c116))
	(< (value c116) (value c117))
	(< (value c117) (value c118))
	(< (value c118) (value c119))
	(< (value c119) (value c120))
	(< (value c120) (value c121))
	(< (value c121) (value c122))
	(< (value c122) (value c123))
  ))

  
  

  
)