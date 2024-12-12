(require 'ert)
(Then "identical things are different"
      (lambda () (should (equal 1 2))))
