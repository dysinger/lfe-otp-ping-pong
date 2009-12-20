(defmodule ping_pong_sup
  (behaviour supervisor)
  (export (start_link 0) (init 1)))

(defun start_link ()
  (: supervisor start_link
    (tuple 'local 'ping_pong_sup) 'ping_pong_sup (list)))

(defun init (args)
  (let* ((flags (tuple 'one_for_one 1000 3600))
         (specs (list
                 (tuple 'ping_pong
                        (tuple 'ping_pong 'start_link (list))
                        'permanent
                        2000
                        'worker
                        (list 'ping_pong)))))
    (tuple 'ok (tuple flags specs))))
