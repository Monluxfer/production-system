(deftemplate ioproxy
	(slot fact-id)
	(multislot messages)
	(multislot answers)
	(slot reaction)
	(slot value)
)

(deffacts proxy-fact
	(ioproxy
		(fact-id 0112)
		(value none)
		(messages)
	)
)
(defrule clear_messages
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?proxy <- (ioproxy)
=>
	(modify ?proxy (messages))
	(retract ?clear-msg-flg)
	(printout t "Message cleared ..." crlf)
)
(defrule set_output_and_halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
=>
	(printout t "Message set :" ?new-msg "... halting..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)
(defrule append_output_and_halt
	(declare (salience 99))
	?current-message <- (appendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
=>
	(printout t "Message appended:" ?new-msg "...halted..." crlf)
	(modify ?proxy (messages ?msg-list ?new-msg))
	(retract ?current-message)
	(halt)
)
(defrule set_output_and_proceed
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
=>
	(printout t "Message appended:" ?new-msg "... proceed..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
)
(defrule append_output_and_proceed
	(declare (salience 99))
	?current-message <- (appendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
=>
	(printout t "Message appended:" ?new-msg "... proceed..." crlf)
	(modify ?proxy (messages $?msg-list ?new-msg))
	(retract ?current-message)
)
;############################################################################

(deftemplate entity
    (slot name)    
    (slot conf)
)

(defrule power-from-pudge
    (declare (salience 40))
    (entity (name pudge) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-pudge
    (declare (salience 40))
    (entity (name pudge) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: ганкер")))
	(assert (entity (name ганкер) (conf ?m0)))
)

(defrule power-from-sven
    (declare (salience 40))
    (entity (name sven) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-sven
    (declare (salience 40))
    (entity (name sven) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: керри")))
	(assert (entity (name керри) (conf ?m0)))
)

(defrule intell-from-lion
    (declare (salience 40))
    (entity (name lion) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-lion
    (declare (salience 40))
    (entity (name lion) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: дизейблер")))
	(assert (entity (name дизейблер) (conf ?m0)))
)

(defrule power-from-doom
    (declare (salience 40))
    (entity (name doom) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-doom
    (declare (salience 40))
    (entity (name doom) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: дизейблер")))
	(assert (entity (name дизейблер) (conf ?m0)))
)

(defrule power-from-legion-commander
    (declare (salience 40))
    (entity (name legion-commander) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-legion-commander
    (declare (salience 40))
    (entity (name legion-commander) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: инициатор")))
	(assert (entity (name инициатор) (conf ?m0)))
)

(defrule power-from-treant-protector
    (declare (salience 40))
    (entity (name treant-protector) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-treant-protector
    (declare (salience 40))
    (entity (name treant-protector) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: керри")))
	(assert (entity (name керри) (conf ?m0)))
)

(defrule power-from-earthshaker
    (declare (salience 40))
    (entity (name earthshaker) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-earthshaker
    (declare (salience 40))
    (entity (name earthshaker) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: нюкер")))
	(assert (entity (name нюкер) (conf ?m0)))
)

(defrule power-from-axe
    (declare (salience 40))
    (entity (name axe) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-axe
    (declare (salience 40))
    (entity (name axe) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: танк")))
	(assert (entity (name танк) (conf ?m0)))
)

(defrule power-from-wraith-king
    (declare (salience 40))
    (entity (name wraith-king) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: сила")))
	(assert (entity (name сила) (conf ?m0)))
)

(defrule rolee-from-wraith-king
    (declare (salience 40))
    (entity (name wraith-king) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: лесник")))
	(assert (entity (name лесник) (conf ?m0)))
)

(defrule intell-from-windranger
    (declare (salience 40))
    (entity (name windranger) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)


(defrule rolee-from-windranger
    (declare (salience 40))
    (entity (name windranger) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: пушер")))
	(assert (entity (name пушер) (conf ?m0)))
)

(defrule intell-from-orge-magi
    (declare (salience 40))
    (entity (name orge-magi) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-orge-magi
    (declare (salience 40))
    (entity (name orge-magi) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: саппорт")))
	(assert (entity (name саппорт) (conf ?m0)))
)

(defrule intell-from-invoker
    (declare (salience 40))
    (entity (name invoker) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-invoker
    (declare (salience 40))
    (entity (name invoker) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: инициатор")))
	(assert (entity (name инициатор) (conf ?m0)))
)

(defrule intell-from-dark-willow
    (declare (salience 40))
    (entity (name dark-willow) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-dark-willow
    (declare (salience 40))
    (entity (name dark-willow) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: ганкер")))
	(assert (entity (name ганкер) (conf ?m0)))
)

(defrule intell-from-visage
    (declare (salience 40))
    (entity (name visage) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-visage
    (declare (salience 40))
    (entity (name visage) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: танк")))
	(assert (entity (name танк) (conf ?m0)))
)

(defrule intell-from-outworld-devourer
    (declare (salience 40))
    (entity (name outworld-devourer) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-outworld-devourer
    (declare (salience 40))
    (entity (name outworld-devourer) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: керри")))
	(assert (entity (name керри) (conf ?m0)))
)

(defrule intell-from-enchantress
    (declare (salience 40))
    (entity (name enchantress) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: интеллект")))
	(assert (entity (name интеллект) (conf ?m0)))
)

(defrule rolee-from-enchantress
    (declare (salience 40))
    (entity (name enchantress) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: нюкер")))
	(assert (entity (name нюкер) (conf ?m0)))
)

(defrule ax-from-lone-druid
    (declare (salience 40))
    (entity (name lone-druid) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-lone-druid
    (declare (salience 40))
    (entity (name lone-druid) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: дизейблер")))
	(assert (entity (name дизейблер) (conf ?m0)))
)

(defrule ax-from-faceless-void
    (declare (salience 40))
    (entity (name faceless-void) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-faceless-void
    (declare (salience 40))
    (entity (name faceless-void) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: керри")))
	(assert (entity (name керри) (conf ?m0)))
)

(defrule ax-from-monkey-king
    (declare (salience 40))
    (entity (name monkey-king) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-monkey-king
    (declare (salience 40))
    (entity (name monkey-king) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: инициатор")))
	(assert (entity (name инициатор) (conf ?m0)))
)

(defrule ax-from-vengerful-spirit
    (declare (salience 40))
    (entity (name vengerful-spirit) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-vengerful-spirit
    (declare (salience 40))
    (entity (name vengerful-spirit) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: саппорт")))
	(assert (entity (name саппорт) (conf ?m0)))
)

(defrule ax-from-broodmother
    (declare (salience 40))
    (entity (name broodmother) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-broodmother
    (declare (salience 40))
    (entity (name broodmother) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: лесник")))
	(assert (entity (name лесник) (conf ?m0)))
)

(defrule ax-from-meduse
    (declare (salience 40))
    (entity (name meduse) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-meduse
    (declare (salience 40))
    (entity (name meduse) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule ax-from-mirana
    (declare (salience 40))
    (entity (name mirana) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-mirana
    (declare (salience 40))
    (entity (name mirana) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: ганкер")))
	(assert (entity (name ганкер) (conf ?m0)))
)

(defrule ax-from-shadow-fiend
    (declare (salience 40))
    (entity (name shadow-fiend) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-shadow-fiend
    (declare (salience 40))
    (entity (name shadow-fiend) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: нюкер")))
	(assert (entity (name нюкер) (conf ?m0)))
)

(defrule ax-from-arc-warden
    (declare (salience 40))
    (entity (name arc-warden) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что класс вражеского героя: ловкость")))
	(assert (entity (name ловкость) (conf ?m0)))
)

(defrule rolee-from-arc-warden
    (declare (salience 40))
    (entity (name arc-warden) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " ?m0 " сказать, что роль вражеского героя: пушер")))
	(assert (entity (name пушер) (conf ?m0)))
)

; ;############################################################################

(defrule rolee-from-lesnik
    (declare (salience 40))
    (entity (name саппорт) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (- ?m0 0.134) 0.4) " сказать, что так как вражеский герой саппорт: нужен лесник")))
	(assert (entity (name нужен_лесник) (conf (* (- ?m0 0.134) 0.4))))
)

(defrule rolee-from-kerry
    (declare (salience 40))
    (entity (name керри) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (+ ?m0 0.201) 0.8) " сказать, что так как вражеский герой керри: нужен пушер")))
	(assert (entity (name нужен_пушер) (conf (* (+ ?m0 0.201) 0.8))))
)

(defrule rolee-from-lesnik
    (declare (salience 40))
    (entity (name лесник) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (- ?m0 0.504) 1) " сказать, что так как вражеский герой лесник: нужен ганкер")))
	(assert (entity (name нужен_ганкер) (conf (* (- ?m0 0.504) 1))))
)

(defrule rolee-from-ganker
    (declare (salience 40))
    (entity (name ганкер) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (- ?m0 0.452) 0.9) " сказать, что так как вражеский герой ганкер: нужен саппорт")))
	(assert (entity (name нужен_саппорт) (conf (* (- ?m0 0.452) 0.9))))
)

(defrule rolee-from-dis
    (declare (salience 40))
    (entity (name дизейблер) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (+ ?m0 0.634) 0.9) " сказать, что так как вражеский герой дизейблер: нужен инициатор")))
	(assert (entity (name нужен_инициатор) (conf (* (+ ?m0 0.634) 0.9))))
)

(defrule rolee-from-push
    (declare (salience 40))
    (entity (name пушер) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (- ?m0 0.645) 0.9) " сказать, что так как вражеский герой пушер: нужен нюкер")))
	(assert (entity (name нужен_нюкер) (conf (* (- ?m0 0.645) 0.9))))
)

(defrule rolee-from-tank
    (declare (salience 40))
    (entity (name танк) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (+ ?m0 0.267) 0.435) " сказать, что так как вражеский герой танк: нужен дизейблер")))
	(assert (entity (name нужен_дизейблер) (conf (* (+ ?m0 0.267) 0.435))))
)

(defrule rolee-from-ini
    (declare (salience 40))
    (entity (name инициатор) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (+ ?m0 0.334) 0.9) " сказать, что так как вражеский герой инициатор: нужен керри")))
	(assert (entity (name нужен_керри) (conf (* (+ ?m0 0.334) 0.9))))
)

(defrule rolee-from-nik
    (declare (salience 40))
    (entity (name нюкер) (conf ?m0))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (+ ?m0 0.834) 0.8) " сказать, что так как вражеский герой нюкер: нужен танк")))
	(assert (entity (name нужен_танк) (conf (* (+ ?m0 0.834) 0.8))))
)

; ;############################################################################

(defrule need-from-stats1
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name керри) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой силовик керри: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats2
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name керри) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость керри: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats3
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name керри) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой интеллект керри: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats4
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name саппорт) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.78) " сказать, что так как вражеский герой силовик саппорт: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.78))))
)

(defrule need-from-stats5
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name саппорт) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость саппорт: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats6
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name саппорт) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой интеллект саппорт: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats7
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name ганкер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой силовик ганкер: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats8
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name ганкер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость ганкер: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats9
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name ганкер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой интеллект ганкер: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats10
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name дизейблер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.35) " сказать, что так как вражеский герой силовик дизейблер: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.35))))
)

(defrule need-from-stats11
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name дизейблер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость дизейблер: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats12
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name дизейблер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.15) " сказать, что так как вражеский герой интеллект дизейблер: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.15))))
)

(defrule need-from-stats13
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name пушер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой силовик пушер: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats14
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name пушер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость пушер: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats15
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name пушер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой интеллект пушер: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats16
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name танк) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой силовик танк: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats17
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name танк) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость танк: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats18
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name танк) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой интеллект танк: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats19
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name лесник) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой силовик лесник: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats20
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name лесник) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость лесник: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats21
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name лесник) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой интеллект лесник: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats22
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name инициатор) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой силовик инициатор: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats23
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name инициатор) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой ловкость инициатор: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats24
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name инициатор) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.5) " сказать, что так как вражеский герой интеллект инициатор: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.5))))
)

(defrule need-from-stats25
    (declare (salience 40))
    (entity (name сила) (conf ?m0))
	(entity (name нюкер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой силовик нюкер: нужен ловкач")))
	(assert (entity (name нужен_ловкость) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats26
    (declare (salience 40))
    (entity (name ловкость) (conf ?m0))
	(entity (name нюкер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.9) " сказать, что так как вражеский герой ловкость нюкер: нужен интеллект")))
	(assert (entity (name нужен_интеллект) (conf (* (* ?m0 ?m1) 0.9))))
)

(defrule need-from-stats27
    (declare (salience 40))
    (entity (name интеллект) (conf ?m0))
	(entity (name нюкер) (conf ?m1))
=>
    (assert (appendmessagehalt (str-cat "мы можем с уверенностью " (* (* ?m0 ?m1) 0.8) " сказать, что так как вражеский герой интеллект нюкер: нужен сила")))
	(assert (entity (name нужен_сила) (conf (* (* ?m0 ?m1) 0.8))))
)

; ;############################################################################

(defrule hero-from-stats1
    (declare (salience 40))
    (entity (name нужен_саппорт) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен саппорт ловкость: берем vengerful-spirit")))
	(assert (entity (name evil_vengerful-spirit)))
)

(defrule hero-from-stats2
    (declare (salience 40))
    (entity (name нужен_керри) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен керри силовик: берем sven")))
	(assert (entity (name evil_sven)))
)

(defrule hero-from-stats3
    (declare (salience 40))
    (entity (name нужен_керри) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен керри ловкость: берем faceless-void")))
	(assert (entity (name evil_faceless-void)))
)

(defrule hero-from-stats4
    (declare (salience 40))
    (entity (name нужен_керри) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен керри интеллект: берем outworld-devourer")))
	(assert (entity (name evil_outworld-devouver)))
)

(defrule hero-from-stats5
    (declare (salience 40))
    (entity (name нужен_саппорт) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен саппорт силовик: берем treant-protector")))
	(assert (entity (name evil_treant-protector)))
)

(defrule hero-from-stats6
    (declare (salience 40))
    (entity (name нужен_саппорт) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен саппорт интеллект: берем orge-magi")))
	(assert (entity (name evil_orge-magi)))
)

(defrule hero-from-stats7
    (declare (salience 40))
    (entity (name нужен_ганкер) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен ганкер силовик: берем pudge")))
	(assert (entity (name evil_pudge)))
)

(defrule hero-from-stats8
    (declare (salience 40))
    (entity (name нужен_ганкер) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен ганкер ловкость: берем mirana")))
	(assert (entity (name evil_mirana)))
)

(defrule hero-from-stats9
    (declare (salience 40))
    (entity (name нужен_ганкер) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен ганкер интеллект: берем dark-willow")))
	(assert (entity (name evil_dark-willow)))
)

(defrule hero-from-stats10
    (declare (salience 40))
    (entity (name нужен_дизейблер) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен дизейблер силовик: берем doom")))
	(assert (entity (name evil_doom)))
)

(defrule hero-from-stats11
    (declare (salience 40))
    (entity (name нужен_дизейблер) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен дизейблер ловкость: берем lone-druid")))
	(assert (entity (name evil_lone-druid)))
)

(defrule hero-from-stats12
    (declare (salience 40))
    (entity (name нужен_дизейблер) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен дизейблер интеллект: берем lion")))
	(assert (entity (name evil_lion)))
)

(defrule hero-from-stats13
    (declare (salience 40))
    (entity (name нужен_пушер) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен пушер силовик: берем beastmaster")))
	(assert (entity (name evil_beastmaster)))
)

(defrule hero-from-stats14
    (declare (salience 40))
    (entity (name нужен_пушер) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен пушер ловкость: берем arc-warden")))
	(assert (entity (name evil_arc-warden)))
)

(defrule hero-from-stats15
    (declare (salience 40))
    (entity (name нужен_пушер) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен пушер интеллект: берем lion")))
	(assert (entity (name evil_lion)))
)

(defrule hero-from-stats16
    (declare (salience 40))
    (entity (name нужен_танк) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк силовик: берем axe")))
	(assert (entity (name evil_axe)))
)

(defrule hero-from-stats17
    (declare (salience 40))
    (entity (name нужен_танк) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк ловкость: берем meduse")))
	(assert (entity (name evil_meduse)))
)

(defrule hero-from-stats18
    (declare (salience 40))
    (entity (name нужен_танк) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк интеллект: берем visage")))
	(assert (entity (name evil_visage)))
)

(defrule hero-from-stats19
    (declare (salience 40))
    (entity (name нужен_лесник) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк силовик: берем wraith-king")))
	(assert (entity (name evil_wraith-king)))
)

(defrule hero-from-stats20
    (declare (salience 40))
    (entity (name нужен_лесник) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк ловкость: берем miralone broodmother")))
	(assert (entity (name evil_broodmother)))
)

(defrule hero-from-stats21
    (declare (salience 40))
    (entity (name нужен_лесник) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк интеллект: берем enchantress")))
	(assert (entity (name evil_enchantress)))
)

(defrule hero-from-stats22
    (declare (salience 40))
    (entity (name нужен_инициатор) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк силовик: берем legion-commander")))
	(assert (entity (name evil_legion-commander)))
)

(defrule hero-from-stats23
    (declare (salience 40))
    (entity (name нужен_инициатор) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк ловкость: берем miralone monkey-king")))
	(assert (entity (name evil_monkey-king)))
)

(defrule hero-from-stats24
    (declare (salience 40))
    (entity (name нужен_инициатор) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен танк интеллект: берем enigma")))
	(assert (entity (name evil_enigma)))
)

(defrule hero-from-stats25
    (declare (salience 40))
    (entity (name нужен_нюкер) (conf ?m0))
	(entity (name нужен_сила) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен нюкер силовик: берем earthshaker")))
	(assert (entity (name evil_earthshaker)))
)

(defrule hero-from-stats26
    (declare (salience 40))
    (entity (name нужен_нюкер) (conf ?m0))
	(entity (name нужен_ловкость) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен нюкер ловкач: берем miralone shadow-fiend")))
	(assert (entity (name evil_shadow-fiend)))
)

(defrule hero-from-stats27
    (declare (salience 40))
    (entity (name нужен_нюкер) (conf ?m0))
	(entity (name нужен_интеллект) (conf ?m1))
    (test ( < 0.1 ?m0))
    (test ( < 0.1 ?m1))
=>
    (assert (appendmessagehalt (str-cat " если нам нужен нюкер интеллект: берем invoker")))
	(assert (entity (name evil_invoker)))
)