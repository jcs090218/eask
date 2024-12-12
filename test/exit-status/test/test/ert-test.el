(require 'ert)

(ert-deftest my-something/test ()
  "Tests something."
  (should (equal 't 't)))

(ert-deftest my-something-2/test ()
  "Tests something."
  (should-not nil))
