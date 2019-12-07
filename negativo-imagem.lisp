;; abre o arquivo para leitura
(setq in (open "eye.ppm"))

;; le a primeira linha com os caracteres p3
(setq lixo (read-line in))

;; le a segunda linha com o comentario
(setq coment (read-line in))

;; le largura e altura
(setq largura (read in))
(setq altura (read in))

; le o 255
(setq lixo (read in))

(setq out (open "negativo.ppm" :direction :output))
(format out "P3~%#negativis de eye~%~S ~S~%255~%" largura altura)

(loop for i from 1 to altura do
      (loop for j from 1 to largura do
	    (setq red (read in))
	    (setq green (read in))
	    (setq blue (read in))
	    (format out "~S~%" (- 255 red))
	    (format out "~S~%" (- 255 green))
	    (format out "~S~%" (- 255 blue))
	    )
      )

;; (loop for i from 1 to (* 3 largura altura) do
;;       (format out "~S~%" (- 255 (read in))))

(close out)
(close in)
