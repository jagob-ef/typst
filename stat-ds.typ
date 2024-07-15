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
Seien $X$, $Y$ diskrete Zufallsvariablen. $ bb(P)[Y=j, X=i]:= (bb(P)[Y=j,X=i])/(bb(P)[X=i]), $ $ bb(E)[Y|X=i]:=sum_j j dot bb(P)[Y=j|X=i]=sum_j j dot (bb(P)[Y=j,X=i])/(bb(P)[X=i]), $ $ bb(E)[Y|X]:=sum_i bb(E)[Y|X=i] dot bb(1)_{X=i}. $ $bb(E)[Y|X=i]$ ist eine reelle Zahl, $bb(E)[Y|X]$ hingegen eine Zufallsvariable welche den Wert $bb(E)[Y|X=i]$ annimmt genau dann wenn $X(omega)=i$.
]

#lemma[
- $bb(E)[bb(E)[Y|X]]=bb(E)[Y]$
- $bb(V)[Y] = bb(E)[bb(V)[Y|X]]+bb(V)[bb(E)[Y|X]]$
- $bb(E)[g(Y)|X]$ ist Funktion von $X$
- $X$, $Y$ unabhängig $arrow.double bb(E)[g(Y)|X]=bb(E)[g(Y)]$
]
#proof[

]
Wir widmen uns nun einem Resultat, mit dem man aus einem zunächst beliebigem (bzw. beliebig schlechtem) Schätzer durch eine Transformation einen in gewissem Sinne "optimalen" Schätzer konstruieren kann.

#theorem("Rao-Blackwell")[
Sei $X_1,...,X_n tilde^"iid" f(X|theta)$,  $tilde(theta)$ ein beliebiger erwartungstreuer Schätzer für $theta$ und $T$ eine suffiziente Statistik für $theta$. Sei $theta^* :=bb(E)[tilde(theta)|T]$. Dann gilt:
- $theta^*$ ist erwartungstreuer Schätzer
- $"MSE"(theta^*,theta)<="MSE"(tilde(theta), theta)$.
Die Transformation von $tilde(theta)$ durch den Ausdruck $theta^*$ wird oft "Rao-Blackwellization" genannt. Das Resultat garantiert, das der MSE nach der Transformation kleiner wird - durch dieses Verfahren erhalten wir also einen besseren Schätzer!
]
#proof[
+ $theta^*$ ist erwartungstreuer Schätzer: $bb(E)[theta^*]=bb(E)[bb(E)[tilde(theta)|T]]=bb(E)[tilde(theta)]=theta$, womit Erwartungstreue gilt. Wir müssen noch überprüfen, ob $theta^*$ tatsächlich ein Schätzer ist. Eine Statistik ist Schätzer eines Parameters $theta$, wenn sie unabhängig von $theta$ ist. Wir überprüfen: $ theta^* =^"def" bb(E)[tilde(theta)|T]=integral tilde(theta)(x) dot underbrace(f(x|T), "unabh. von" theta) dif x. $
+ Da $tilde(theta)$ bzw. $theta^*$ erwartungstreu sind, erhalten wir mittels Bias-Variance-Zerlegung $"MSE"(tilde(theta), theta)=bb(V)[tilde(theta)]$ bzw. $"MSE"(theta^*, theta)=bb(V)[theta^*]$. Nun gilt nach vorherigen Lemma: $ bb(V)[tilde(theta)]&=bb(V)[underbrace(bb(E)[tilde(theta)|T],theta^*)]+bb(E)[bb(V)[tilde(theta)|T]]\ arrow.l.r.double bb(V)[theta^*] &= bb(V)[tilde(theta)]-bb(E)[bb(V)[tilde(theta)|T]]<= bb(V)[tilde(theta)], $ wobei die Ungleichung dadurch gerechtfertigt ist, dass die (bedingte) Varianz und somit ihr Erwartungswert stets nichtnegativ ist.
]

#example[
+ Für nicht-suffiziente Statistiken $T$ ist liefert das Resultat nicht unbedingt einen Schätzer:\ Seien $X_1,...,X_n tilde^"iid" cal(N)(theta,1)$, $tilde(theta):=1/2(X_1+X_2)$ und $T(X):=X_1$ eine nicht-suffiziente Statistik. $T$ ist nicht suffizient, da für die gemeinsame Verteilung $f(x_1,...,x_n|theta)$ von $X_1,...,X_N$ gilt: $ f(x_1,...,x_n|theta)=product_(i=1)^n f(x_i|theta)&=product_(i=1)^n 1/sqrt(2pi) dot exp(-(x_i-theta)^2/(2))=(2pi)^(-n/2) dot exp(-1/2 sum_(i=1)^n (x_i-theta)^2)\ &=(2pi)^(-n/2) dot exp(-1/2 sum_(i=1)^n (x_i^2-2x_i theta+theta^2))\ &= (2pi)^(-n/2) dot exp(-1/2 sum_(i=1)^n x_i^2) dot exp(theta sum_(i=1)^n x_i) dot exp(-1/2 n theta^2) $ Wir finden für unser T keine gültigen $g(T(X_1,...,X_n,theta))$, $h(X_1,...,X_n)$ mit $f=g dot h$. (Bemerke: Für $U(X_1,...,X_n):=sum_(i=1)^n X_i$ gäbe es eine solche Faktorisierung, und zwar: $ f=underbrace((2pi)^(-n/2) dot exp(-1/2 sum_(i=1)^n x_i^2), h(X_1,...,X_n)) dot underbrace(exp(theta sum_(i=1)^n x_i) dot exp(-1/2 n theta^2), g(U,theta)), $ d.h. U wäre suffizient).\ Wir wollen also versuchen, $tilde(theta)$ mit Hilfe von $T$ zu verbessern. Wir erhalten durch Rao-Blackwellization: $ theta^*=bb(E)[tilde(theta)|T]=bb(E)[1/2(X_1+X_2)|T]=1/2(underbrace(bb(E)[X_1|X_1],=X_1\ "siehe"\ "Def bed. Erw.")+underbrace(bb(E)[X_2|X_1],=bb(E)[X_2]\ "weil" X_1\, X_2\ "unabh."))=1/2 X_1 +1/2 theta. $ $theta^*$ ist erwartungstreu, da: $ bb(E)[theta^*]=bb(E)[1/2 X_1 +1/2 theta]=1/2 bb(E)[X_1]+1/2 theta= 1/2 theta +1/2 theta=theta. $ Außerdem gilt: $ bb(V)[theta^*]=bb(V)[1/2 X_1 +1/2 theta]=bb(V)[1/2 X_1]=1/4 < 1/2=1/4 (1+1)=bb(V)[1/2 (X_1+X_2)]=bb(V)[tilde(theta)]. $ *Aber*: $theta^*$ ist #underline("kein") Schätzer, da der Ausdruck nicht unabhängig von $theta$ ist.
]

=== Konfidenzintervalle
In diesem Abschnitt wollen wir Konfidenzintervalle konstruieren. Dafür suchen wir für eine gegebene Verfeilungsfunktion $ F_X:bb(R) &arrow.r.long[0,1]\ x &arrow.r.bar.long bb(P)[X<=x]=:F_X (x) $ eine Art Inverse.

#definition("Quantilsfunktion")[
$ F_X^-:(0,1) &arrow.r.long bb(R)\ alpha &arrow.r.bar.long inf{t in bb(R) | F_X (t)>=alpha}=:F_X^- (alpha) $ heißt Quantilsfunktion von $X$, $ q_alpha:=F_X^- (alpha) $ heißt $alpha$-Quantil.
]
Dies ist also quasi eine Umkehrfunktion von $F_X$. Aber warum so umständlich? Es wäre doch naheliegender, die Quantilsfunktion als $F_X^(-1)({alpha})$ im Sinne des Urbildes oder noch besser gleich als $F_X^(-1)(alpha)$ im Sinne einer Umkehrfunktion zu definieren? Nun, dass eine Funktion nicht unbedingt eine Umkehrfunktion besitzt ist einleuchtend, also wäre die zweite Option wohl zu optimistisch. Die erste Variante, bei der wir vom Urbild von $F_X$ Gebrauch machen, ist faktisch unsere Definition der Quantilsfunktion, nur garantieren wir mit dieser Definition zusätzlich, dass wir einen eindeutigen Wert erhalten. In der VO haben wir gesehen, dass die Quantilsfunktion der Bernoulliverteilung sonst nicht eindeutig wäre, da sie stückweise konstant ist.

Für die Definition eines Konfidenzintervalls brauchen wir den Begriff des *Intervallschätzers*. Im Gegensatz zu den uns bereits bekannten _Punktschätzern_ geben diese Intervalle $[a(X),b(X)]$ aus, in denen der Wert $theta$ mit hoher Wahrscheinlichkeit liegen soll.

#definition("Intervallschätzer")[
Ein Intervallschätzer ist eine Funktion $ cal(X)^n &arrow.r.long cal(I)(bb(R))\ X &arrow.r.bar.long [a(X),b(X)], $ wobei $cal(X)^n$ den Wertebereich der Zufallsvariablen $X=(X_1,...,X_n)$ und $cal(I)(bb(R))$ die Menge der Intervalle aus $bb(R)$ bezeichnet.
]

#definition("Konfidenzintervall")[
Sei $X arrow.r.bar.long [a(X),b(X)]$ ein Intervallschätzer, $X tilde f(x|theta)$ einer von $theta$ abhängigen Verteilung folgend. Falls $ bb(P)_theta [a(X)<=theta<=b(X)]=gamma $ für alle $theta in Theta$, so heißt $[a(.),b(.)]$ ein $100gamma$%-iges Konfidenzintervall.  
]

#example[
Seien $X_1,...,X_n tilde^"iid" cal(N)(mu, sigma^2)$, $sigma^2$ bekannt, $mu$ unbekannt. Bestimme ein $100gamma$%-iges Konfidenzintervall für $mu$.

Betrachte $ overline(X)=1/n sum_(i=1)^n X_i tilde cal(N)(mu, sigma^2/n). $ Durch Standardisierung erhalten wir $ ((overline(X)-mu)sqrt(n))/(sigma) tilde cal(N)(0,1), $ wofür wir mittels Technologieeinsatz die Quantilen $z_((1-gamma)/2)$ und $z_(gamma+(1-gamma)/2)=z_((1+gamma)/2)$ errechnen können (siehe VO Notizen für Skizze). Somit gilt: $ &bb(P)[z_((1-gamma)/2)<= ((overline(X)-mu)sqrt(n))/(sigma)<=z_((1+gamma)/2)]=gamma\ arrow.l.r.double &bb(P)[sigma/sqrt(n) dot z_((1-gamma)/2)-overline(X) <= -mu <= sigma/sqrt(n) dot z_((1+gamma)/2)-overline(X)]=gamma\ arrow.l.r.double &bb(P)[-sigma/sqrt(n) dot z_((1+gamma)/2)+overline(X) <= mu <= -sigma/sqrt(n) dot z_((1-gamma)/2)+overline(X)]=gamma\ arrow.l.r.double &bb(P)[-sigma/sqrt(n) dot z_((1+gamma)/2)+overline(X) <= mu <= sigma/sqrt(n) dot z_((1+gamma)/2)+overline(X)]=gamma, $ wobei wir in der letzten Zeile verwendet haben, dass $z_((1-gamma)/2)=-z_((1+gamma)/2)$. Somit haben wir eine explizite Formel zur Berechnung des Konfidenzintervalls!
]
Die Zufallsvariable $((overline(X)-mu)sqrt(n))/(sigma)$ war in diesem Beispiel maßgeblich, um das Konfidenzintervall explizit anschreiben zu können. Diese Zufallsvariable ist ein Beispiel für eine sogenannte _Pivot-Zufallsvariable_.

#definition("Pivot")[
Seien $X_1,...,X_n tilde"iid" f(x|theta), x_i in cal(X), theta in Theta$. Eine Funktion $g:cal(X)^n times Theta arrow.r.long bb(R)$ heißt *Pivot*, falls:
+ $theta arrow.r.bar g(x_1,...,x_n,theta)$ stetig ist für alle $(x_1,...,x_n) in cal(X)^n$ und
+ Die Verteilung von $g(X_1,...,X_n,theta)$ nicht von $theta$ abhängt.
]
Unsere obige Zufallsvariable ist sicherlich stetig in $mu$ und ihre Verteilung $cal(N)(0,1)$ hängt offensichtlich nicht von $mu$ ab, also ist sie ein Pivot.

Mit diesem Begriff lässt sich eine *generelle Vorgehensweise* zum Auffinden von Konfidenzregionen erklären:
+ Finde Pivot-Zufallsvariable $g(X_1,...,X_n,theta)$
+ Bestimme Quantile $q_1$ und $q_2$ mit $bb(P)[q_1<=g(X_1,...,X_n,theta)<=q_2]=gamma$
+ $C:={theta:g(X_1,...,X_n,theta)in[q_1,q_2]}$ ist $100gamma$%-ige Konfidenzregion. Falls g affin, dann ist $C$ ein Intervall.

Der letzte Schritt entspricht in der Praxis dem Umformen der Ungleichung $q_1<=g(X_1,...,X_n,theta)<=q_2$ nach $theta$, so wie wir es in obigem Beispiel gemacht haben.

#proposition("Student-t-Verteilung")[
Seien $X_1,...,X_n tilde^"iid" cal(N)(mu, sigma^2)$, $sigma^2$ unbekannt, $mu$ unbekannt. Dann ist $ T:=(overline(X)-mu)sqrt(n)/S tilde t_(n-1) $ eine Pivot-Zufallsvariable, die einer Student-t-Verteilung mit $n-1$ Freiheitsgraden folgt. $S^2:=1/(n-1) sum_(i=1)^n (X_i-overline(X))^2$ bezeichnet die Stichprobenvarianz.
]

Im Allgemeinen existieren Pivots nicht in praktikable Form. Daher bedienen wir uns einer asymptotischen Variante:

#definition("Asymptotischer Pivot")[
Seien $X_1,...,X_n tilde^"iid"f_theta$. $g:cal(X)^n times Theta arrow.r.long bb(R)$ heißt asymptotischer Pivot, falls:
+ $theta arrow.r.bar g(x_1,...,x_n,theta)$ stetig ist für alle $n in bb(N)$, $(x_1,...,x_n) in cal(X)^n$ und
+ $g(X_1,...,X_n,theta)$ konvergiert in Verteilung für $n->infinity$ gegen eine Verteilung, die nicht von $theta$ abhängt.
]
Nun lautet hier die Vorgehensweise:
+ Bestimme Quantile $q_1$, $q_2$ mit $lim_(n->infinity)bb(P)[q_1<=g(X_1,...,X_n,theta)<=q_2]=gamma$
+ $C_n:={theta:g(X_1,...,X_n,theta)in[q_1,q_2]} arrow.double lim_(n->infinity)bb(P)[theta in C_n]=gamma$

=== Bayessche Schätzung
tba (siehe Notizen Tauböck 10.4.)

=== Hoeffding-Ungleichung
Das Resultat dieses kurzen Abschnitts, die _Hoeffding-Ungleichung_, hat gar nicht so viel mit Statistik bzw. dem nächsten Kapitel _Hypothesentests_ zu tun, aber ist generell relevant und wird für uns später noch von Bedeutung sein. Bevor wir die eigentliche Ungleichung beweisen, zeigen wir noch ein Hilfsresultat:

#lemma("Hoeffding")[
Sei $a<=X<=b$, $bb(E)[X]=0$. Dann gilt für alle $lambda>0$: $ bb(E)[e^(lambda X)]<=e^((lambda^2(b-a)^2)/8) $
]
#proof[
Da $f(x)=e^(lambda x)$ eine konvexe Funktion ist, gilt für jedes $alpha in(0,1)$ und $x in [a, b]$,
$ f(x) <= alpha f(a)+(1-alpha) f(b). $

Wenn wir $alpha=(b-x)/(b-a) in [0,1]$ setzen, erhalten wir
$ e^(lambda x) <= (b-x)/(b-a) e^(lambda a)+(x-a)/(b-a) e^(lambda b). $

Wenn wir den Erwartungswert nehmen, erhalten wir
$ bb(E)[e^(lambda X)] <= (b-bb(E)[X])/(b-a) e^(lambda a)+(bb(E)[X]-a)/(b-a) e^(lambda b)=(b)/(b-a) e^(lambda a)-(a)/(b-a) e^(lambda b), $
wobei wir die Tatsache verwendet haben, dass $bb(E)[X]=0$. Bezeichnen wir $h=lambda(b-a), p=(-a)/(b-a)$ und $L(h)=-h p+log (1-p+p e^h)$. Dann kann der Ausdruck auf der rechten Seite der obigen Gleichung als $e^(L(h))$ umgeschrieben werden. Um unseren Beweis abzuschließen, genügt es zu zeigen, dass $L(h) <= (h^2)/(8)$. Dies folgt aus dem Satz von Taylor unter Verwendung der Tatsachen: $L(0)=L'(0)=0$ und $L''(h) <= 1 / 4$ für alle $h$.
]

#theorem("Hoeffding-Ungleichung")[
Seien $X_1,...,X_n$ unabhängig, $a<=X_i<=b$ fast sicher, $S_n:=sum_(i=1)^n X_i$. Dann gilt: $ bb(P)[abs(S_n-bb(E)S_n)>=t]<=exp((-2t^2)/(sum_(i=1)^n (b_i-a_i)^2)). $
]
#proof[
Sei $X_i=Z_i-bb(E)[Z_i]$ und $overline(X)=1/m sum_i X_i$. Unter Verwendung der Monotonie der Exponentialfunktion und der Markov-Ungleichung haben wir für jedes $lambda>0$ und $epsilon>0$,
$ bb(P)[overline(X) >= epsilon]=bb(P)[e^(lambda overline(X)) >= e^(lambda epsilon)] <= e^(-lambda epsilon) bb(E)[e^(lambda overline(X))]. $ Unter Verwendung der Unabhängigkeitsannahme haben wir auch $ bb(E)[e^(lambda overline(X)_1)]=bb(E)[product_i e^(lambda X_i / m)]=product_i bb(E)[e^(lambda X_i / m)]. $ Nach dem Lemma von Hoeffding gilt für jedes $i$ $ bb(E)[e^(lambda X_i / m)] <= e^(lambda^2(b-o)^2)/(5 m^2). $ Daher gilt: $ bb(P)[overline(X) >= epsilon] <= e^(-lambda epsilon) product_i e^((lambda^2 (b-a)^2)/(8 m^2)) = e^((-lambda epsilon + lambda^2 (b-a)^2)/(8 m)). $ Setzt man $lambda = (4m epsilon)/((b-a)^2)$, so erhalten wir $ bb(P)[overline(X) >= epsilon] <= e^(-(2m epsilon^2)/((b-a)^2)). $ Wendet man die gleichen Argumente auf die Variable $-overline(X)$ an, erhalten wir $bb(P)[overline(X) <= -epsilon] <= e^(-(2m epsilon^2)/((b-a)^2))$. Der Satz folgt durch Anwendung Union Bounds auf die beiden Fälle.
]


== 2 Hyptothesentests
#example("Münzwurf")[

]

#example("Higgs-Boson")[

]

Generelles Setting: $X_1,...,X_n tilde f(x|theta)$, $theta in Theta$, $Theta_0, Theta_1 subset Theta$, $Theta_0 sect Theta_1 = nothing$.\
Nullhyptothese: $theta in Theta_0$ ... $H_0$\
Alternativhypothese: $theta in Theta_1$ ... $H_1$

In der Regel wird die Nullhypothese $H_0$ als die "wahrscheinlichere" oder als die zu widerlegende Aussage gewählt. Es handelt sich dabei meist um die Aussage, dass es keinen Effekt oder Unterschied gibt, also um den Status quo oder eine bekannte Standardannahme.

#definition("Testfunktion")[
Eine Testfunktion bzw. Entscheidungsfunktion ist eine Funktion $ delta:cal(X)^n arrow.r.long (0,1}. $ Üblicherweise greift sie auf eine Statistik $T$ zurück und ist dann wie folgt definiert: $ delta(x_1,...x_n):= cases(1 quad "falls" T(x_1,...x_n) in C, 0 quad "falls" T(x_1,...x_n) in.not C)=bold(1)_{T(x_1,...x_n) in C} $
]

#definition("Fehler 1. Art, Fehler 2. Art")[
#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [$H_0$ stimmt], [$H_1$ stimmt],
  ),
  "Test sagt 0", "", "Fehler 2. Art",
  "Test sagt 1", "Fehler 1. Art",
)
]
#definition("Fehlerwahrscheinlichkeit 1. & 2. Art")[\
$h(theta):=bb(P)_theta [delta=1]$ mit $theta in Theta_0$ heißt Fehlerwahrscheinlichkeit 1.Art,\
$g(theta):=bb(P)_theta [delta=0]$ mit $theta in Theta_1$ heißt Fehlerwahrscheinlichkeit 2. Art.
]

#example[
$X_1,...X_n tilde^"iid" cal(B)(p)$, $H_0: p=1/2$, $H_1: p != 1/2$ ...siehe Notizen
]

#definition("Neyman-Pearson-Framework")[
Fixiere Signifikantniveau $alpha in (0,1)$ und definiere: $ cal(D)(Theta_0,alpha):={delta:cal(X)^n arrow.long {0,1}:quad sup_(theta in Theta_0) bb(P)_theta [delta=1]<=alpha}. $ Dies sind also jene Testfunktionen, deren Fehlerwahrscheinlichkeit 1. Art kleiner gleich $alpha$ ist.] 

In dieser Menge suchen wir nun nach Tests, die die Fehlerwahrscheinlichkeit 2. Art minimieren. Formal: $ inf_(delta in cal(D)(Theta_0,alpha)) quad sup_(theta in Theta_1)bb(P)[delta=0]. $ Dies führt unmittelbar zu folgenden Begriff:

#definition("Optimalität eines Tests")[
Ein Test $delta$ heißt optimal zum Niveau $alpha$, falls:
+ $delta in cal(D)(Theta_0,alpha)$ und
+ Für alle $psi in cal(D)(Theta_0,alpha)$, $theta in Theta_1$ gilt $bb(P)_theta [delta=0] <= bb(P)_theta [psi=0]$, d.h. die Fehlerwahrscheinlichkeit 2. Art ist für $delta$ minimal.
]

#definition("Einfacher Test")[
Ein Test heißt einfach, falls $Theta_0={theta_0}$, $Theta_1={theta_1}$, wobei $theta_0 != theta_1$.
]

#lemma("Neyman-Pearson")[
Seien $H_0: theta=theta_0$, $H_1: theta=theta_1$, $theta_0 != theta_1$, $alpha$ ein Signifikanzniveau. Dann ist der Test $ delta(x_1,...,x_n):=bold(1)_{Lambda(x_1,...,x_n)>=Q}, $ wobei $ bb(P)_theta_0 [Lambda>Q]=alpha, quad Lambda(x_1,...,x_n):=f(x_1,...,x_n|theta_1)/f(x_1,...,x_n|theta_0)=(cal(l)(theta_1))/(cal(l)(theta_0)), quad Q>0 $ optimal zum Niveau $alpha$. Der Quotient $Lambda$ bzw. $bold(1)_{Lambda>Q}$ wird *Likelihood-Ratio* bzw. Likelihood-Ratio-Test genannt.
]
#proof[
Wir zeigen Optimalität:
+ $delta in cal(D)(Theta_0,alpha)$:\ Nach Konstruktion von $delta$ ist $bb(P)_theta_0 [Lambda>Q]=alpha arrow.l.r.double bb(P)_theta_0 [delta=1]=alpha$. Da $Theta_0={theta_0}$, gilt $sup_(theta in Theta_0)bb(P)_theta [delta=1]=alpha$, d.h. $delta in cal(D)(Theta_0,alpha)$.
+ Wir müssen zeigen: Für alle $psi in cal(D)(Theta_0,alpha)$, $theta in Theta_1$ gilt $ &bb(P)_theta [delta=0] <= bb(P)_theta [psi=0]\ arrow.l.r.double &1-bb(P)_theta [delta=1] <= 1-bb(P)_theta [psi=1]\ arrow.l.r.double &bb(P)_theta [delta=1] >= bb(P)_theta [psi=1]\ arrow.l.r.double &bb(P)_theta_1 [delta=1] >= bb(P)_theta_1 [psi=1], $ wobei der letzte Schritt wegen $Theta_1={theta_1}$ folgt.\ Sei $psi in cal(D)(Theta_0,alpha)$. Wir haben: $ cases(f(X|theta_1)/f(X|theta_0)>Q arrow.l.r.double delta=1, f(X|theta_1)/f(X|theta_0)<=Q arrow.l.r.double delta=0) arrow.l.r.double cases(f(X|theta_1)-Q dot f(X|theta_0)>0 arrow.l.r.double delta=1, f(X|theta_1)-Q dot f(X|theta_0)<=0 arrow.l.r.double delta=0). $ Daraus folgt: $ f(X|theta_1)-Q dot f(X|theta_0)<=delta(x) dot (f(X|theta_1)-Q dot f(X|theta_0))\ arrow.r.double psi(x) dot (f(X|theta_1)-Q dot f(X|theta_0))<=delta(x) dot (f(X|theta_1)-Q dot f(X|theta_0))\ arrow.r.double integral_(cal(X)^n) psi(x) dot (f(X|theta_1)-Q dot f(X|theta_0)) dif x <= integral_(cal(X)^n) delta(x) dot (f(X|theta_1)-Q dot f(X|theta_0)) dif x\ arrow.l.r.double integral_(cal(X)^n) (psi(x)-delta(x)) dot f(X|theta_1) dif x <= Q dot integral_(cal(X)^n) (psi(x)-delta(x)) dot f(X|theta_0) dif x\ arrow.l.r.double bb(E)_(theta_1)[psi]-bb(E)_(theta_1)[delta] <= Q dot (bb(E)_(theta_0)[psi]-bb(E)_(theta_0)[delta]). $ Da $psi$ und $delta$ bernoulliverteilt sind (sie nehmen nur Werte in ${0,1}$ an), gilt für die Erwartungswerte: $ bb(P)_(theta_1)[psi=1]-bb(P)_(theta_1)[delta=1] <= Q dot (underbrace(bb(P)_(theta_0)[psi=1],<=alpha)-underbrace(bb(P)_(theta_0)[delta=1],alpha))\ arrow.l.r.double bb(P)_(theta_1)[psi=1]-bb(P)_(theta_1)[delta=1] <=0\ arrow.l.r.double bb(P)_(theta_1)[psi=1]<=bb(P)_(theta_1)[delta=1], $ womit $delta$ optimal ist.
]

#example[
Seien $X_1,...,X_n tilde^"iid" cal(N)(mu, sigma^2)$ mit $sigma^2$ bekannt. Sei $H_0: mu = mu_0$, $H_1: mu = mu_1$, $mu_1>mu_0$. Für die Likelihood-Ratio bekommen wir: $ Lambda(x)=f(x|mu_1,sigma^2)/f(x|mu_0,sigma^2) &= (product_(i=1)^n 1/sqrt(2pi sigma^2) dot exp(-(x_i-mu_1)^2/(2sigma^2)))/(product_(i=1)^n 1/sqrt(2pi sigma^2) dot exp(-(x_i-mu_0)^2/(2sigma^2)))\ &= (exp(-sum_(i=1)^n (x_i-mu_1)^2/(2sigma^2)))/(exp(-sum_(i=1)^n (x_i-mu_0)^2/(2sigma^2))) = exp(-1/(2sigma^2) sum_(i=1)^n ((x_i-mu_0)^2-(x_i-mu_1)^2))\ &= exp(-1/(2sigma^2) sum_(i=1)^n (cancel(x_i^2)-2x_i mu_0 +mu_0^2-cancel(x_i^2)+2x_i mu_1-mu_1^2))\ &= exp(-1/(sigma^2)(mu_1-mu_0) sum_(i=1)^n x_i - n/(2sigma^2) (mu_0^2-mu_1^2))\ &= exp(-n/(sigma^2) (underbrace((mu_1-mu_0),>0) 1/n sum_(i=1)^n x_i - (mu_0^2-mu_1^2))). $ Wir sehen also, dass $Lambda$ lediglich von $overline(X)$ abhängt, und zwar direkt proportional, d.h. $ Lambda(x)>Q arrow.l.r.double overline(X)>c $ für ein gewisses $c$. Dieses $c$ muss $bb(P)_mu_0[overline(X)>c]=alpha$ erfüllen, d.h. wir können die Verteilung von $overline(X)$ unter $mu_0$ bzw. deren Quantile verwenden, um $c$ explizit anzugeben: $ overline(X) tilde cal(N)(mu_0,sigma^2/n) &arrow.r.double (sqrt(n)(overline(X)-mu_0))/sigma tilde cal(N)(0,1)\ &arrow.r.double_(bb(P)_mu_0[overline(X)>c]=alpha \ arrow.l.r.double bb(P)_mu_0[overline(X)<=c]=1-alpha) c:=z_(1-alpha), $ wobei $z_(1-alpha)$ das $(1-alpha)$-Quantil der Standardnormalverteilung bezeichnet.\

Zusammenfassend können wir also durch $bold(1)_{Z>z_(1-alpha)}$ mit $Z:= (sqrt(n)(overline(X)-mu_0))/sigma$ einen Test angeben, der mit Signifikanzniveau $alpha$ eine Aussage über $H_0: mu = mu_0$ macht.\
]

#remark[
- Der soeben konstruierte Test hängt nicht von $mu_1$ ab, d.h. wir können als Alternativhypothese auch ein beliebiges anderes $mu_2$ mit $mu_2>mu_0$ angeben.
- Falls $mu_2<mu_0$, dann ist die Abhängigkeit zwischen $Lambda$ und $overline(X)$ nicht direkt sondern indirekt proportional, d.h. $ Lambda(x)>Q arrow.l.r.double overline(X)<=c. $ Wir können in diesem Fall analog einen Test $bold(1)_{Z<=z_alpha}$ konstruieren.
- Es gibt keinen optimalen Test für $H_0:mu=mu_0$, $H_1:mu!=mu_0$ (in VO unbegründet).
]

#theorem[

]
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
