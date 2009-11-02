(defmodule ping_pong
  (export (ping 0))
  (export (start_link 0) (init 1) (handle_call 3) (handle_cast 2)
          (handle_info 2) (terminate 2) (code_change 3)))

;; client

(defun ping ()
  (: gen_server call 'ping_pong 'ping))

;; callbacks

(defrecord state (pings 0))

(defun start_link ()
  (: gen_server start_link
    (tuple 'local 'ping_pong) 'ping_pong (list) (list)))

(defun init (args)
  (tuple 'ok (make-state pings 0)))

(defun handle_call (req from state)
  (let* ((new-count (+ (state-pings state) 1))
         (new-state (set-state-pings state new-count)))
    (tuple 'reply (tuple 'pong new-count) new-state)))

(defun handle_cast (msg state)
  (tuple 'noreply state))

(defun handle_info (info state)
  (tuple 'noreply state))

(defun terminate (reason state)
  'ok)

(defun code_change (old-vers state extra)
  (tuple 'ok state))
