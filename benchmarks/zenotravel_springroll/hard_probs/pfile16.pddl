(define (problem ZTRAVEL-15-70)
(:domain zeno-travel)
(:objects
	plane1 - aircraft
	plane2 - aircraft
	plane3 - aircraft
	plane4 - aircraft
	plane5 - aircraft
	plane6 - aircraft
	plane7 - aircraft
	plane8 - aircraft
	plane9 - aircraft
	plane10 - aircraft
	plane11 - aircraft
	plane12 - aircraft
	plane13 - aircraft
	plane14 - aircraft
	plane15 - aircraft
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
	person26 - person
	person27 - person
	person28 - person
	person29 - person
	person30 - person
	person31 - person
	person32 - person
	person33 - person
	person34 - person
	person35 - person
	person36 - person
	person37 - person
	person38 - person
	person39 - person
	person40 - person
	person41 - person
	person42 - person
	person43 - person
	person44 - person
	person45 - person
	person46 - person
	person47 - person
	person48 - person
	person49 - person
	person50 - person
	person51 - person
	person52 - person
	person53 - person
	person54 - person
	person55 - person
	person56 - person
	person57 - person
	person58 - person
	person59 - person
	person60 - person
	person61 - person
	person62 - person
	person63 - person
	person64 - person
	person65 - person
	person66 - person
	person67 - person
	person68 - person
	person69 - person
	person70 - person
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
	city20 - city
	city21 - city
	city22 - city
	city23 - city
	city24 - city
	)
(:init
	(at plane1 city12)
	(= (capacity plane1) 2747)
	(= (fuel plane1) 817)
	(= (slow-burn plane1) 1)
	(= (fast-burn plane1) 3)
	(= (onboard plane1) 0)
	(= (zoom-limit plane1) 2)
	(at plane2 city6)
	(= (capacity plane2) 12976)
	(= (fuel plane2) 2169)
	(= (slow-burn plane2) 5)
	(= (fast-burn plane2) 14)
	(= (onboard plane2) 0)
	(= (zoom-limit plane2) 1)
	(at plane3 city13)
	(= (capacity plane3) 5766)
	(= (fuel plane3) 1370)
	(= (slow-burn plane3) 2)
	(= (fast-burn plane3) 6)
	(= (onboard plane3) 0)
	(= (zoom-limit plane3) 8)
	(at plane4 city3)
	(= (capacity plane4) 4693)
	(= (fuel plane4) 1927)
	(= (slow-burn plane4) 2)
	(= (fast-burn plane4) 4)
	(= (onboard plane4) 0)
	(= (zoom-limit plane4) 1)
	(at plane5 city2)
	(= (capacity plane5) 6401)
	(= (fuel plane5) 1049)
	(= (slow-burn plane5) 3)
	(= (fast-burn plane5) 8)
	(= (onboard plane5) 0)
	(= (zoom-limit plane5) 7)
	(at plane6 city20)
	(= (capacity plane6) 9221)
	(= (fuel plane6) 2668)
	(= (slow-burn plane6) 3)
	(= (fast-burn plane6) 9)
	(= (onboard plane6) 0)
	(= (zoom-limit plane6) 9)
	(at plane7 city22)
	(= (capacity plane7) 5156)
	(= (fuel plane7) 877)
	(= (slow-burn plane7) 2)
	(= (fast-burn plane7) 5)
	(= (onboard plane7) 0)
	(= (zoom-limit plane7) 5)
	(at plane8 city5)
	(= (capacity plane8) 5413)
	(= (fuel plane8) 320)
	(= (slow-burn plane8) 2)
	(= (fast-burn plane8) 7)
	(= (onboard plane8) 0)
	(= (zoom-limit plane8) 7)
	(at plane9 city19)
	(= (capacity plane9) 4200)
	(= (fuel plane9) 69)
	(= (slow-burn plane9) 2)
	(= (fast-burn plane9) 7)
	(= (onboard plane9) 0)
	(= (zoom-limit plane9) 2)
	(at plane10 city17)
	(= (capacity plane10) 2610)
	(= (fuel plane10) 603)
	(= (slow-burn plane10) 1)
	(= (fast-burn plane10) 2)
	(= (onboard plane10) 0)
	(= (zoom-limit plane10) 1)
	(at plane11 city16)
	(= (capacity plane11) 2132)
	(= (fuel plane11) 142)
	(= (slow-burn plane11) 1)
	(= (fast-burn plane11) 3)
	(= (onboard plane11) 0)
	(= (zoom-limit plane11) 5)
	(at plane12 city20)
	(= (capacity plane12) 2146)
	(= (fuel plane12) 450)
	(= (slow-burn plane12) 1)
	(= (fast-burn plane12) 3)
	(= (onboard plane12) 0)
	(= (zoom-limit plane12) 9)
	(at plane13 city16)
	(= (capacity plane13) 7879)
	(= (fuel plane13) 2534)
	(= (slow-burn plane13) 3)
	(= (fast-burn plane13) 11)
	(= (onboard plane13) 0)
	(= (zoom-limit plane13) 3)
	(at plane14 city18)
	(= (capacity plane14) 4511)
	(= (fuel plane14) 254)
	(= (slow-burn plane14) 2)
	(= (fast-burn plane14) 6)
	(= (onboard plane14) 0)
	(= (zoom-limit plane14) 1)
	(at plane15 city9)
	(= (capacity plane15) 2869)
	(= (fuel plane15) 73)
	(= (slow-burn plane15) 1)
	(= (fast-burn plane15) 3)
	(= (onboard plane15) 0)
	(= (zoom-limit plane15) 8)
	(at person1 city4)
	(at person2 city17)
	(at person3 city6)
	(at person4 city24)
	(at person5 city18)
	(at person6 city0)
	(at person7 city1)
	(at person8 city23)
	(at person9 city0)
	(at person10 city24)
	(at person11 city24)
	(at person12 city19)
	(at person13 city12)
	(at person14 city10)
	(at person15 city17)
	(at person16 city3)
	(at person17 city20)
	(at person18 city21)
	(at person19 city8)
	(at person20 city21)
	(at person21 city2)
	(at person22 city6)
	(at person23 city22)
	(at person24 city6)
	(at person25 city22)
	(at person26 city21)
	(at person27 city18)
	(at person28 city5)
	(at person29 city12)
	(at person30 city6)
	(at person31 city6)
	(at person32 city16)
	(at person33 city3)
	(at person34 city0)
	(at person35 city6)
	(at person36 city15)
	(at person37 city3)
	(at person38 city20)
	(at person39 city16)
	(at person40 city17)
	(at person41 city22)
	(at person42 city4)
	(at person43 city10)
	(at person44 city1)
	(at person45 city14)
	(at person46 city15)
	(at person47 city9)
	(at person48 city16)
	(at person49 city8)
	(at person50 city18)
	(at person51 city18)
	(at person52 city11)
	(at person53 city2)
	(at person54 city16)
	(at person55 city7)
	(at person56 city24)
	(at person57 city13)
	(at person58 city18)
	(at person59 city19)
	(at person60 city4)
	(at person61 city5)
	(at person62 city4)
	(at person63 city15)
	(at person64 city19)
	(at person65 city15)
	(at person66 city11)
	(at person67 city21)
	(at person68 city24)
	(at person69 city16)
	(at person70 city12)
	(= (distance city0 city0) 0)
	(= (distance city0 city1) 659)
	(= (distance city0 city2) 643)
	(= (distance city0 city3) 904)
	(= (distance city0 city4) 633)
	(= (distance city0 city5) 520)
	(= (distance city0 city6) 585)
	(= (distance city0 city7) 793)
	(= (distance city0 city8) 972)
	(= (distance city0 city9) 641)
	(= (distance city0 city10) 802)
	(= (distance city0 city11) 769)
	(= (distance city0 city12) 947)
	(= (distance city0 city13) 657)
	(= (distance city0 city14) 696)
	(= (distance city0 city15) 942)
	(= (distance city0 city16) 635)
	(= (distance city0 city17) 734)
	(= (distance city0 city18) 521)
	(= (distance city0 city19) 780)
	(= (distance city0 city20) 577)
	(= (distance city0 city21) 915)
	(= (distance city0 city22) 610)
	(= (distance city0 city23) 841)
	(= (distance city0 city24) 573)
	(= (distance city1 city0) 659)
	(= (distance city1 city1) 0)
	(= (distance city1 city2) 852)
	(= (distance city1 city3) 533)
	(= (distance city1 city4) 658)
	(= (distance city1 city5) 687)
	(= (distance city1 city6) 635)
	(= (distance city1 city7) 959)
	(= (distance city1 city8) 901)
	(= (distance city1 city9) 795)
	(= (distance city1 city10) 603)
	(= (distance city1 city11) 806)
	(= (distance city1 city12) 928)
	(= (distance city1 city13) 624)
	(= (distance city1 city14) 891)
	(= (distance city1 city15) 722)
	(= (distance city1 city16) 596)
	(= (distance city1 city17) 533)
	(= (distance city1 city18) 524)
	(= (distance city1 city19) 866)
	(= (distance city1 city20) 981)
	(= (distance city1 city21) 682)
	(= (distance city1 city22) 563)
	(= (distance city1 city23) 924)
	(= (distance city1 city24) 817)
	(= (distance city2 city0) 643)
	(= (distance city2 city1) 852)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 797)
	(= (distance city2 city4) 945)
	(= (distance city2 city5) 598)
	(= (distance city2 city6) 875)
	(= (distance city2 city7) 860)
	(= (distance city2 city8) 709)
	(= (distance city2 city9) 717)
	(= (distance city2 city10) 934)
	(= (distance city2 city11) 561)
	(= (distance city2 city12) 751)
	(= (distance city2 city13) 592)
	(= (distance city2 city14) 749)
	(= (distance city2 city15) 887)
	(= (distance city2 city16) 552)
	(= (distance city2 city17) 650)
	(= (distance city2 city18) 682)
	(= (distance city2 city19) 655)
	(= (distance city2 city20) 957)
	(= (distance city2 city21) 611)
	(= (distance city2 city22) 779)
	(= (distance city2 city23) 848)
	(= (distance city2 city24) 834)
	(= (distance city3 city0) 904)
	(= (distance city3 city1) 533)
	(= (distance city3 city2) 797)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 876)
	(= (distance city3 city5) 882)
	(= (distance city3 city6) 858)
	(= (distance city3 city7) 742)
	(= (distance city3 city8) 863)
	(= (distance city3 city9) 541)
	(= (distance city3 city10) 805)
	(= (distance city3 city11) 787)
	(= (distance city3 city12) 858)
	(= (distance city3 city13) 603)
	(= (distance city3 city14) 732)
	(= (distance city3 city15) 957)
	(= (distance city3 city16) 978)
	(= (distance city3 city17) 593)
	(= (distance city3 city18) 666)
	(= (distance city3 city19) 695)
	(= (distance city3 city20) 528)
	(= (distance city3 city21) 728)
	(= (distance city3 city22) 947)
	(= (distance city3 city23) 620)
	(= (distance city3 city24) 977)
	(= (distance city4 city0) 633)
	(= (distance city4 city1) 658)
	(= (distance city4 city2) 945)
	(= (distance city4 city3) 876)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 834)
	(= (distance city4 city6) 672)
	(= (distance city4 city7) 628)
	(= (distance city4 city8) 517)
	(= (distance city4 city9) 828)
	(= (distance city4 city10) 585)
	(= (distance city4 city11) 628)
	(= (distance city4 city12) 607)
	(= (distance city4 city13) 934)
	(= (distance city4 city14) 963)
	(= (distance city4 city15) 983)
	(= (distance city4 city16) 816)
	(= (distance city4 city17) 821)
	(= (distance city4 city18) 726)
	(= (distance city4 city19) 680)
	(= (distance city4 city20) 863)
	(= (distance city4 city21) 531)
	(= (distance city4 city22) 967)
	(= (distance city4 city23) 722)
	(= (distance city4 city24) 634)
	(= (distance city5 city0) 520)
	(= (distance city5 city1) 687)
	(= (distance city5 city2) 598)
	(= (distance city5 city3) 882)
	(= (distance city5 city4) 834)
	(= (distance city5 city5) 0)
	(= (distance city5 city6) 700)
	(= (distance city5 city7) 679)
	(= (distance city5 city8) 613)
	(= (distance city5 city9) 794)
	(= (distance city5 city10) 846)
	(= (distance city5 city11) 809)
	(= (distance city5 city12) 822)
	(= (distance city5 city13) 575)
	(= (distance city5 city14) 756)
	(= (distance city5 city15) 943)
	(= (distance city5 city16) 552)
	(= (distance city5 city17) 590)
	(= (distance city5 city18) 616)
	(= (distance city5 city19) 681)
	(= (distance city5 city20) 607)
	(= (distance city5 city21) 944)
	(= (distance city5 city22) 766)
	(= (distance city5 city23) 736)
	(= (distance city5 city24) 552)
	(= (distance city6 city0) 585)
	(= (distance city6 city1) 635)
	(= (distance city6 city2) 875)
	(= (distance city6 city3) 858)
	(= (distance city6 city4) 672)
	(= (distance city6 city5) 700)
	(= (distance city6 city6) 0)
	(= (distance city6 city7) 701)
	(= (distance city6 city8) 699)
	(= (distance city6 city9) 535)
	(= (distance city6 city10) 518)
	(= (distance city6 city11) 521)
	(= (distance city6 city12) 762)
	(= (distance city6 city13) 698)
	(= (distance city6 city14) 884)
	(= (distance city6 city15) 793)
	(= (distance city6 city16) 666)
	(= (distance city6 city17) 606)
	(= (distance city6 city18) 928)
	(= (distance city6 city19) 867)
	(= (distance city6 city20) 786)
	(= (distance city6 city21) 542)
	(= (distance city6 city22) 661)
	(= (distance city6 city23) 632)
	(= (distance city6 city24) 851)
	(= (distance city7 city0) 793)
	(= (distance city7 city1) 959)
	(= (distance city7 city2) 860)
	(= (distance city7 city3) 742)
	(= (distance city7 city4) 628)
	(= (distance city7 city5) 679)
	(= (distance city7 city6) 701)
	(= (distance city7 city7) 0)
	(= (distance city7 city8) 984)
	(= (distance city7 city9) 707)
	(= (distance city7 city10) 607)
	(= (distance city7 city11) 927)
	(= (distance city7 city12) 760)
	(= (distance city7 city13) 698)
	(= (distance city7 city14) 543)
	(= (distance city7 city15) 941)
	(= (distance city7 city16) 806)
	(= (distance city7 city17) 988)
	(= (distance city7 city18) 708)
	(= (distance city7 city19) 543)
	(= (distance city7 city20) 540)
	(= (distance city7 city21) 910)
	(= (distance city7 city22) 742)
	(= (distance city7 city23) 576)
	(= (distance city7 city24) 928)
	(= (distance city8 city0) 972)
	(= (distance city8 city1) 901)
	(= (distance city8 city2) 709)
	(= (distance city8 city3) 863)
	(= (distance city8 city4) 517)
	(= (distance city8 city5) 613)
	(= (distance city8 city6) 699)
	(= (distance city8 city7) 984)
	(= (distance city8 city8) 0)
	(= (distance city8 city9) 764)
	(= (distance city8 city10) 838)
	(= (distance city8 city11) 627)
	(= (distance city8 city12) 649)
	(= (distance city8 city13) 632)
	(= (distance city8 city14) 793)
	(= (distance city8 city15) 756)
	(= (distance city8 city16) 561)
	(= (distance city8 city17) 661)
	(= (distance city8 city18) 542)
	(= (distance city8 city19) 603)
	(= (distance city8 city20) 823)
	(= (distance city8 city21) 675)
	(= (distance city8 city22) 954)
	(= (distance city8 city23) 807)
	(= (distance city8 city24) 883)
	(= (distance city9 city0) 641)
	(= (distance city9 city1) 795)
	(= (distance city9 city2) 717)
	(= (distance city9 city3) 541)
	(= (distance city9 city4) 828)
	(= (distance city9 city5) 794)
	(= (distance city9 city6) 535)
	(= (distance city9 city7) 707)
	(= (distance city9 city8) 764)
	(= (distance city9 city9) 0)
	(= (distance city9 city10) 562)
	(= (distance city9 city11) 734)
	(= (distance city9 city12) 643)
	(= (distance city9 city13) 761)
	(= (distance city9 city14) 778)
	(= (distance city9 city15) 585)
	(= (distance city9 city16) 567)
	(= (distance city9 city17) 766)
	(= (distance city9 city18) 794)
	(= (distance city9 city19) 610)
	(= (distance city9 city20) 806)
	(= (distance city9 city21) 704)
	(= (distance city9 city22) 853)
	(= (distance city9 city23) 882)
	(= (distance city9 city24) 633)
	(= (distance city10 city0) 802)
	(= (distance city10 city1) 603)
	(= (distance city10 city2) 934)
	(= (distance city10 city3) 805)
	(= (distance city10 city4) 585)
	(= (distance city10 city5) 846)
	(= (distance city10 city6) 518)
	(= (distance city10 city7) 607)
	(= (distance city10 city8) 838)
	(= (distance city10 city9) 562)
	(= (distance city10 city10) 0)
	(= (distance city10 city11) 618)
	(= (distance city10 city12) 721)
	(= (distance city10 city13) 761)
	(= (distance city10 city14) 767)
	(= (distance city10 city15) 853)
	(= (distance city10 city16) 555)
	(= (distance city10 city17) 524)
	(= (distance city10 city18) 914)
	(= (distance city10 city19) 716)
	(= (distance city10 city20) 566)
	(= (distance city10 city21) 517)
	(= (distance city10 city22) 539)
	(= (distance city10 city23) 741)
	(= (distance city10 city24) 972)
	(= (distance city11 city0) 769)
	(= (distance city11 city1) 806)
	(= (distance city11 city2) 561)
	(= (distance city11 city3) 787)
	(= (distance city11 city4) 628)
	(= (distance city11 city5) 809)
	(= (distance city11 city6) 521)
	(= (distance city11 city7) 927)
	(= (distance city11 city8) 627)
	(= (distance city11 city9) 734)
	(= (distance city11 city10) 618)
	(= (distance city11 city11) 0)
	(= (distance city11 city12) 846)
	(= (distance city11 city13) 625)
	(= (distance city11 city14) 535)
	(= (distance city11 city15) 581)
	(= (distance city11 city16) 769)
	(= (distance city11 city17) 796)
	(= (distance city11 city18) 860)
	(= (distance city11 city19) 854)
	(= (distance city11 city20) 864)
	(= (distance city11 city21) 626)
	(= (distance city11 city22) 649)
	(= (distance city11 city23) 975)
	(= (distance city11 city24) 933)
	(= (distance city12 city0) 947)
	(= (distance city12 city1) 928)
	(= (distance city12 city2) 751)
	(= (distance city12 city3) 858)
	(= (distance city12 city4) 607)
	(= (distance city12 city5) 822)
	(= (distance city12 city6) 762)
	(= (distance city12 city7) 760)
	(= (distance city12 city8) 649)
	(= (distance city12 city9) 643)
	(= (distance city12 city10) 721)
	(= (distance city12 city11) 846)
	(= (distance city12 city12) 0)
	(= (distance city12 city13) 854)
	(= (distance city12 city14) 828)
	(= (distance city12 city15) 816)
	(= (distance city12 city16) 988)
	(= (distance city12 city17) 947)
	(= (distance city12 city18) 537)
	(= (distance city12 city19) 749)
	(= (distance city12 city20) 715)
	(= (distance city12 city21) 890)
	(= (distance city12 city22) 804)
	(= (distance city12 city23) 739)
	(= (distance city12 city24) 804)
	(= (distance city13 city0) 657)
	(= (distance city13 city1) 624)
	(= (distance city13 city2) 592)
	(= (distance city13 city3) 603)
	(= (distance city13 city4) 934)
	(= (distance city13 city5) 575)
	(= (distance city13 city6) 698)
	(= (distance city13 city7) 698)
	(= (distance city13 city8) 632)
	(= (distance city13 city9) 761)
	(= (distance city13 city10) 761)
	(= (distance city13 city11) 625)
	(= (distance city13 city12) 854)
	(= (distance city13 city13) 0)
	(= (distance city13 city14) 520)
	(= (distance city13 city15) 805)
	(= (distance city13 city16) 822)
	(= (distance city13 city17) 560)
	(= (distance city13 city18) 547)
	(= (distance city13 city19) 795)
	(= (distance city13 city20) 906)
	(= (distance city13 city21) 673)
	(= (distance city13 city22) 830)
	(= (distance city13 city23) 988)
	(= (distance city13 city24) 942)
	(= (distance city14 city0) 696)
	(= (distance city14 city1) 891)
	(= (distance city14 city2) 749)
	(= (distance city14 city3) 732)
	(= (distance city14 city4) 963)
	(= (distance city14 city5) 756)
	(= (distance city14 city6) 884)
	(= (distance city14 city7) 543)
	(= (distance city14 city8) 793)
	(= (distance city14 city9) 778)
	(= (distance city14 city10) 767)
	(= (distance city14 city11) 535)
	(= (distance city14 city12) 828)
	(= (distance city14 city13) 520)
	(= (distance city14 city14) 0)
	(= (distance city14 city15) 627)
	(= (distance city14 city16) 848)
	(= (distance city14 city17) 797)
	(= (distance city14 city18) 991)
	(= (distance city14 city19) 975)
	(= (distance city14 city20) 946)
	(= (distance city14 city21) 966)
	(= (distance city14 city22) 908)
	(= (distance city14 city23) 801)
	(= (distance city14 city24) 795)
	(= (distance city15 city0) 942)
	(= (distance city15 city1) 722)
	(= (distance city15 city2) 887)
	(= (distance city15 city3) 957)
	(= (distance city15 city4) 983)
	(= (distance city15 city5) 943)
	(= (distance city15 city6) 793)
	(= (distance city15 city7) 941)
	(= (distance city15 city8) 756)
	(= (distance city15 city9) 585)
	(= (distance city15 city10) 853)
	(= (distance city15 city11) 581)
	(= (distance city15 city12) 816)
	(= (distance city15 city13) 805)
	(= (distance city15 city14) 627)
	(= (distance city15 city15) 0)
	(= (distance city15 city16) 724)
	(= (distance city15 city17) 789)
	(= (distance city15 city18) 743)
	(= (distance city15 city19) 761)
	(= (distance city15 city20) 539)
	(= (distance city15 city21) 958)
	(= (distance city15 city22) 652)
	(= (distance city15 city23) 843)
	(= (distance city15 city24) 697)
	(= (distance city16 city0) 635)
	(= (distance city16 city1) 596)
	(= (distance city16 city2) 552)
	(= (distance city16 city3) 978)
	(= (distance city16 city4) 816)
	(= (distance city16 city5) 552)
	(= (distance city16 city6) 666)
	(= (distance city16 city7) 806)
	(= (distance city16 city8) 561)
	(= (distance city16 city9) 567)
	(= (distance city16 city10) 555)
	(= (distance city16 city11) 769)
	(= (distance city16 city12) 988)
	(= (distance city16 city13) 822)
	(= (distance city16 city14) 848)
	(= (distance city16 city15) 724)
	(= (distance city16 city16) 0)
	(= (distance city16 city17) 957)
	(= (distance city16 city18) 864)
	(= (distance city16 city19) 503)
	(= (distance city16 city20) 779)
	(= (distance city16 city21) 924)
	(= (distance city16 city22) 550)
	(= (distance city16 city23) 575)
	(= (distance city16 city24) 831)
	(= (distance city17 city0) 734)
	(= (distance city17 city1) 533)
	(= (distance city17 city2) 650)
	(= (distance city17 city3) 593)
	(= (distance city17 city4) 821)
	(= (distance city17 city5) 590)
	(= (distance city17 city6) 606)
	(= (distance city17 city7) 988)
	(= (distance city17 city8) 661)
	(= (distance city17 city9) 766)
	(= (distance city17 city10) 524)
	(= (distance city17 city11) 796)
	(= (distance city17 city12) 947)
	(= (distance city17 city13) 560)
	(= (distance city17 city14) 797)
	(= (distance city17 city15) 789)
	(= (distance city17 city16) 957)
	(= (distance city17 city17) 0)
	(= (distance city17 city18) 724)
	(= (distance city17 city19) 905)
	(= (distance city17 city20) 819)
	(= (distance city17 city21) 666)
	(= (distance city17 city22) 533)
	(= (distance city17 city23) 668)
	(= (distance city17 city24) 963)
	(= (distance city18 city0) 521)
	(= (distance city18 city1) 524)
	(= (distance city18 city2) 682)
	(= (distance city18 city3) 666)
	(= (distance city18 city4) 726)
	(= (distance city18 city5) 616)
	(= (distance city18 city6) 928)
	(= (distance city18 city7) 708)
	(= (distance city18 city8) 542)
	(= (distance city18 city9) 794)
	(= (distance city18 city10) 914)
	(= (distance city18 city11) 860)
	(= (distance city18 city12) 537)
	(= (distance city18 city13) 547)
	(= (distance city18 city14) 991)
	(= (distance city18 city15) 743)
	(= (distance city18 city16) 864)
	(= (distance city18 city17) 724)
	(= (distance city18 city18) 0)
	(= (distance city18 city19) 525)
	(= (distance city18 city20) 643)
	(= (distance city18 city21) 910)
	(= (distance city18 city22) 992)
	(= (distance city18 city23) 552)
	(= (distance city18 city24) 711)
	(= (distance city19 city0) 780)
	(= (distance city19 city1) 866)
	(= (distance city19 city2) 655)
	(= (distance city19 city3) 695)
	(= (distance city19 city4) 680)
	(= (distance city19 city5) 681)
	(= (distance city19 city6) 867)
	(= (distance city19 city7) 543)
	(= (distance city19 city8) 603)
	(= (distance city19 city9) 610)
	(= (distance city19 city10) 716)
	(= (distance city19 city11) 854)
	(= (distance city19 city12) 749)
	(= (distance city19 city13) 795)
	(= (distance city19 city14) 975)
	(= (distance city19 city15) 761)
	(= (distance city19 city16) 503)
	(= (distance city19 city17) 905)
	(= (distance city19 city18) 525)
	(= (distance city19 city19) 0)
	(= (distance city19 city20) 788)
	(= (distance city19 city21) 776)
	(= (distance city19 city22) 501)
	(= (distance city19 city23) 531)
	(= (distance city19 city24) 538)
	(= (distance city20 city0) 577)
	(= (distance city20 city1) 981)
	(= (distance city20 city2) 957)
	(= (distance city20 city3) 528)
	(= (distance city20 city4) 863)
	(= (distance city20 city5) 607)
	(= (distance city20 city6) 786)
	(= (distance city20 city7) 540)
	(= (distance city20 city8) 823)
	(= (distance city20 city9) 806)
	(= (distance city20 city10) 566)
	(= (distance city20 city11) 864)
	(= (distance city20 city12) 715)
	(= (distance city20 city13) 906)
	(= (distance city20 city14) 946)
	(= (distance city20 city15) 539)
	(= (distance city20 city16) 779)
	(= (distance city20 city17) 819)
	(= (distance city20 city18) 643)
	(= (distance city20 city19) 788)
	(= (distance city20 city20) 0)
	(= (distance city20 city21) 540)
	(= (distance city20 city22) 989)
	(= (distance city20 city23) 690)
	(= (distance city20 city24) 884)
	(= (distance city21 city0) 915)
	(= (distance city21 city1) 682)
	(= (distance city21 city2) 611)
	(= (distance city21 city3) 728)
	(= (distance city21 city4) 531)
	(= (distance city21 city5) 944)
	(= (distance city21 city6) 542)
	(= (distance city21 city7) 910)
	(= (distance city21 city8) 675)
	(= (distance city21 city9) 704)
	(= (distance city21 city10) 517)
	(= (distance city21 city11) 626)
	(= (distance city21 city12) 890)
	(= (distance city21 city13) 673)
	(= (distance city21 city14) 966)
	(= (distance city21 city15) 958)
	(= (distance city21 city16) 924)
	(= (distance city21 city17) 666)
	(= (distance city21 city18) 910)
	(= (distance city21 city19) 776)
	(= (distance city21 city20) 540)
	(= (distance city21 city21) 0)
	(= (distance city21 city22) 686)
	(= (distance city21 city23) 647)
	(= (distance city21 city24) 748)
	(= (distance city22 city0) 610)
	(= (distance city22 city1) 563)
	(= (distance city22 city2) 779)
	(= (distance city22 city3) 947)
	(= (distance city22 city4) 967)
	(= (distance city22 city5) 766)
	(= (distance city22 city6) 661)
	(= (distance city22 city7) 742)
	(= (distance city22 city8) 954)
	(= (distance city22 city9) 853)
	(= (distance city22 city10) 539)
	(= (distance city22 city11) 649)
	(= (distance city22 city12) 804)
	(= (distance city22 city13) 830)
	(= (distance city22 city14) 908)
	(= (distance city22 city15) 652)
	(= (distance city22 city16) 550)
	(= (distance city22 city17) 533)
	(= (distance city22 city18) 992)
	(= (distance city22 city19) 501)
	(= (distance city22 city20) 989)
	(= (distance city22 city21) 686)
	(= (distance city22 city22) 0)
	(= (distance city22 city23) 689)
	(= (distance city22 city24) 927)
	(= (distance city23 city0) 841)
	(= (distance city23 city1) 924)
	(= (distance city23 city2) 848)
	(= (distance city23 city3) 620)
	(= (distance city23 city4) 722)
	(= (distance city23 city5) 736)
	(= (distance city23 city6) 632)
	(= (distance city23 city7) 576)
	(= (distance city23 city8) 807)
	(= (distance city23 city9) 882)
	(= (distance city23 city10) 741)
	(= (distance city23 city11) 975)
	(= (distance city23 city12) 739)
	(= (distance city23 city13) 988)
	(= (distance city23 city14) 801)
	(= (distance city23 city15) 843)
	(= (distance city23 city16) 575)
	(= (distance city23 city17) 668)
	(= (distance city23 city18) 552)
	(= (distance city23 city19) 531)
	(= (distance city23 city20) 690)
	(= (distance city23 city21) 647)
	(= (distance city23 city22) 689)
	(= (distance city23 city23) 0)
	(= (distance city23 city24) 672)
	(= (distance city24 city0) 573)
	(= (distance city24 city1) 817)
	(= (distance city24 city2) 834)
	(= (distance city24 city3) 977)
	(= (distance city24 city4) 634)
	(= (distance city24 city5) 552)
	(= (distance city24 city6) 851)
	(= (distance city24 city7) 928)
	(= (distance city24 city8) 883)
	(= (distance city24 city9) 633)
	(= (distance city24 city10) 972)
	(= (distance city24 city11) 933)
	(= (distance city24 city12) 804)
	(= (distance city24 city13) 942)
	(= (distance city24 city14) 795)
	(= (distance city24 city15) 697)
	(= (distance city24 city16) 831)
	(= (distance city24 city17) 963)
	(= (distance city24 city18) 711)
	(= (distance city24 city19) 538)
	(= (distance city24 city20) 884)
	(= (distance city24 city21) 748)
	(= (distance city24 city22) 927)
	(= (distance city24 city23) 672)
	(= (distance city24 city24) 0)
	(= (total-fuel-used) 0)
)
(:goal (and
	(at plane1 city0)
	(at plane5 city10)
	(at plane7 city16)
	(at plane12 city4)
	(at plane14 city12)
	(at plane15 city22)
	(at person1 city22)
	(at person2 city12)
	(at person3 city18)
	(at person4 city6)
	(at person5 city9)
	(at person6 city22)
	(at person7 city15)
	(at person8 city19)
	(at person9 city13)
	(at person10 city5)
	(at person11 city9)
	(at person12 city2)
	(at person13 city9)
	(at person14 city9)
	(at person15 city3)
	(at person16 city3)
	(at person17 city4)
	(at person18 city3)
	(at person19 city4)
	(at person20 city4)
	(at person21 city3)
	(at person22 city22)
	(at person23 city10)
	(at person24 city21)
	(at person25 city14)
	(at person26 city17)
	(at person27 city13)
	(at person28 city9)
	(at person30 city14)
	(at person31 city17)
	(at person32 city24)
	(at person33 city21)
	(at person34 city3)
	(at person35 city0)
	(at person36 city21)
	(at person37 city15)
	(at person38 city21)
	(at person39 city8)
	(at person41 city22)
	(at person42 city13)
	(at person43 city17)
	(at person44 city17)
	(at person45 city24)
	(at person46 city14)
	(at person47 city17)
	(at person48 city13)
	(at person49 city4)
	(at person50 city22)
	(at person51 city19)
	(at person52 city23)
	(at person53 city9)
	(at person54 city11)
	(at person55 city0)
	(at person56 city15)
	(at person57 city24)
	(at person58 city16)
	(at person59 city24)
	(at person60 city18)
	(at person61 city12)
	(at person62 city23)
	(at person63 city1)
	(at person64 city17)
	(at person65 city0)
	(at person66 city0)
	(at person67 city14)
	(at person68 city7)
	(at person69 city2)
	(at person70 city7)
	))

;(:metric minimize (+ (* 3 (total-time))  (* 2 (total-fuel-used))))
)
