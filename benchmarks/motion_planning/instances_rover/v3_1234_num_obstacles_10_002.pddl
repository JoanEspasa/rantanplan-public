(define

;;@problem_name@v3_1234_num_obstacles_10_002
(problem v3_1234_num_obstacles_10_002)

(:domain motion_planning_v1)

(:objects

  obstacle_0 obstacle_1 obstacle_2 obstacle_3 obstacle_4 obstacle_5 obstacle_6 obstacle_7 obstacle_8 obstacle_9  - obstacle
  t1  - waypoint
  r - rover
)

(:init

    		;;@energy@["r", 60]
		(= (energy r) 60)
    		;;@max_energy@["r", 100]
		(= (max_energy r) 100)
    		;;@location@["r", [-48, -32]]
		(= (x r) -48) (= (y r) -32)

    		;;@location@["t1", [4, 29]]
		(= (x t1) 4) (= (y t1) 29)
    ;;@waypoint_area@t1@{"coordinates": [[4.502303154329726, 29.827758397434437], [13.251277523237132, 24.676687051255612], [3.7078488236481473, 19.70615127021968]]}
(= (a1 t1) 5.151071346178824) (= (b1 t1) 8.748974368907405) (= (c1 t1) 284.1539784711949)
(= (a2 t1) 4.970535781035931) (= (b2 t1) -9.543428699588985) (= (c2 t1) -169.63425434204134)
(= (a3 t1) -10.121607127214755) (= (b3 t1) 0.794454330681579) (= (c3 t1) -21.873751862379613)

    ;;@bounding_box@ {"coordinates": [[36.54542799102555, -35.39514157269567], [-49.57433592618607, -35.39514157269567], [-49.57433592618607, 49.52534572531642], [36.54542799102555, 49.52534572531642]]}
(= (max_x) 36.54542799102555) (= (max_y) 49.52534572531642) (= (min_x) -49.57433592618607) (= (min_y) -35.39514157269567)

    ;;@obstacle@ {"coordinates": [[-39.59062434458536, 4.668050125767273], [-49.57433592618607, 4.668050125767273], [-49.57433592618607, 12.837651500446604], [-39.59062434458536, 12.837651500446604]]}
(= (a1 obstacle_0) 0.0) (= (b1 obstacle_0) -9.983711581600716) (= (c1 obstacle_0) -46.6044661041154)
(= (a2 obstacle_0) -8.169601374679331) (= (b2 obstacle_0) 0.0) (= (c2 obstacle_0) 405.0025629313847)
(= (a3 obstacle_0) 0.0) (= (b3 obstacle_0) 9.983711581600716) (= (c3 obstacle_0) 128.16740996556257)
(= (a4 obstacle_0) 8.169601374679331) (= (b4 obstacle_0) 0.0) (= (c4 obstacle_0) -323.4396190699375)
;;@obstacle@ {"coordinates": [[-33.51739721426054, 37.93607121392852], [-37.633458465357805, 37.93607121392852], [-37.633458465357805, 49.52534572531642], [-33.51739721426054, 49.52534572531642]]}
(= (a1 obstacle_1) 0.0) (= (b1 obstacle_1) -4.116061251097264) (= (c1 obstacle_1) -156.14719274251755)
(= (a2 obstacle_1) -11.589274511387899) (= (b2 obstacle_1) 0.0) (= (c2 obstacle_1) 436.1444809679464)
(= (a3 obstacle_1) 0.0) (= (b3 obstacle_1) 4.116061251097264) (= (c3 obstacle_1) 203.84935648717044)
(= (a4 obstacle_1) 11.589274511387899) (= (b4 obstacle_1) 0.0) (= (c4 obstacle_1) -388.44231722329346)
;;@obstacle@ {"coordinates": [[-28.052913828912185, -29.051593833549493], [-43.70153328778791, -29.051593833549493], [-43.70153328778791, -9.86986450891079], [-28.052913828912185, -9.86986450891079]]}
(= (a1 obstacle_2) 0.0) (= (b1 obstacle_2) -15.648619458875725) (= (c1 obstacle_2) 454.61733657503663)
(= (a2 obstacle_2) -19.181729324638702) (= (b2 obstacle_2) 0.0) (= (c2 obstacle_2) 838.2709825980357)
(= (a3 obstacle_2) 0.0) (= (b3 obstacle_2) 15.648619458875725) (= (c3 obstacle_2) -154.44975381060829)
(= (a4 obstacle_2) 19.181729324638702) (= (b4 obstacle_2) 0.0) (= (c4 obstacle_2) -538.1033998336075)
;;@obstacle@ {"coordinates": [[31.527351941726014, -35.39514157269567], [29.77514908139474, -35.39514157269567], [29.77514908139474, -29.136251371653522], [31.527351941726014, -29.136251371653522]]}
(= (a1 obstacle_3) 0.0) (= (b1 obstacle_3) -1.7522028603312734) (= (c1 obstacle_3) 62.01946830550772)
(= (a2 obstacle_3) -6.258890201042149) (= (b2 obstacle_3) 0.0) (= (c2 obstacle_3) -186.3593888201107)
(= (a3 obstacle_3) 0.0) (= (b3 obstacle_3) 1.7522028603312734) (= (c3 obstacle_3) -51.052622992742286)
(= (a4 obstacle_3) 6.258890201042149) (= (b4 obstacle_3) 0.0) (= (c4 obstacle_3) 197.32623413287612)
;;@obstacle@ {"coordinates": [[-32.576440101343195, 23.819102185950435], [-36.5132798808482, 23.819102185950435], [-36.5132798808482, 42.95875664429594], [-32.576440101343195, 42.95875664429594]]}
(= (a1 obstacle_4) 0.0) (= (b1 obstacle_4) -3.936839779505007) (= (c1 obstacle_4) -93.77198899774434)
(= (a2 obstacle_4) -19.139654458345504) (= (b2 obstacle_4) 0.0) (= (c2 obstacle_4) 698.8515600602935)
(= (a3 obstacle_4) 0.0) (= (b3 obstacle_4) 3.936839779505007) (= (c3 obstacle_4) 169.12174203533928)
(= (a4 obstacle_4) 19.139654458345504) (= (b4 obstacle_4) 0.0) (= (c4 obstacle_4) -623.5018070226986)
;;@obstacle@ {"coordinates": [[-14.15067314404858, -19.997964244144985], [-15.930866463212924, -19.997964244144985], [-15.930866463212924, -11.660477205764249], [-14.15067314404858, -11.660477205764249]]}
(= (a1 obstacle_5) 0.0) (= (b1 obstacle_5) -1.7801933191643435) (= (c1 obstacle_5) 35.600242344314324)
(= (a2 obstacle_5) -8.337487038380736) (= (b2 obstacle_5) 0.0) (= (c2 obstacle_5) 132.8233926472121)
(= (a3 obstacle_5) 0.0) (= (b3 obstacle_5) 1.7801933191643435) (= (c3 obstacle_5) -20.75790361996963)
(= (a4 obstacle_5) 8.337487038380736) (= (b4 obstacle_5) 0.0) (= (c4 obstacle_5) -117.98105392286742)
;;@obstacle@ {"coordinates": [[36.54542799102555, -7.937369096366903], [20.032629913455168, -7.937369096366903], [20.032629913455168, 2.1053941581359323], [36.54542799102555, 2.1053941581359323]]}
(= (a1 obstacle_6) 0.0) (= (b1 obstacle_6) -16.51279807757038) (= (c1 obstacle_6) 131.06817315545393)
(= (a2 obstacle_6) -10.042763254502836) (= (b2 obstacle_6) 0.0) (= (c2 obstacle_6) -201.18295958590187)
(= (a3 obstacle_6) 0.0) (= (b3 obstacle_6) 16.51279807757038) (= (c3 obstacle_6) 34.76594860699493)
(= (a4 obstacle_6) 10.042763254502836) (= (b4 obstacle_6) 0.0) (= (c4 obstacle_6) 367.01708134835076)
;;@obstacle@ {"coordinates": [[2.2244078331163095, 19.231467592019847], [-14.305128297188382, 19.231467592019847], [-14.305128297188382, 36.98125196647637], [2.2244078331163095, 36.98125196647637]]}
(= (a1 obstacle_7) 0.0) (= (b1 obstacle_7) -16.52953613030469) (= (c1 obstacle_7) -317.8872384010758)
(= (a2 obstacle_7) -17.749784374456524) (= (b2 obstacle_7) 0.0) (= (c2 obstacle_7) 253.91294272403022)
(= (a3 obstacle_7) 0.0) (= (b3 obstacle_7) 16.52953613030469) (= (c3 obstacle_7) 611.2829405237726)
(= (a4 obstacle_7) 17.749784374456524) (= (b4 obstacle_7) 0.0) (= (c4 obstacle_7) 39.482759398666566)
;;@obstacle@ {"coordinates": [[-29.372291546861277, -34.746763624104965], [-45.85237359175753, -34.746763624104965], [-45.85237359175753, -28.128864226897328], [-29.372291546861277, -28.128864226897328]]}
(= (a1 obstacle_8) 0.0) (= (b1 obstacle_8) -16.48008204489625) (= (c1 obstacle_8) 572.6295153198664)
(= (a2 obstacle_8) -6.617899397207637) (= (b2 obstacle_8) 0.0) (= (c2 obstacle_8) 303.4463955534315)
(= (a3 obstacle_8) 0.0) (= (b3 obstacle_8) 16.48008204489625) (= (c3 obstacle_8) -463.5659902890151)
(= (a4 obstacle_8) 6.617899397207637) (= (b4 obstacle_8) 0.0) (= (c4 obstacle_8) -194.38287052258022)
;;@obstacle@ {"coordinates": [[7.622482214982748, 31.307175775137722], [-1.6626538634061294, 31.307175775137722], [-1.6626538634061294, 34.57705650835075], [7.622482214982748, 34.57705650835075]]}
(= (a1 obstacle_9) 0.0) (= (b1 obstacle_9) -9.285136078388877) (= (c1 obstacle_9) -290.6913873021935)
(= (a2 obstacle_9) -3.2698807332130286) (= (b2 obstacle_9) 0.0) (= (c2 obstacle_9) 5.436679833953909)
(= (a3 obstacle_9) 0.0) (= (b3 obstacle_9) 9.285136078388877) (= (c3 obstacle_9) 321.0526748701785)
(= (a4 obstacle_9) 3.2698807332130286) (= (b4 obstacle_9) 0.0) (= (c4 obstacle_9) 24.924607734031056)
)
(:goal (and
        ;;@goal_location@[34, -33]
(= (x r) 34) (= (y r) -33)
        		(taken_picture t1)
	     )
)
)

