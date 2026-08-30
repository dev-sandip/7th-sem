#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1.5cm),
  columns: 2, 
  header: align(right)[*DSAP Formula Sheet*],
  footer: align(center)[#context counter(page).display()]
)
#set text( size: 10pt)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 16pt, weight: "bold")
#show heading.where(level: 2): set text(size: 12pt, weight: "bold", fill: rgb(0, 50, 150))
#show math.equation: set block(spacing: 0.7em)

= DSAP Formula Sheet
*Author:* *_Sandip Sapkota_*
#v(0.5em)

== Chapter 2

#block(breakable: false)[
  #align(center)[
    #table(
      columns: 3,
      inset: (x: 10pt, y: 8pt),
      align: center + horizon,
      stroke: none,
      table.hline(y: 0, stroke: 1pt),
      table.hline(y: 1, stroke: 0.5pt),
      table.hline(y: 4, stroke: 1pt),
      table.header(
        [*$x[n]$*], [*$X(z)$*], [*ROC*],
      ),
      [$delta[n]$],
      [$ 1 $],
      [All $z$-plane],
      [$alpha^n u[n]$],
      [$ frac(1, 1-alpha z^(-1)) $],
      [$|z| > alpha$],
      [$-alpha^n u[-n-1]$],
      [$ frac(1, 1-alpha z^(-1)) $],
      [$|z| < alpha$]
    )
  ]
]

== Chapter 3
Phase:
$ angle H(omega) = tan^(-1)[frac(r sin(omega-theta), 1-r cos(omega-theta))] $

Magnitude:
$ |H(omega)|^2 = 10 log[1+r^2 - 2r cos (omega-theta)] $

== Chapter 4

$ H(z) = frac(sum_(k=0)^M b_k z^(-k), 1 + sum_(k=1)^N a_k z^(-k)) $

$ a_(m-1) = frac(a_m(k)-a_m(m)a_m(m-k), 1-a_m^2(m)) $

$ c_m = b_m - sum_(i=m+1)^M c_i a_i (i-m) $

== Chapter 5
*Ideal Low Pass Filter:*
$ h_d [n] = cases(
  2F_c op("sinc")(omega_c n) quad &"for" n != 0,
  2F_c quad &"for" n = 0
) $

#block(breakable: false)[
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      align: center + horizon,
      stroke: none,
      inset: (x: 6pt, y: 8pt),
      table.hline(y: 0, stroke: 1pt),
      table.hline(y: 1, stroke: 0.5pt),
      table.hline(y: 4, stroke: 1pt),
      table.header(
        [*Window*], 
        [*$w[n]$* \ $(0 <= n <= N-1)$], 
        [*Stopband*], 
        [*Window Length*]
      ),
      [Rect], [$ 1 $], [$21 "dB"$], [$ frac(0.9, Delta F) $],
      [Hann], [$ 0.5 - 0.5 cos(frac(2 pi n, N - 1)) $], [$44 "dB"$], [$ frac(3.1, Delta F) $],
      [Hamm], [$ 0.54 - 0.46 cos(frac(2 pi n, N - 1)) $], [$53 "dB"$], [$ frac(3.3, Delta F) $]
    )
  ]
]

=== Kaiser Window

*Step 1:*
$ delta_s = 10^(-0.05 alpha_s) $
$ delta_p = frac(10^(-0.05 alpha_p) - 1, 10^(-0.05 alpha_p) + 1) $

*Step 2:*
$ alpha = -20 log(delta) $

*Step 3:*
$ beta = cases( 
  0.1102 (alpha - 8.7) &"for" alpha > 50,
  0.5842(alpha - 21)^0.4 \ + 0.07886(alpha - 21) &"for" 21 <= alpha <= 50,
  0 &"for " alpha < 21
) $

*Step 4:*
$ M = frac(alpha - 8, 2.285 Delta omega) $

*Step 5:*
$ w_k[n] = cases(
  frac(I_0 (beta sqrt(1 - ((2n)/(M-1))^2)), I_0 (beta)) quad &"for" 0 <= n <= M,
  0 quad &"otherwise"
) $

$ I_0(beta) = 1 + sum_(k=1)^oo [ frac((0.25beta)^k, k!) ]^2 $

== Chapter 6
=== Butterworth Filter Design

*Step 1: Required Parameters*
- $omega_p$: Passband edge freq.
- $omega_s$: Stopband edge freq.
- $alpha_p$: Passband attenuation (dB)
- $alpha_s$: Stopband attenuation (dB)

*Step 2: Transformation Technique*
For IIM (Impulse Invariance):
$ Omega = omega/T $ 
For BLT (Bilinear Transform):
$ Omega = 2/T tan(omega/2) $

*Step 3: Filter Order ($N$)*
$ N >= frac(log((10^(0.1 alpha_s) - 1) / (10^(0.1 alpha_p) - 1)), 2 log(Omega_s / Omega_p)) $

*Step 4: Cutoff Frequency ($Omega_c$)*
$ Omega_c = frac(Omega_p, (10^(0.1 alpha_p) - 1)^(1/(2N))) $

*(If $Omega_c$ is directly given:)*
- For IIM: $ Omega_c = omega_c/T $ 
- For BLT: $ Omega_c = 2/T tan(omega_c/2) $

*Step 5: Evaluate Pole Pair*
$ P_i = +- Omega_c e^(j(N+2i+1)pi/(2N)) $

*Step 6: Transfer Function*
Choose only left-half plane poles for stability:
$ H_a (s) = (Omega_c^N)/((s-P_1) dots.c (s-P_N)) $

*Step 7: Digital Conversion*
Convert $H_a(s)$ using IIM or BLT to find $H(z)$.