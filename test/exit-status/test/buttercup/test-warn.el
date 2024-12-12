;;; -*- lexical-binding: t; -*-
(describe "A failing suite"
  (it "contains a spec with a failed expectation"
    (expect t :to-be nil)))
