(defmodule ping_pong_srv
  (export (start_link 0) (init 1) (handle_call 3) (handle_cast 2)
          (handle_info 2) (terminate 2) (code_change 3)))

(defrecord state (pings 0))

(defun start_link ()
  (: gen_server start_link
    (tuple 'local 'ping_pong_srv) 'ping_pong_srv (list) (list)))

(defun init (args)
  (tuple 'ok (make-state pings 0)))

(defun handle_call (req from state)
  (tuple 'reply 'ok state))

(defun handle_cast (msg state)
  (tuple 'noreply state))

(defun handle_info (info state)
  (tuple 'noreply state))

(defun terminate (reason state)
  'ok)

(defun code_change (old-vers state extra)
  (tuple 'ok state))
