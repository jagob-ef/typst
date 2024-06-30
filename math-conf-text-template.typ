#import "./ams-template.typ": ams-article
#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with()

#show: ams-article.with(
  title: [AMS Template Modified],
  authors: (
    (
      name: "John Doe",
      email: "john@doe.com",
    ),
  )
)


#let theorem = thmbox("theorem", "Theorem", base_level: 1, inset: 0em)
#let corollary = thmplain("corollary", "Corollary", base: "theorem", base_level: 1, inset: 0em)
#let definition = thmbox("definition", "Definition", base_level: 1, inset: 0em)
#let example = thmplain("example", "Example", base_level: 1, inset: 0em)
#let lemma = thmplain("lemma", "Lemma", base_level: 1, inset: 0em)
#let proposition = thmplain("proposition", "Proposition", base_level: 1, inset: 0em)
#let proof = thmproof("proof", "Proof", base_level: 1, inset: 0em)



= Template Heading

== Template Subheading

#lorem(50)

#definition("Minimizer")[
  $phi in C^1(Omega, RR)$ is a minimizer of a functional $cal(F)$ if there exists some $delta > 0$ for which #math.equation(numbering: none)[$
    forall psi in B_delta (phi): cal(F)(phi) <= cal(F)(psi)
  $] holds.
] <minimizer>

#lorem(25)

=== Template Subsubheading
#theorem("Euler-Lagrange")[
  Let $F$, $cal(F)$ and $phi$ be a minimizer (@minimizer). If $phi$ is of class $C^2$, then $phi$ satisfies the Euler-Lagrange equation:$
    F_u (x, phi (x), gradient phi (x)) - D_alpha F_p_alpha (x, phi (x), gradient phi (x) ) = 0.
  $ <eulerlagrangeeq>
]

#lorem(25)
