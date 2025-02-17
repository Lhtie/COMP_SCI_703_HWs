(set-logic ALL)

; In order to check validity of alpha_G, the following is describing ~alpha_G

; Declare real variables for the left and right end of intervals
(declare-const l0 Real)
(declare-const r0 Real)
(declare-const l1 Real)
(declare-const r1 Real)
(declare-const l2 Real)
(declare-const r2 Real)
(declare-const l3 Real)
(declare-const r3 Real)

; Function to check if A intersects with B
(define-fun intersects ((l0 Real) (r0 Real) (l1 Real) (r1 Real)) Bool
  (and 
    (< l0 r1) (< l1 r0)
  ))

; Check for each interval, l < r
(assert (< l0 r0))
(assert (< l1 r1))
(assert (< l2 r2))
(assert (< l3 r3))

; Check for each edge, two intervals should intersect
(assert (intersects l0 r0 l1 r1))
(assert (intersects l0 r0 l2 r2))
(assert (intersects l1 r1 l3 r3))
(assert (intersects l2 r2 l3 r3))

; Check if there exists two nodes that are not connected, two intervals intersect
(assert 
  (or 
    (intersects l0 r0 l3 r3)
    (intersects l1 r1 l2 r2)
  ))

; Check satisfiability
(check-sat)
