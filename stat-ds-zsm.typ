#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with()
#show link: underline

#let definition = thmbox("definition", "Definition", base_level: 1, inset: 0em)
#let remark = thmplain("bemerkung", "Bemerkung", base_level: 1, inset: 0em)
#let theorem = thmbox("satz", "Satz", base_level: 1, inset: 0em)
#let corollary = thmplain("corollar", "Corollar", base: "theorem", base_level: 1, inset: 0em)
#let example = thmplain("beispiel", "Beispiel", base_level: 1, inset: 0em)
#let lemma = thmbox("lemma", "Lemma", base_level: 1, inset: 0em)
#let proposition = thmbox("proposition", "Proposition", base_level: 1, inset: 0em)
#let proof = thmproof("beweis", "Beweis", base_level: 1, inset: 0em)

= Statistik & Data Science - Zusammenfassung


= Statistik

== Grundbegriffe
=== Zufallsvariablen
=== Verteilungen

#definition("Bernoulli-Verteilung")[
Eine Zufallsvariable $X$ heißt #underline[bernoulliverteilt], falls sie Werte in ${0,1}$ annimmt und ihre Wahrscheinlichkeitsfunktion durch $p_X (x)=p^x (1-p)^(1-x)$ gegeben ist. In diesem Fall schreiben wir $X tilde cal(B)(1,p)$.]

#theorem("Erwartungwert & Varianz der Bernoulli-Verteilung")[
Sei $X tilde cal(B)(1,p)$. Dann gilt $bb(E)[X]=p$ und $bb(V)[X]=p(1-p)$.]
#proof[]

#definition("Binomial-Verteilung")[
Eine Zufallsvariable $X$ heißt #underline[binomialverteilt], falls sie Werte in ${0,..., n}$ annimmt und ihre Wahrscheinlichkeitsfunktion durch $p_X (x)=binom(n, x) p^x (1-p)^(n-x)$ gegeben ist. In diesem Fall schreiben wir $X tilde cal(B)(n,p)$.]

#theorem("Erwartungwert & Varianz der Binomial-Verteilung")[
Sei $X tilde cal(B)(n,p)$. Dann gilt $bb(E)[X]=n p$ und $bb(V)[X]=n p (1-p)$.]
#proof[]

#definition("Poisson-Verteilung")[
Eine Zufallsvariable $X$ heißt #underline[poissonverteilt] mit Parameter $lambda$, falls sie Werte in ${0,1,...}$ annimmt und ihre Wahrscheinlichkeitsfunktion durch $p_X (x)=(e^(-lambda)lambda^x)/x!$ gegeben ist. In diesem Fall schreiben wir $X tilde cal(P)(lambda)$.]

#theorem("Erwartungwert & Varianz der Poisson-Verteilung")[
Sei $X tilde cal(P)(lambda)$. Dann gilt $bb(E)[X]=lambda=bb(V)[X]$.]
#proof[]

#definition("Normal-Verteilung")[
Eine Zufallsvariable $X$ heißt #underline[normalverteilt] mit Parametern $mu$ und $sigma^2$, falls sie Werte in $bb(R)$ annimmt und ihre Dichtefunktion durch $f_X (x)=1/(sqrt(2 pi sigma^2)) exp(-(x-mu)^2/(2 sigma^2))$ gegeben ist. In diesem Fall schreiben wir $X tilde cal(N)(mu,sigma^2)$.]

#theorem("Erwartungwert & Varianz der Normal-Verteilung")[
Sei $X tilde cal(N)(mu,sigma^2)$. Dann gilt $bb(E)[X]=mu$ und $bb(V)[X]=sigma^2$.]
#proof[]

#definition("Uniforme Verteilung")[
Eine Zufallsvariable $X$ heißt #underline[uniform] auf $[a, b]$ #underline[verteilt], falls sie Werte in $bb(R)$ annimmt und ihre Dichtefunktion durch $f_X (x)=1/(b-a) bb(1)_{x in [a,b]} (x)$ gegeben ist. In diesem Fall schreiben wir $X tilde cal(U)[a,b]$.]

=== Erwartungswert & Varianz
=== Unabhängigkeit
=== Ungleichungen & Grenzwertsätze
#theorem("Markow-Ungleichung")[
Sei $X>=0$, $a>0$. Dann gilt: $bb(P)[X>=a]<= (bb(E)[X])/a$.]
#proof[]
#theorem("Chebyshev-Ungleichung")[
$bb(P)[abs(X-bb(E)[X])>=a]<= (bb(V)[X])/a^2.$]
#proof[]

#theorem("Schwaches Gesetz der großen Zahlen")[
Seien $X_1, ..., X_n tilde^"iid"X$. Dann gilt: $bb(P)[abs(1/n sum_(k=1)^n X_i -bb(E)[X])>=epsilon]<=bb(V)/(n epsilon^2)$.]
#proof[]

#theorem("Zentraler Grenzwertsatz")[
Sei X eine Zufallsvariable mit $mu:=bb(E)[X]$, $sigma^2:=bb(V)[X]$, sowie $X_i$ iid mit $X_i tilde X$. Sei $overline(X)_n:=1/n sum_(i=1)^n X_i$ und $S_n^*:= (overline(X)_n-mu)/(sqrt(n)sigma)$. Dann gilt: $lim_(n->infinity)bb(P)[a<=S_n^*<=b]=Phi(b)-Phi(a)$, wobei $Phi$ die Verteilungsfunktion der Standardnormalverteilung bezeichnet.]
#proof[]

== 1 Parameterschätzung
=== Maximum likelihood estimation (MLE)
=== Asymptotische Normalität

Konsistenz: #link("https://www.stat.cmu.edu/~larry/=stat705/Lecture15.pdf") \

Asymptotische Normalität: #link("https://ocw.mit.edu/courses/18-443-statistics-for-applications-fall-2006/03b407da8a94b3fe22d987453807ca46_lecture3.pdf") \

Asymptotische Normalität ist in der mathematischen Statistik eine Eigenschaft von Statistiken bzw. Schätzern.\
In diesem Abschnitt wollen wir untersuchen, unter welchen Voraussetzungen asymptotische Normalität für einen MLE gegeben ist.

#definition("Konsistenz eines Schätzers")[
Ein Schätzer $hat(theta)^n$ heißt #underline[konsistent], falls $hat(theta)^n ->^p theta$, also wenn $hat(theta)^n$ in Wahrscheinlichkeit gegen $theta$ konvergiert, d.h.: $forall epsilon>0: bb(P)[abs(hat(theta)^n-theta)>epsilon]->0$.]

#definition("Asymptotische Normalität eines Schätzers")[
Ein Schätzer $hat(theta)^n$ heißt #underline[asymptotisch normal], falls ein $sigma_theta^2$ existiert mit $sqrt(n)(hat(theta)^n-theta)->^d cal(N)(0, sigma_theta^2)$, also der Schätzer in Verteilung gegen $cal(N)(0, sigma_theta^2)$ konvergiert. _Zur Wiederholung: Konvergenz in Verteilung bedeutet, dass die Verteilungen der betrachteten Zufallsvariablen im Grenzwert identisch werden._]

#definition("Kullback-Leibler Divergenz")[
Die #underline[Kullback-Leibler Divergenz] zweier Verteilungen $f(x|theta)$ und $f(x|tilde(theta))$ ist gegeben durch:
$ D_"KL" (f(x|theta) || f(x|tilde(theta))):= bb(E)_theta [log f(X|theta)/f(X|tilde(theta))]=integral f(x|theta) log f(X|theta)/f(X|tilde(theta)) dif x. $]
Hierbei ist der Erwartungswert so zu verstehen, dass er von einer Funktion $g(X)$ der Zufallsvariablen $X tilde f(x|theta)$  berechnet wird. Diese Funktion können wir explizit als $g(x)=log (f(X|theta))/(f(X|tilde(theta)))$ anschreiben.

In diesem Abschnitt wollen wir folgendes zeigen:\

#theorem()[
Unter gewissen Voraussetzungen gilt: $hat(theta)_"MLE"^(\(n\))$ ist *konsistent* und *asymptotisch normal* mit $sigma_theta^2 := frac(1,I(theta)sigma)$.]
Hierbei bezeichnet $I(theta)$ die _Fisher-Information_, welche wir in Kürze definieren werden.

Welche Voraussetzungen sind das? Um das zu präzisieren brauchen wir ein paar Resultate.

Zunächst stellen wir einen Zusammenhang zwischen MLE und Kullback-Leibler-Divergenz her.\
Das Maximierungsproblem für das Auffinden des MLE lautet bekanntlich
$max_(tilde(theta)) cal(l)(tilde(theta))$ bzw. $max_(tilde(theta)) log(cal(l)(tilde(theta)))$ mit likelihood-Funktion $l(tilde(theta))= product_(i=1)^n f(x_i|tilde(theta))$. Dies kann äquivalent wie folgt formuliert werden:\
$ max_(tilde(theta)) log(cal(l)(tilde(theta)))=max sum_(i=1)^n log(f(x_i|tilde(theta)))=-min sum_(i=1)^n log(f(x_i|tilde(theta))) $
Das $arg min$ dieses Problems ändert sich nicht wenn wir eine Konstante (d.h. einen Term unabhängig von $tilde(theta)$) dazuaddieren und mit einer Konstante $1/n > 0$ multiplizieren:
$ log(cal(l)(tilde(theta)))&= 1/n (-sum_(i=1)^n log(f(x_i|tilde(theta)))+sum_(i=1)^n log(f(x_i|theta)))\ &= 1/n (sum_(i=1)^n log (f(x_i|theta))/(f(x_i|tilde(theta))))=:R_n (tilde(theta), theta) $

Der Ausdruck $R_n (tilde(theta),theta)$ kann als _loss function_ einer _Empirical Risk Minimization_ aufgefasst werden. Wir fassen diese Beziehung nochmal zusammen:
$ theta_"MLE"^n=arg min_tilde(theta) R_n (tilde(theta), theta) $

Wenn wir $R_n$ als Sample-Mean $1/n sum_(i=1)^n g(X_i)$ von Funktionen der Zufallsvariablen $X_1,...,X_n$ interpretieren, bekommen wir für $n->infinity$ mit dem Gesetz der großen Zahlen:
$ R_n (tilde(theta),theta) -> bb(E)_theta [log f(X|theta)/f(X|tilde(theta))]=integral log (f(x|theta))/(f(x|tilde(theta))) f(x|theta) dif x = D_"KL" (f(x|theta)||f(x|tilde(theta))) =: R (tilde(theta), theta) $
womit wir einen Zusammenhang zur Kullback-Leibler-Divergenz gefunden haben.

Bevor wir unsere Annahmen präzisieren, beweisen wir noch eine elementare Eigenschaft der Kullback-Leibler-Divergenz:
#proposition("Nicht-Negativität der KL-Divergenz")[
$D_"KL" (X||Y)>=0$ und $D_"KL" (X||Y)=0 <-> X = Y$ in Verteilung.]
#proof[
 + $D_"KL" (X||Y)=integral log(frac(f_X (x),f_Y (x)))f_X (x) dif x=-integral log(frac(f_Y (x),f_X (x)))f_X (x) dif x$. Bemerke: $g(x):=-log(x)$ ist konvex. Daher kann Jensen-Ungleichung angewandt werden: $...=bb(E)[g(h(x))]>=g(bb(E)[h(x)])>=-log(integral frac(f_Y (x),f_X (x))f_X (x) dif x)=-log(integral f_Y (x) dif x)=-log(1)=0$.
 + $<-$ trivial, $->$ folgt aus Gleichheitsbedingung der Jensen-Ungleichung: Wenn g strikt konvex dann gilt Gleichheit genau dann wenn h(x) konstant [Skript Beiglböck], d.h. $f_Y (x)=c dot f_X (x)$ $->$ X=Y in Verteilung.] <KL-pos-def>

#remark[
$X=Y$ in Verteilung bedeutet $F_X = F_Y$, d.h. die Verteilungsfunktionen stimmen überein.]

Wir präzisieren nun unsere Annahmen:

+ *Starke Identifizierbarkeit:* Eine grundlegende Voraussetzung zur Konsistenz von Schätzern ist die sogenannte Identifizierbarkeit. Diese besagt, dass unterschiedliche Werte der Parameter zu unterschiedlichen Wahrscheinlichkeitsverteilungen der beobachtbaren Zufallsvariablen führen müssen. Mathematisch ausgedrückt: $ theta_1 != theta_2 arrow.r.double f_X (x|theta_1)!=f_X (x|theta_2) $ Um unser Resultat zu beweisen brauchen wir eine etwas stärkere Aussage: $ forall epsilon>0: inf_(abs(tilde(theta)-theta)>epsilon) D_"KL" (f(.|theta)||f(.|tilde(theta)))=eta_epsilon>0 $ Diese Bedingung ist im Wesentlichen dieselbe wie die normale Identifizierbarkeit, außer dass sie verhindert, dass der Unterschied zwischen den beiden Verteilungen verschwindend klein wird (er bleibt immer mindestens so groß wie ihre KL-Divergenz. Aufrgund der vorher gezeigten Nicht-Negativität der KL-Divergenz ist der Ausdruck garantiert $>0$). Die beiden Bedingungen sind äquivalent, wenn $theta$ auf eine kompakte Menge beschränkt wird.

+ *Uniformes Gesetz der großen Zahlen:* Das normale Gesetz der großen Zahlen ist als "punktweise" im Hinblick auf die Punkte $tilde(theta)$ zu verstehen. Die uniforme (gleichmäßige) Version sieht wie folgt aus (vergleiche mit dem Begriff der gleichmäßigen Konvergenz): $ forall epsilon>0: bb(P) [sup_tilde(theta) abs(R_n (tilde(theta),theta)-R(tilde(theta),theta))>epsilon]->0 $

Nun sind wir gewappnet das erste fundamentale Resultat dieses Abschnitts zu beweisen, und zwar die Konsistenz des MLE:

#theorem("Konsistenz des MLE")[
Sei $X_1, ..., X_n$ eine iid-Folge von Zufallsvariablen mit $X_i tilde f(x_i|theta)$. Für die Folge gelte starke Identifizierbarkeit und uniformes GgZ. Dann ist $theta_"MLE"^n$ konsistent.
]
#proof[
Fixiere ein $epsilon > 0$. Unter Verwendung der starken Identifizierbarkeit sehen wir, dass für jedes $epsilon > 0$ ein $eta_epsilon > 0$ existiert, sodass
$ D_"KL" (f(x| theta)||f(x|tilde(theta))) >= eta_epsilon $

wenn $|tilde(theta) - theta| >= epsilon$. Wir werden zeigen, dass für $theta_"MLE"^n$ gilt, dass $D_"KL" (f(x|theta)||f(x|theta_"MLE"^n)) <= eta_epsilon$ für $n -> infinity$ in Wahrscheinlichkeit. Dies impliziert wiederum, dass $|theta_"MLE"^n - theta| <= epsilon$, was wiederum impliziert, dass $theta_"MLE"^n ->^p theta$. Es bleibt zu zeigen, dass $D_"KL" (f(x|theta)||f(x|theta_"MLE"^n)) <= eta_epsilon$, wenn $n -> infinity$. Beachte, dass

$ D_"KL" (f(x|theta)||f(x|theta_"MLE"^n)) &= R (theta_"MLE"^n,theta) = R (theta_"MLE"^n, theta) - R_n (theta_"MLE"^n, theta) + R_n (theta_"MLE"^n, theta)\ &->^p R (theta_"MLE"^n, theta) - R_n (theta_"MLE"^n, theta) ->^p 0 $

wobei die finale Konvergenz das uniforme GgZ verwendet. Die zu zeigende Ungleichung folgt, da

$ R_n (theta_"MLE"^n, theta) = 1/n sum_(i=1)^n log (f(X_i|theta))/(f(X_i|theta_"MLE"^n)) <= 0. $]

Nun wollen wir uns der asymptotischen Normalität widmen.

#definition("Fisher-Information")[Sei $f (x|theta)$ die von einem Parameter $theta$ abhängige Verteilung der Zufallsvariable $X$.
Die #underline[Fisher-Information] $I(theta)$ ist gegeben durch $ I(theta):=-bb(E)_theta [diff^2/(diff theta^2) log(f(X|theta))]. $]

#lemma()[
- $diff^2/(diff theta^2) D_"KL" (f(.|theta)||f(.|tilde(theta)))bar_(theta=tilde(theta)) = I(theta)$]
- $diff/(diff theta) D_"KL" (f(x|theta)||f(x|tilde(theta))) bar.v_(theta=tilde(theta))=0$
#proof[
Übung.
]

#lemma()[
$I(theta)=bb(E)[((diff/(diff theta))log f(X|theta))^2]$
]
#proof[
$ I(theta)&=^"def" -bb(E)_theta [diff^2/(diff theta^2) log(f(X|theta))]=-bb(E)_theta [diff/(diff theta) (diff/(diff theta) f(X|theta))/(f(X|theta))]=^"Quot.regel" bb(E)_theta [((diff^2/(diff theta^2) f(X|theta)) f(X|theta)-(diff/(diff theta) f(X|theta))^2)/f(X|theta)^2]\ &= bb(E)_theta [((diff^2/(diff theta^2) f(X|theta)) f(X|theta))/f(X|theta)^2] -bb(E)_theta [((diff/(diff theta) f(X|theta))^2)/f(X|theta)^2] = underbrace(bb(E)_theta [(diff^2/(diff theta^2) f(X|theta))/f(X|theta)], =:A) -underbrace(bb(E)_theta [((diff/(diff theta) f(X|theta))/f(X|theta))^2], =:B). $
Betrachte $A$ und $B$:\
$ A=integral (diff^2/(diff theta^2) f(x|theta))/f(x|theta) f(x|theta) dif x = integral diff^2/(diff theta^2) f(x|theta) dif x = diff^2/(diff theta^2) underbrace(integral f(x|theta) dif x, =1)=0 $
$ B=integral ((diff/(diff theta) f(x|theta))/f(x|theta))^2 f(x|theta) dif x = integral (diff/(diff theta) f(x|theta))^2 f(x|theta) dif x = bb(E)_theta [(diff/(diff theta) f(x|theta))^2] $
]

#theorem("Asymptotische Normalität des MLE")[
Wenn $theta_"MLE"^n$ konsistent, dann ist $theta_"MLE"^n$ asymptotisch normal mit $sigma_theta^2=1/I(theta)$, d.h. es gilt $ sqrt(n)(theta_"MLE"^n-theta)->^d cal(N)(0, 1/I(theta)). $
]
#proof[
siehe Notizen
]

=== Bias-Variance Zerlegung
#definition("MSE")[
$ "MSE"(tilde(theta),theta):=bb(E)[abs(tilde(theta)-theta)^2] $
]

#remark("Anwendung der Markow-Ungleichung")[
Eine mit dieser neuen Notation zur *Markow-Ungleichung* äquivalentes Resultat lautet wie folgt:
$ bb(P)[abs(tilde(theta)-theta)>epsilon]<="MSE"(tilde(theta),theta)/epsilon^2 $
]

#lemma("Bias-Variance-Zerlegung")[
$ "MSE"(tilde(theta),theta)=abs(bb(E)[tilde(theta)]-theta)^2+bb(V)[tilde(theta)] $
]
#proof[
$ "MSE"(tilde(theta),theta) &= bb(E)[abs(tilde(theta)-theta)^2]=bb(E)[(tilde(theta) - underbrace(bb(E)tilde(theta)+bb(E)tilde(theta),0)-theta)^2]\ &= underbrace(bb(E)[(tilde(theta)-bb(E)tilde(theta))^2],bb(V)tilde(theta)) + 2bb(E)[(tilde(theta) - bb(E)tilde(theta))underbrace((bb(E)tilde(theta)-theta),"konstant")]+bb(E)[underbrace((bb(E)tilde(theta)-theta),"konstant")^2]\ &= bb(V)tilde(theta) + 2(bb(E)tilde(theta)-theta)underbrace(bb(E)[tilde(theta)-bb(E)tilde(theta)],0) +abs(bb(E)tilde(theta)-theta)^2\ &= bb(V)tilde(theta)+abs(bb(E)tilde(theta)-theta)^2 $
]
#theorem("Cramer-Rao")[
Seien $X_1,...,X_n tilde^"iid" f(x|theta)$, sei $tilde(theta):bb(R)->bb(R)$ eine beliebige Statistik, $beta(theta):=bb(E)_theta [tilde(theta)]-theta$. Dann gilt:
$ bb(V)[tilde(theta)]>= (beta'(theta)+1)^2/(n dot I(theta)). $
]
#proof[
siehe Notizen
]
#remark[
- $beta(theta)$ heißt _Bias_ von $tilde(theta).$ Falls $tilde(theta)$ erwartungstreu, dann gilt $beta(theta)=0$. Daraus folgt: $ "MSE"(tilde(theta), theta)=bb(V)tilde(theta)>=1/(n dot I(theta)). $
-  Falls $theta_"MLE"^n$ erwartungstreu, dann gilt: $ lim_(n->infinity) (bb(V)[theta_"MLE"^n])/(1/(n dot I(theta)))=1, $ da aufgrund der asymptotischen Normalität des MLE gilt $bb(V)[theta_"MLE"^n]->1/(n dot I(theta))$ für $n->infinity$. Dies bezeichnet man auch als _asymptotische Optimalität_.
]

=== Suffiziente Statistiken
Ang. wir haben Daten $X_1,...,X_n tilde^"iid" f(x|theta)$ und möchten $theta$ schätzen. Können wir die Daten reduzieren, ohne Information über $theta$ zu verlieren?

#definition("Suffizienz einer Statistik")[
Eine Statistik $T:bb(R)^n->bb(R)$ heißt suffizient für $theta$, falls
für alle $(x_1,...,x_n)in bb(R)^n$, $t in bb(R)$:$ bb(P)[X_1<=x_1,...,X_n<=x_n|T=t] "ist unabhängig von " theta. $
]
#remark[
- Die Definition ist so zu interpretieren, dass falls wir $t=T(x_1,...,x_n)$ kennen, dann hat weitere Kenntniss von $X_1,...,X_n$ keinen zusätzlichen Informationsgehalt mehr bzgl. $theta$.
- Man kann zeigen: $ "T suffizient" arrow.l.r.double I(theta, T(X_1,...,X_n))=I(theta,X_1,...,X_n), $ wobei $I$ in diesem Falls als eine "Mutual Information" zu deuten ist.
]
#theorem("Fisher-Neyman-Faktorisierung")[
Für $g:bb(R) times bb(R) -> bb(R)$, $h:bb(R)^n -> bb(R)$ gilt: $ T "ist suffizient für " theta arrow.l.r.double f(x_1,...,x_n|theta)=g(T(x_1,...,x_n)|theta) dot h(x_1,...,x_n). $ In Worten: $T$ ist genau dann suffizient, wenn eine Faktorisierung in $g dot h$ existiert, wobei $g$ von T abhängen kann, $h$ aber nur von der Stichprobe $x_1,...,x_n$.
]
#proof[
siehe Notizen
]

=== Bedingte Erwartung
#definition("Bedingte Wahrscheinlichkeit, bedingte Erwartung")[

]

=== Konfidenzintervalle
=== Bayessche Schätzung

== 2 Hyptothesentests


= Data Science

== Lineare Regression
== Statistical learning theory
== Maschinelles Lernen
=== Perceptron Algorithmus
=== Logistische Regression
=== Kernelization
=== PCA
=== Johnson-Lindenstrauss Lemma
=== Graphen
=== Clustering
=== Spektrale Graphentheorie
=== Fourier Transformation
