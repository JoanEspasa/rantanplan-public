(define (problem ZTRAVEL-5-25)
(:domain zeno-travel)
(:objects
	plane1 - aircraft
	plane2 - aircraft
	plane3 - aircraft
	plane4 - aircraft
	plane5 - aircraft
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
	person10 - person
	person11 - person
	person12 - person
	person13 - person
	person14 - person
	person15 - person
	person16 - person
	person17 - person
	person18 - person
	person19 - person
	person20 - person
	person21 - person
	person22 - person
	person23 - person
	person24 - person
	person25 - person
	city0 - city
	city1 - city
	city2 - city
	city3 - city
	city4 - city
	city5 - city
	city6 - city
	city7 - city
	city8 - city
	city9 - city
	city10 - city
	city11 - city
	city12 - city
	city13 - city
	city14 - city
	city15 - city
	city16 - city
	city17 - city
	city18 - city
	city19 - city
	)
(:init
	(at plane1 city0)
	(= (capacity plane1) 4800)
	(= (fuel plane1) 568)
	(= (slow-burn plane1) 2)
	(= (fast-burn plane1) 5)
	(= (onboard plane1) 0)
	(= (zoom-limit plane1) 3)
	(at plane2 city1)
	(= (capacity plane2) 2579)
	(= (fuel plane2) 764)
	(= (slow-burn plane2) 1)
	(= (fast-burn plane2) 3)
	(= (onboard plane2) 0)
	(= (zoom-limit plane2) 8)
	(at plane3 city16)
	(= (capacity plane3) 2273)
	(= (fuel plane3) 887)
	(= (slow-burn plane3) 1)
	(= (fast-burn plane3) 3)
	(= (onboard plane3) 0)
	(= (zoom-limit plane3) 6)
	(at plane4 city10)
	(= (capacity plane4) 8940)
	(= (fuel plane4) 2214)
	(= (slow-burn plane4) 4)
	(= (fast-burn plane4) 14)
	(= (onboard plane4) 0)
	(= (zoom-limit plane4) 8)
	(at plane5 city1)
	(= (capacity plane5) 14873)
	(= (fuel plane5) 2374)
	(= (slow-burn plane5) 5)
	(= (fast-burn plane5) 11)
	(= (onboard plane5) 0)
	(= (zoom-limit plane5) 3)
	(at person1 city19)
	(at person2 city3)
	(at person3 city6)
	(at person4 city16)
	(at person5 city13)
	(at person6 city6)
	(at person7 city0)
	(at person8 city3)
	(at person9 city13)
	(at person10 city16)
	(at person11 city2)
	(at person12 city6)
	(at person13 city8)
	(at person14 city0)
	(at person15 city8)
	(at person16 city19)
	(at person17 city9)
	(at person18 city0)
	(at person19 city1)
	(at person20 city12)
	(at person21 city8)
	(at person22 city15)
	(at person23 city4)
	(at person24 city6)
	(at person25 city17)
	(= (distance city0 city0) 0)
	(= (distance city0 city1) 623)
	(= (distance city0 city2) 750)
	(= (distance city0 city3) 956)
	(= (distance city0 city4) 583)
	(= (distance city0 city5) 902)
	(= (distance city0 city6) 767)
	(= (distance city0 city7) 676)
	(= (distance city0 city8) 798)
	(= (distance city0 city9) 865)
	(= (distance city0 city10) 837)
	(= (distance city0 city11) 570)
	(= (distance city0 city12) 601)
	(= (distance city0 city13) 700)
	(= (distance city0 city14) 575)
	(= (distance city0 city15) 770)
	(= (distance city0 city16) 601)
	(= (distance city0 city17) 621)
	(= (distance city0 city18) 507)
	(= (distance city0 city19) 979)
	(= (distance city1 city0) 623)
	(= (distance city1 city1) 0)
	(= (distance city1 city2) 544)
	(= (distance city1 city3) 631)
	(= (distance city1 city4) 853)
	(= (distance city1 city5) 783)
	(= (distance city1 city6) 895)
	(= (distance city1 city7) 888)
	(= (distance city1 city8) 659)
	(= (distance city1 city9) 731)
	(= (distance city1 city10) 611)
	(= (distance city1 city11) 557)
	(= (distance city1 city12) 557)
	(= (distance city1 city13) 763)
	(= (distance city1 city14) 681)
	(= (distance city1 city15) 808)
	(= (distance city1 city16) 719)
	(= (distance city1 city17) 764)
	(= (distance city1 city18) 711)
	(= (distance city1 city19) 987)
	(= (distance city2 city0) 750)
	(= (distance city2 city1) 544)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 941)
	(= (distance city2 city4) 509)
	(= (distance city2 city5) 852)
	(= (distance city2 city6) 778)
	(= (distance city2 city7) 579)
	(= (distance city2 city8) 954)
	(= (distance city2 city9) 978)
	(= (distance city2 city10) 655)
	(= (distance city2 city11) 724)
	(= (distance city2 city12) 580)
	(= (distance city2 city13) 776)
	(= (distance city2 city14) 732)
	(= (distance city2 city15) 559)
	(= (distance city2 city16) 821)
	(= (distance city2 city17) 863)
	(= (distance city2 city18) 912)
	(= (distance city2 city19) 604)
	(= (distance city3 city0) 956)
	(= (distance city3 city1) 631)
	(= (distance city3 city2) 941)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 759)
	(= (distance city3 city5) 801)
	(= (distance city3 city6) 763)
	(= (distance city3 city7) 990)
	(= (distance city3 city8) 913)
	(= (distance city3 city9) 821)
	(= (distance city3 city10) 548)
	(= (distance city3 city11) 676)
	(= (distance city3 city12) 502)
	(= (distance city3 city13) 856)
	(= (distance city3 city14) 895)
	(= (distance city3 city15) 767)
	(= (distance city3 city16) 567)
	(= (distance city3 city17) 882)
	(= (distance city3 city18) 708)
	(= (distance city3 city19) 576)
	(= (distance city4 city0) 583)
	(= (distance city4 city1) 853)
	(= (distance city4 city2) 509)
	(= (distance city4 city3) 759)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 735)
	(= (distance city4 city6) 987)
	(= (distance city4 city7) 656)
	(= (distance city4 city8) 690)
	(= (distance city4 city9) 965)
	(= (distance city4 city10) 811)
	(= (distance city4 city11) 914)
	(= (distance city4 city12) 545)
	(= (distance city4 city13) 587)
	(= (distance city4 city14) 646)
	(= (distance city4 city15) 605)
	(= (distance city4 city16) 908)
	(= (distance city4 city17) 510)
	(= (distance city4 city18) 517)
	(= (distance city4 city19) 512)
	(= (distance city5 city0) 902)
	(= (distance city5 city1) 783)
	(= (distance city5 city2) 852)
	(= (distance city5 city3) 801)
	(= (distance city5 city4) 735)
	(= (distance city5 city5) 0)
	(= (distance city5 city6) 769)
	(= (distance city5 city7) 818)
	(= (distance city5 city8) 776)
	(= (distance city5 city9) 759)
	(= (distance city5 city10) 731)
	(= (distance city5 city11) 597)
	(= (distance city5 city12) 808)
	(= (distance city5 city13) 908)
	(= (distance city5 city14) 600)
	(= (distance city5 city15) 664)
	(= (distance city5 city16) 803)
	(= (distance city5 city17) 867)
	(= (distance city5 city18) 731)
	(= (distance city5 city19) 686)
	(= (distance city6 city0) 767)
	(= (distance city6 city1) 895)
	(= (distance city6 city2) 778)
	(= (distance city6 city3) 763)
	(= (distance city6 city4) 987)
	(= (distance city6 city5) 769)
	(= (distance city6 city6) 0)
	(= (distance city6 city7) 576)
	(= (distance city6 city8) 808)
	(= (distance city6 city9) 922)
	(= (distance city6 city10) 563)
	(= (distance city6 city11) 964)
	(= (distance city6 city12) 612)
	(= (distance city6 city13) 529)
	(= (distance city6 city14) 776)
	(= (distance city6 city15) 527)
	(= (distance city6 city16) 575)
	(= (distance city6 city17) 863)
	(= (distance city6 city18) 674)
	(= (distance city6 city19) 680)
	(= (distance city7 city0) 676)
	(= (distance city7 city1) 888)
	(= (distance city7 city2) 579)
	(= (distance city7 city3) 990)
	(= (distance city7 city4) 656)
	(= (distance city7 city5) 818)
	(= (distance city7 city6) 576)
	(= (distance city7 city7) 0)
	(= (distance city7 city8) 772)
	(= (distance city7 city9) 684)
	(= (distance city7 city10) 697)
	(= (distance city7 city11) 785)
	(= (distance city7 city12) 953)
	(= (distance city7 city13) 516)
	(= (distance city7 city14) 561)
	(= (distance city7 city15) 713)
	(= (distance city7 city16) 748)
	(= (distance city7 city17) 659)
	(= (distance city7 city18) 521)
	(= (distance city7 city19) 656)
	(= (distance city8 city0) 798)
	(= (distance city8 city1) 659)
	(= (distance city8 city2) 954)
	(= (distance city8 city3) 913)
	(= (distance city8 city4) 690)
	(= (distance city8 city5) 776)
	(= (distance city8 city6) 808)
	(= (distance city8 city7) 772)
	(= (distance city8 city8) 0)
	(= (distance city8 city9) 759)
	(= (distance city8 city10) 685)
	(= (distance city8 city11) 960)
	(= (distance city8 city12) 626)
	(= (distance city8 city13) 917)
	(= (distance city8 city14) 647)
	(= (distance city8 city15) 703)
	(= (distance city8 city16) 726)
	(= (distance city8 city17) 570)
	(= (distance city8 city18) 766)
	(= (distance city8 city19) 691)
	(= (distance city9 city0) 865)
	(= (distance city9 city1) 731)
	(= (distance city9 city2) 978)
	(= (distance city9 city3) 821)
	(= (distance city9 city4) 965)
	(= (distance city9 city5) 759)
	(= (distance city9 city6) 922)
	(= (distance city9 city7) 684)
	(= (distance city9 city8) 759)
	(= (distance city9 city9) 0)
	(= (distance city9 city10) 682)
	(= (distance city9 city11) 795)
	(= (distance city9 city12) 967)
	(= (distance city9 city13) 710)
	(= (distance city9 city14) 870)
	(= (distance city9 city15) 830)
	(= (distance city9 city16) 884)
	(= (distance city9 city17) 551)
	(= (distance city9 city18) 603)
	(= (distance city9 city19) 568)
	(= (distance city10 city0) 837)
	(= (distance city10 city1) 611)
	(= (distance city10 city2) 655)
	(= (distance city10 city3) 548)
	(= (distance city10 city4) 811)
	(= (distance city10 city5) 731)
	(= (distance city10 city6) 563)
	(= (distance city10 city7) 697)
	(= (distance city10 city8) 685)
	(= (distance city10 city9) 682)
	(= (distance city10 city10) 0)
	(= (distance city10 city11) 749)
	(= (distance city10 city12) 888)
	(= (distance city10 city13) 522)
	(= (distance city10 city14) 765)
	(= (distance city10 city15) 949)
	(= (distance city10 city16) 735)
	(= (distance city10 city17) 514)
	(= (distance city10 city18) 608)
	(= (distance city10 city19) 757)
	(= (distance city11 city0) 570)
	(= (distance city11 city1) 557)
	(= (distance city11 city2) 724)
	(= (distance city11 city3) 676)
	(= (distance city11 city4) 914)
	(= (distance city11 city5) 597)
	(= (distance city11 city6) 964)
	(= (distance city11 city7) 785)
	(= (distance city11 city8) 960)
	(= (distance city11 city9) 795)
	(= (distance city11 city10) 749)
	(= (distance city11 city11) 0)
	(= (distance city11 city12) 671)
	(= (distance city11 city13) 867)
	(= (distance city11 city14) 942)
	(= (distance city11 city15) 631)
	(= (distance city11 city16) 994)
	(= (distance city11 city17) 860)
	(= (distance city11 city18) 779)
	(= (distance city11 city19) 697)
	(= (distance city12 city0) 601)
	(= (distance city12 city1) 557)
	(= (distance city12 city2) 580)
	(= (distance city12 city3) 502)
	(= (distance city12 city4) 545)
	(= (distance city12 city5) 808)
	(= (distance city12 city6) 612)
	(= (distance city12 city7) 953)
	(= (distance city12 city8) 626)
	(= (distance city12 city9) 967)
	(= (distance city12 city10) 888)
	(= (distance city12 city11) 671)
	(= (distance city12 city12) 0)
	(= (distance city12 city13) 587)
	(= (distance city12 city14) 849)
	(= (distance city12 city15) 964)
	(= (distance city12 city16) 778)
	(= (distance city12 city17) 531)
	(= (distance city12 city18) 759)
	(= (distance city12 city19) 745)
	(= (distance city13 city0) 700)
	(= (distance city13 city1) 763)
	(= (distance city13 city2) 776)
	(= (distance city13 city3) 856)
	(= (distance city13 city4) 587)
	(= (distance city13 city5) 908)
	(= (distance city13 city6) 529)
	(= (distance city13 city7) 516)
	(= (distance city13 city8) 917)
	(= (distance city13 city9) 710)
	(= (distance city13 city10) 522)
	(= (distance city13 city11) 867)
	(= (distance city13 city12) 587)
	(= (distance city13 city13) 0)
	(= (distance city13 city14) 742)
	(= (distance city13 city15) 630)
	(= (distance city13 city16) 576)
	(= (distance city13 city17) 627)
	(= (distance city13 city18) 681)
	(= (distance city13 city19) 679)
	(= (distance city14 city0) 575)
	(= (distance city14 city1) 681)
	(= (distance city14 city2) 732)
	(= (distance city14 city3) 895)
	(= (distance city14 city4) 646)
	(= (distance city14 city5) 600)
	(= (distance city14 city6) 776)
	(= (distance city14 city7) 561)
	(= (distance city14 city8) 647)
	(= (distance city14 city9) 870)
	(= (distance city14 city10) 765)
	(= (distance city14 city11) 942)
	(= (distance city14 city12) 849)
	(= (distance city14 city13) 742)
	(= (distance city14 city14) 0)
	(= (distance city14 city15) 696)
	(= (distance city14 city16) 930)
	(= (distance city14 city17) 567)
	(= (distance city14 city18) 718)
	(= (distance city14 city19) 696)
	(= (distance city15 city0) 770)
	(= (distance city15 city1) 808)
	(= (distance city15 city2) 559)
	(= (distance city15 city3) 767)
	(= (distance city15 city4) 605)
	(= (distance city15 city5) 664)
	(= (distance city15 city6) 527)
	(= (distance city15 city7) 713)
	(= (distance city15 city8) 703)
	(= (distance city15 city9) 830)
	(= (distance city15 city10) 949)
	(= (distance city15 city11) 631)
	(= (distance city15 city12) 964)
	(= (distance city15 city13) 630)
	(= (distance city15 city14) 696)
	(= (distance city15 city15) 0)
	(= (distance city15 city16) 517)
	(= (distance city15 city17) 954)
	(= (distance city15 city18) 711)
	(= (distance city15 city19) 625)
	(= (distance city16 city0) 601)
	(= (distance city16 city1) 719)
	(= (distance city16 city2) 821)
	(= (distance city16 city3) 567)
	(= (distance city16 city4) 908)
	(= (distance city16 city5) 803)
	(= (distance city16 city6) 575)
	(= (distance city16 city7) 748)
	(= (distance city16 city8) 726)
	(= (distance city16 city9) 884)
	(= (distance city16 city10) 735)
	(= (distance city16 city11) 994)
	(= (distance city16 city12) 778)
	(= (distance city16 city13) 576)
	(= (distance city16 city14) 930)
	(= (distance city16 city15) 517)
	(= (distance city16 city16) 0)
	(= (distance city16 city17) 711)
	(= (distance city16 city18) 882)
	(= (distance city16 city19) 993)
	(= (distance city17 city0) 621)
	(= (distance city17 city1) 764)
	(= (distance city17 city2) 863)
	(= (distance city17 city3) 882)
	(= (distance city17 city4) 510)
	(= (distance city17 city5) 867)
	(= (distance city17 city6) 863)
	(= (distance city17 city7) 659)
	(= (distance city17 city8) 570)
	(= (distance city17 city9) 551)
	(= (distance city17 city10) 514)
	(= (distance city17 city11) 860)
	(= (distance city17 city12) 531)
	(= (distance city17 city13) 627)
	(= (distance city17 city14) 567)
	(= (distance city17 city15) 954)
	(= (distance city17 city16) 711)
	(= (distance city17 city17) 0)
	(= (distance city17 city18) 654)
	(= (distance city17 city19) 514)
	(= (distance city18 city0) 507)
	(= (distance city18 city1) 711)
	(= (distance city18 city2) 912)
	(= (distance city18 city3) 708)
	(= (distance city18 city4) 517)
	(= (distance city18 city5) 731)
	(= (distance city18 city6) 674)
	(= (distance city18 city7) 521)
	(= (distance city18 city8) 766)
	(= (distance city18 city9) 603)
	(= (distance city18 city10) 608)
	(= (distance city18 city11) 779)
	(= (distance city18 city12) 759)
	(= (distance city18 city13) 681)
	(= (distance city18 city14) 718)
	(= (distance city18 city15) 711)
	(= (distance city18 city16) 882)
	(= (distance city18 city17) 654)
	(= (distance city18 city18) 0)
	(= (distance city18 city19) 988)
	(= (distance city19 city0) 979)
	(= (distance city19 city1) 987)
	(= (distance city19 city2) 604)
	(= (distance city19 city3) 576)
	(= (distance city19 city4) 512)
	(= (distance city19 city5) 686)
	(= (distance city19 city6) 680)
	(= (distance city19 city7) 656)
	(= (distance city19 city8) 691)
	(= (distance city19 city9) 568)
	(= (distance city19 city10) 757)
	(= (distance city19 city11) 697)
	(= (distance city19 city12) 745)
	(= (distance city19 city13) 679)
	(= (distance city19 city14) 696)
	(= (distance city19 city15) 625)
	(= (distance city19 city16) 993)
	(= (distance city19 city17) 514)
	(= (distance city19 city18) 988)
	(= (distance city19 city19) 0)
	(= (total-fuel-used) 0)
)
(:goal (and
	(at plane1 city11)
	(at plane2 city8)
	(at person1 city10)
	(at person2 city1)
	(at person3 city13)
	(at person4 city9)
	(at person5 city0)
	(at person6 city16)
	(at person7 city0)
	(at person8 city0)
	(at person9 city17)
	(at person10 city13)
	(at person11 city13)
	(at person12 city17)
	(at person13 city3)
	(at person14 city0)
	(at person15 city13)
	(at person16 city19)
	(at person17 city0)
	(at person18 city4)
	(at person19 city17)
	(at person20 city14)
	(at person21 city17)
	(at person22 city4)
	(at person23 city12)
	(at person24 city13)
	(at person25 city2)
	))

;(:metric minimize (+ (* 1 (total-time))  (* 3 (total-fuel-used))))
)
