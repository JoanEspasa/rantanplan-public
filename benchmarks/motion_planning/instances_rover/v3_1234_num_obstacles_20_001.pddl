(define

;;@problem_name@v3_1234_num_obstacles_20_001
(problem v3_1234_num_obstacles_20_001)

(:domain motion_planning_v3)

(:objects

  obstacle_0 obstacle_1 obstacle_2 obstacle_3 obstacle_4 obstacle_5 obstacle_6 obstacle_7 obstacle_8 obstacle_9 obstacle_10 obstacle_11 obstacle_12 obstacle_13 obstacle_14 obstacle_15 obstacle_16 obstacle_17 obstacle_18 obstacle_19  - obstacle
  t1  - waypoint
  r - rover
)

(:init

    		;;@energy@["r", 60]
		(= (energy r) 60)
    		;;@max_energy@["r", 100]
		(= (max_energy r) 100)
    		;;@location@["r", [-54, -43]]
		(= (x r) -54) (= (y r) -43)

    		;;@location@["t1", [-51, 47]]
		(= (x t1) -51) (= (y t1) 47)
    ;;@waypoint_area@t1@{"coordinates": [[-56.130350530022575, 48.66053201842261], [-51.6484594230626, 42.47125382309693], [-41.40413689286836, 47.59341508819404], [-48.233685246331184, 49.94107233469689]]}
(= (a1 t1) 6.189278195325677) (= (b1 t1) 4.481891106959978) (= (c1 t1) -129.31514891814624)
(= (a2 t1) -5.1221612650971124) (= (b2 t1) 10.244322530194239) (= (c2 t1) 699.6409606843013)
(= (a3 t1) -2.3476572465028482) (= (b3 t1) -6.829548353462826) (= (c3 t1) -227.8388076395101)
(= (a4 t1) 1.2805403162742834) (= (b4 t1) -7.896665283691391) (= (c4 t1) -456.1331106961327)

    ;;@bounding_box@ {"coordinates": [[36.54542799102555, -47.637339260351624], [-58.9321615832166, -47.637339260351624], [-58.9321615832166, 49.52534572531642], [36.54542799102555, 49.52534572531642]]}
(= (max_x) 36.54542799102555) (= (max_y) 49.52534572531642) (= (min_x) -58.9321615832166) (= (min_y) -47.637339260351624)

    ;;@obstacle@ {"coordinates": [[-39.56954440506597, 36.41063655274656], [-58.9321615832166, 36.41063655274656], [-58.9321615832166, 45.78455593707826], [-39.56954440506597, 45.78455593707826]]}
(= (a1 obstacle_0) 0.0) (= (b1 obstacle_0) -19.36261717815063) (= (c1 obstacle_0) -705.0052167836097)
(= (a2 obstacle_0) -9.3739193843317) (= (b2 obstacle_0) 0.0) (= (c2 obstacle_0) 552.425331825482)
(= (a3 obstacle_0) 0.0) (= (b3 obstacle_0) 19.36261717815063) (= (c3 obstacle_0) 886.5088292812699)
(= (a4 obstacle_0) 9.3739193843317) (= (b4 obstacle_0) 0.0) (= (c4 obstacle_0) -370.92171932782185)
;;@obstacle@ {"coordinates": [[26.57940362375426, -47.637339260351624], [7.733292673842742, -47.637339260351624], [7.733292673842742, -35.57501537223159], [26.57940362375426, -35.57501537223159]]}
(= (a1 obstacle_1) 0.0) (= (b1 obstacle_1) -18.84611094991152) (= (c1 obstacle_1) 897.7785810591627)
(= (a2 obstacle_1) -12.062323888120034) (= (b2 obstacle_1) 0.0) (= (c2 obstacle_1) -93.28148095351696)
(= (a3 obstacle_1) 0.0) (= (b3 obstacle_1) 18.84611094991152) (= (c3 obstacle_1) -670.4506867498844)
(= (a4 obstacle_1) 12.062323888120034) (= (b4 obstacle_1) 0.0) (= (c4 obstacle_1) 320.6093752627952)
;;@obstacle@ {"coordinates": [[-39.13702896581694, 26.127578857678735], [-54.700166688861074, 26.127578857678735], [-54.700166688861074, 31.626964589577973], [-39.13702896581694, 31.626964589577973]]}
(= (a1 obstacle_2) 0.0) (= (b1 obstacle_2) -15.563137723044136) (= (c1 obstacle_2) -406.62710813175033)
(= (a2 obstacle_2) -5.499385731899238) (= (b2 obstacle_2) 0.0) (= (c2 obstacle_2) 300.8173162212326)
(= (a3 obstacle_2) 0.0) (= (b3 obstacle_2) 15.563137723044136) (= (c3 obstacle_2) 492.21480566944206)
(= (a4 obstacle_2) 5.499385731899238) (= (b4 obstacle_2) 0.0) (= (c4 obstacle_2) -215.22961868354088)
;;@obstacle@ {"coordinates": [[15.369414683534195, -41.56571014204334], [7.793724337188856, -41.56571014204334], [7.793724337188856, -28.723362116299143], [15.369414683534195, -28.723362116299143]]}
(= (a1 obstacle_3) 0.0) (= (b1 obstacle_3) -7.57569034634534) (= (c1 obstacle_3) 314.88894906206633)
(= (a2 obstacle_3) -12.8423480257442) (= (b2 obstacle_3) 0.0) (= (c2 obstacle_3) -100.08972035489182)
(= (a3 obstacle_3) 0.0) (= (b3 obstacle_3) 7.57569034634534) (= (c3 obstacle_3) -217.59929709902886)
(= (a4 obstacle_3) 12.8423480257442) (= (b4 obstacle_3) 0.0) (= (c4 obstacle_3) 197.3793723179293)
;;@obstacle@ {"coordinates": [[-46.298760800914735, -2.9117691515666992], [-50.77748310170344, -2.9117691515666992], [-50.77748310170344, 0.26207727251836577], [-46.298760800914735, 0.26207727251836577]]}
(= (a1 obstacle_4) 0.0) (= (b1 obstacle_4) -4.478722300788704) (= (c1 obstacle_4) 13.041005433870378)
(= (a2 obstacle_4) -3.173846424085065) (= (b2 obstacle_4) 0.0) (= (c2 obstacle_4) 161.15993316638128)
(= (a3 obstacle_4) 0.0) (= (b3 obstacle_4) 4.478722300788704) (= (c3 obstacle_4) 1.1737713249578832)
(= (a4 obstacle_4) 3.173846424085065) (= (b4 obstacle_4) 0.0) (= (c4 obstacle_4) -146.94515640755301)
;;@obstacle@ {"coordinates": [[13.775383383817074, -4.523485768452313], [-5.5577462735910235, -4.523485768452313], [-5.5577462735910235, -2.296802429885777], [13.775383383817074, -2.296802429885777]]}
(= (a1 obstacle_5) 0.0) (= (b1 obstacle_5) -19.333129657408097) (= (c1 obstacle_5) 87.45313686492888)
(= (a2 obstacle_5) -2.226683338566536) (= (b2 obstacle_5) 0.0) (= (c2 obstacle_5) 12.375341027385385)
(= (a3 obstacle_5) 0.0) (= (b3 obstacle_5) 19.333129657408097) (= (c3 obstacle_5) -44.4043791744317)
(= (a4 obstacle_5) 2.226683338566536) (= (b4 obstacle_5) 0.0) (= (c4 obstacle_5) 30.67341666311179)
;;@obstacle@ {"coordinates": [[14.114171389566636, -24.386273502966468], [1.6863658479066572, -24.386273502966468], [1.6863658479066572, -21.696625733143883], [14.114171389566636, -21.696625733143883]]}
(= (a1 obstacle_6) 0.0) (= (b1 obstacle_6) -12.427805541659978) (= (c1 obstacle_6) 303.06786498060256)
(= (a2 obstacle_6) -2.689647769822585) (= (b2 obstacle_6) 0.0) (= (c2 obstacle_6) -4.535730141927114)
(= (a3 obstacle_6) 0.0) (= (b3 obstacle_6) 12.427805541659978) (= (c3 obstacle_6) -269.641445521688)
(= (a4 obstacle_6) 2.689647769822585) (= (b4 obstacle_6) 0.0) (= (c4 obstacle_6) 37.96214960084164)
;;@obstacle@ {"coordinates": [[3.8897464619358892, -21.100110480395347], [-7.682472188632207, -21.100110480395347], [-7.682472188632207, -7.8520600310079764], [3.8897464619358892, -7.8520600310079764]]}
(= (a1 obstacle_7) 0.0) (= (b1 obstacle_7) -11.572218650568097) (= (c1 obstacle_7) 244.1750920302784)
(= (a2 obstacle_7) -13.248050449387371) (= (b2 obstacle_7) 0.0) (= (c2 obstacle_7) 101.7777791310149)
(= (a3 obstacle_7) 0.0) (= (b3 obstacle_7) 11.572218650568097) (= (c3 obstacle_7) -90.86575553621081)
(= (a4 obstacle_7) 13.248050449387371) (= (b4 obstacle_7) 0.0) (= (c4 obstacle_7) 51.53155736305269)
;;@obstacle@ {"coordinates": [[-1.7942528994191633, -6.3522765402432615], [-7.528143205282134, -6.3522765402432615], [-7.528143205282134, 12.384517922561324], [-1.7942528994191633, 12.384517922561324]]}
(= (a1 obstacle_8) 0.0) (= (b1 obstacle_8) -5.733890305862971) (= (c1 obstacle_8) 36.42325687426161)
(= (a2 obstacle_8) -18.736794462804585) (= (b2 obstacle_8) 0.0) (= (c2 obstacle_8) 141.05327192393025)
(= (a3 obstacle_8) 0.0) (= (b3 obstacle_8) 5.733890305862971) (= (c3 obstacle_8) 71.0114672589606)
(= (a4 obstacle_8) 18.736794462804585) (= (b4 obstacle_8) 0.0) (= (c4 obstacle_8) -33.61854779070805)
;;@obstacle@ {"coordinates": [[-48.738630378283375, -40.95012553534849], [-50.10532213816799, -40.95012553534849], [-50.10532213816799, -30.296188945532435], [-48.738630378283375, -30.296188945532435]]}
(= (a1 obstacle_9) 0.0) (= (b1 obstacle_9) -1.3666917598846169) (= (c1 obstacle_9) 55.96619913540142)
(= (a2 obstacle_9) -10.653936589816055) (= (b2 obstacle_9) 0.0) (= (c2 obstacle_9) 533.8189248723484)
(= (a3 obstacle_9) 0.0) (= (b3 obstacle_9) 1.3666917598846169) (= (c3 obstacle_9) -41.4055517877666)
(= (a4 obstacle_9) 10.653936589816055) (= (b4 obstacle_9) 0.0) (= (c4 obstacle_9) -519.2582775247135)
;;@obstacle@ {"coordinates": [[-39.59062434458536, 4.668050125767273], [-49.57433592618607, 4.668050125767273], [-49.57433592618607, 12.837651500446604], [-39.59062434458536, 12.837651500446604]]}
(= (a1 obstacle_10) 0.0) (= (b1 obstacle_10) -9.983711581600716) (= (c1 obstacle_10) -46.6044661041154)
(= (a2 obstacle_10) -8.169601374679331) (= (b2 obstacle_10) 0.0) (= (c2 obstacle_10) 405.0025629313847)
(= (a3 obstacle_10) 0.0) (= (b3 obstacle_10) 9.983711581600716) (= (c3 obstacle_10) 128.16740996556257)
(= (a4 obstacle_10) 8.169601374679331) (= (b4 obstacle_10) 0.0) (= (c4 obstacle_10) -323.4396190699375)
;;@obstacle@ {"coordinates": [[-33.51739721426054, 37.93607121392852], [-37.633458465357805, 37.93607121392852], [-37.633458465357805, 49.52534572531642], [-33.51739721426054, 49.52534572531642]]}
(= (a1 obstacle_11) 0.0) (= (b1 obstacle_11) -4.116061251097264) (= (c1 obstacle_11) -156.14719274251755)
(= (a2 obstacle_11) -11.589274511387899) (= (b2 obstacle_11) 0.0) (= (c2 obstacle_11) 436.1444809679464)
(= (a3 obstacle_11) 0.0) (= (b3 obstacle_11) 4.116061251097264) (= (c3 obstacle_11) 203.84935648717044)
(= (a4 obstacle_11) 11.589274511387899) (= (b4 obstacle_11) 0.0) (= (c4 obstacle_11) -388.44231722329346)
;;@obstacle@ {"coordinates": [[-28.052913828912185, -29.051593833549493], [-43.70153328778791, -29.051593833549493], [-43.70153328778791, -9.86986450891079], [-28.052913828912185, -9.86986450891079]]}
(= (a1 obstacle_12) 0.0) (= (b1 obstacle_12) -15.648619458875725) (= (c1 obstacle_12) 454.61733657503663)
(= (a2 obstacle_12) -19.181729324638702) (= (b2 obstacle_12) 0.0) (= (c2 obstacle_12) 838.2709825980357)
(= (a3 obstacle_12) 0.0) (= (b3 obstacle_12) 15.648619458875725) (= (c3 obstacle_12) -154.44975381060829)
(= (a4 obstacle_12) 19.181729324638702) (= (b4 obstacle_12) 0.0) (= (c4 obstacle_12) -538.1033998336075)
;;@obstacle@ {"coordinates": [[31.527351941726014, -35.39514157269567], [29.77514908139474, -35.39514157269567], [29.77514908139474, -29.136251371653522], [31.527351941726014, -29.136251371653522]]}
(= (a1 obstacle_13) 0.0) (= (b1 obstacle_13) -1.7522028603312734) (= (c1 obstacle_13) 62.01946830550772)
(= (a2 obstacle_13) -6.258890201042149) (= (b2 obstacle_13) 0.0) (= (c2 obstacle_13) -186.3593888201107)
(= (a3 obstacle_13) 0.0) (= (b3 obstacle_13) 1.7522028603312734) (= (c3 obstacle_13) -51.052622992742286)
(= (a4 obstacle_13) 6.258890201042149) (= (b4 obstacle_13) 0.0) (= (c4 obstacle_13) 197.32623413287612)
;;@obstacle@ {"coordinates": [[-32.576440101343195, 23.819102185950435], [-36.5132798808482, 23.819102185950435], [-36.5132798808482, 42.95875664429594], [-32.576440101343195, 42.95875664429594]]}
(= (a1 obstacle_14) 0.0) (= (b1 obstacle_14) -3.936839779505007) (= (c1 obstacle_14) -93.77198899774434)
(= (a2 obstacle_14) -19.139654458345504) (= (b2 obstacle_14) 0.0) (= (c2 obstacle_14) 698.8515600602935)
(= (a3 obstacle_14) 0.0) (= (b3 obstacle_14) 3.936839779505007) (= (c3 obstacle_14) 169.12174203533928)
(= (a4 obstacle_14) 19.139654458345504) (= (b4 obstacle_14) 0.0) (= (c4 obstacle_14) -623.5018070226986)
;;@obstacle@ {"coordinates": [[-14.15067314404858, -19.997964244144985], [-15.930866463212924, -19.997964244144985], [-15.930866463212924, -11.660477205764249], [-14.15067314404858, -11.660477205764249]]}
(= (a1 obstacle_15) 0.0) (= (b1 obstacle_15) -1.7801933191643435) (= (c1 obstacle_15) 35.600242344314324)
(= (a2 obstacle_15) -8.337487038380736) (= (b2 obstacle_15) 0.0) (= (c2 obstacle_15) 132.8233926472121)
(= (a3 obstacle_15) 0.0) (= (b3 obstacle_15) 1.7801933191643435) (= (c3 obstacle_15) -20.75790361996963)
(= (a4 obstacle_15) 8.337487038380736) (= (b4 obstacle_15) 0.0) (= (c4 obstacle_15) -117.98105392286742)
;;@obstacle@ {"coordinates": [[36.54542799102555, -7.937369096366903], [20.032629913455168, -7.937369096366903], [20.032629913455168, 2.1053941581359323], [36.54542799102555, 2.1053941581359323]]}
(= (a1 obstacle_16) 0.0) (= (b1 obstacle_16) -16.51279807757038) (= (c1 obstacle_16) 131.06817315545393)
(= (a2 obstacle_16) -10.042763254502836) (= (b2 obstacle_16) 0.0) (= (c2 obstacle_16) -201.18295958590187)
(= (a3 obstacle_16) 0.0) (= (b3 obstacle_16) 16.51279807757038) (= (c3 obstacle_16) 34.76594860699493)
(= (a4 obstacle_16) 10.042763254502836) (= (b4 obstacle_16) 0.0) (= (c4 obstacle_16) 367.01708134835076)
;;@obstacle@ {"coordinates": [[2.2244078331163095, 19.231467592019847], [-14.305128297188382, 19.231467592019847], [-14.305128297188382, 36.98125196647637], [2.2244078331163095, 36.98125196647637]]}
(= (a1 obstacle_17) 0.0) (= (b1 obstacle_17) -16.52953613030469) (= (c1 obstacle_17) -317.8872384010758)
(= (a2 obstacle_17) -17.749784374456524) (= (b2 obstacle_17) 0.0) (= (c2 obstacle_17) 253.91294272403022)
(= (a3 obstacle_17) 0.0) (= (b3 obstacle_17) 16.52953613030469) (= (c3 obstacle_17) 611.2829405237726)
(= (a4 obstacle_17) 17.749784374456524) (= (b4 obstacle_17) 0.0) (= (c4 obstacle_17) 39.482759398666566)
;;@obstacle@ {"coordinates": [[-29.372291546861277, -34.746763624104965], [-45.85237359175753, -34.746763624104965], [-45.85237359175753, -28.128864226897328], [-29.372291546861277, -28.128864226897328]]}
(= (a1 obstacle_18) 0.0) (= (b1 obstacle_18) -16.48008204489625) (= (c1 obstacle_18) 572.6295153198664)
(= (a2 obstacle_18) -6.617899397207637) (= (b2 obstacle_18) 0.0) (= (c2 obstacle_18) 303.4463955534315)
(= (a3 obstacle_18) 0.0) (= (b3 obstacle_18) 16.48008204489625) (= (c3 obstacle_18) -463.5659902890151)
(= (a4 obstacle_18) 6.617899397207637) (= (b4 obstacle_18) 0.0) (= (c4 obstacle_18) -194.38287052258022)
;;@obstacle@ {"coordinates": [[7.622482214982748, 31.307175775137722], [-1.6626538634061294, 31.307175775137722], [-1.6626538634061294, 34.57705650835075], [7.622482214982748, 34.57705650835075]]}
(= (a1 obstacle_19) 0.0) (= (b1 obstacle_19) -9.285136078388877) (= (c1 obstacle_19) -290.6913873021935)
(= (a2 obstacle_19) -3.2698807332130286) (= (b2 obstacle_19) 0.0) (= (c2 obstacle_19) 5.436679833953909)
(= (a3 obstacle_19) 0.0) (= (b3 obstacle_19) 9.285136078388877) (= (c3 obstacle_19) 321.0526748701785)
(= (a4 obstacle_19) 3.2698807332130286) (= (b4 obstacle_19) 0.0) (= (c4 obstacle_19) 24.924607734031056)
)
(:goal (and
        ;;@goal_location@[31, 44]
(= (x r) 31) (= (y r) 44)
        		(collected_soil_sample t1)
	     )
)
)

