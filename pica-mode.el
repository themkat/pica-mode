;;; pica-mode.el --- Mode for developing Pica200/picasso shaders  -*- lexical-binding: t; -*-

;; URL: https://github.com/themkat/pica-mode
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Mode for developing Pica200 shaders, assembled with Picasso.
;; Simple syntax highlighting for the directives etc. 

;;; Code:


(defconst pica-font-lock-keywords
  (list
   ;; comments
   (cons ";.*$" 'font-lock-comment-face)
   
   ;; directives
   (cons (regexp-opt '(".alias" ".bool"  ".constf" ".consti" ".costfa"
                       ".else" ".end" ".entry" ".fvec" ".gsh" ".in" ".ivec"
                       ".nodvle" ".out" ".proc" ".setf" ".seti" ".setb")
                     t)
         'font-lock-builtin-face)

   ;; labels
   (cons "[a-zA-Z0-9_]+\\:" 'font-lock-function-name-face)

   ;; opcodes
   (cons (regexp-opt '("nop" "end" "emit"
                       "setemit" "add" "dp3" "dp4" "dph" "dst"
                       "mul" "sge" "slt" "max" "min" "ex2" "lg2"
                       "litp" "flr" "rcp" "rsq" "mov" "mova" "cmp"
                       "call" "for" "break" "breakc" "callc" "ifc"
                       "jmpc" "callu" "ifu" "jmpu" "mad")
                     t)
         'font-lock-keyword-face)

   ;; Registers (o0-o15, v0-15, r0-15)
   (cons "[ ]+[ovr][0-9][0-9]?[ ]*" 'font-lock-variable-name-face)))


(define-derived-mode pica-mode
  prog-mode
  "Pica200 Mode"
  "Mode for editing Pica200 shaders."
  ;; TODO: set the variables font-lock-defaults and indent-line-function
  (setq font-lock-defaults '(pica-font-lock-keywords nil t)))

(provide 'pica-mode)
;;; pica-mode.el ends here
