(set-logic ALL)

; Declare boolean variables for each node
(declare-fun p00 () Bool)
(declare-fun p01 () Bool)
(declare-fun p02 () Bool)
(declare-fun p10 () Bool)
(declare-fun p11 () Bool)
(declare-fun p12 () Bool)
(declare-fun p20 () Bool)
(declare-fun p21 () Bool)
(declare-fun p22 () Bool)
(declare-fun p30 () Bool)
(declare-fun p31 () Bool)
(declare-fun p32 () Bool)

; Function to check if one node is colored exactly once
(define-fun one_color ((p0 Bool) (p1 Bool) (p2 Bool)) Bool
  (or 
    (and p0 (not p1) (not p2))
    (and (not p0) p1 (not p2)) 
    (and (not p0) (not p1) p2)
  ))

; Function to check if adjacent nodes are in same color
(define-fun not_same_color ((pu0 Bool) (pu1 Bool) (pu2 Bool) (pv0 Bool) (pv1 Bool) (pv2 Bool)) Bool
  (and
    (not (and pu0 pv0))
    (not (and pu1 pv1))
    (not (and pu2 pv2))
  ))

; Each node must have exactly one color
(assert (one_color p00 p01 p02))
(assert (one_color p10 p11 p12))
(assert (one_color p20 p21 p22))
(assert (one_color p30 p31 p32))

; Adjacent nodes should be colored differently
(assert (not_same_color p00 p01 p02 p10 p11 p12))
(assert (not_same_color p00 p01 p02 p20 p21 p22))
(assert (not_same_color p00 p01 p02 p30 p31 p32))
(assert (not_same_color p10 p11 p12 p20 p21 p22))
(assert (not_same_color p10 p11 p12 p30 p31 p32))
(assert (not_same_color p20 p21 p22 p30 p31 p32))

; Check satisfiability
(check-sat)
